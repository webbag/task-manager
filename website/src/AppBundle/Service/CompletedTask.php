<?php


namespace AppBundle\Service;


use AppBundle\Entity\Task;
use Doctrine\Bundle\DoctrineBundle\Registry;

/**
 * Class CompletedTask
 * @package AppBundle\Service
 */
class CompletedTask
{
    /**
     * @var Registry
     */
    protected $doctrine;
    /**
     * @var int
     */
    protected $countClose = 0;
    /**
     * @var int
     */
    protected $countNew = 0;
    /**
     * @var int
     */
    protected $countOpen = 0;
    /**
     * @var int
     */
    protected $countAll = 0;
    /**
     * @var int
     */
    protected $completedPercent = 0;

    /**
     * CompletedTask constructor.
     * @param Registry $doctrine
     */
    public function __construct(Registry $doctrine)
    {
        $this->doctrine = $doctrine;
        $this->init();
        $this->setPercentCompleted();
    }

    protected function init()
    {
        $tasks = $this->doctrine->getRepository(Task::class)->findAll();
        $this->countAll = count($tasks);
        foreach ($tasks as $item) {
            $item->getTaStatus() === Task::STATUS_CLOSE ? $this->countClose++ : null;
            $item->getTaStatus() === Task::STATUS_OPEN ? $this->countOpen++ : null;
            $item->getTaStatus() === Task::STATUS_NEW ? $this->countNew++ : null;
        }
    }

    protected function setPercentCompleted()
    {
        if ($this->countAll > 0) {
            $this->completedPercent = ($this->countClose * 100) / $this->countAll;
        }
    }

    /**
     * @return int
     */
    public function getCompletedPercent()
    {
        return $this->completedPercent;
    }

    /**
     * @return int
     */
    public function getCountClose()
    {
        return $this->countClose;
    }

    /**
     * @return int
     */
    public function getCountNew()
    {
        return $this->countNew;
    }

    /**
     * @return int
     */
    public function getCountOpen()
    {
        return $this->countOpen;
    }

}