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
    protected $countClose = [];

    /**
     * @var int
     */
    protected $countOpen = [];
    /**
     * @var int
     */
    protected $countAll = [];
    /**
     * @var int
     */
    protected $completedPercent = [];

    /**
     * CompletedTask constructor.
     * @param Registry $doctrine
     */
    public function __construct(Registry $doctrine)
    {
        $this->doctrine = $doctrine;
        $this->init();
    }

    protected function init()
    {
        $projects = [];
        $tasks = $this->doctrine->getRepository(Task::class)->findAll();
        foreach ($tasks as $item) {
            /**
             * @var $item Task
             */
            $projectId = $item->getProjectPr()->getPrId();

            if ($item->getTaStatus() === Task::STATUS_CLOSE) {
                if (isset($this->countClose[$projectId])) {
                    $this->countClose[$projectId]++;
                } else {
                    $this->countClose[$projectId] = 0;
                }
            }
            if ($item->getTaStatus() === Task::STATUS_OPEN) {
                if (isset($this->countOpen[$projectId])) {
                    $this->countOpen[$projectId]++;
                } else {
                    $this->countOpen[$projectId] = 0;
                }
            }
            $projects[$projectId] = $projectId;
        }

        foreach ($projects as $projectId) {

            if (!isset($this->countOpen[$projectId])) {
                $this->countOpen[$projectId] = 0;
            }
            if (!isset($this->countClose[$projectId])) {
                $this->countClose[$projectId] = 0;
            }
            $this->countAll[$projectId] = $this->countOpen[$projectId] + $this->countClose[$projectId];

            $this->setPercentCompleted($projectId);
        }

    }

    protected function setPercentCompleted($projectId)
    {
        if ($this->countAll[$projectId] > 0 && isset($this->countClose[$projectId])) {
            $this->completedPercent[$projectId] = round(($this->countClose[$projectId] * 100) / $this->countAll[$projectId], 0);
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
    public function getCountOpen()
    {
        return $this->countOpen;
    }

}