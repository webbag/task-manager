<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Task
 *
 * @ORM\Table(name="task", indexes={@ORM\Index(name="task_project_pr_id_fk", columns={"project_pr_id"}), @ORM\Index(name="task_worker_wo_id_fk", columns={"worker_wo_id"})})
 * @ORM\Entity
 */
class Task
{
    const PRIORITY_URGENT = 'pilne';
    const PRIORITY_HIGH = 'wysokie';
    const PRIORITY_NORMAL = 'normalne';
    const PRIORITY_LOW = 'niskie';

    const STATUS_NEW = 'nowe';
    const STATUS_OPEN = 'otwarte';
    const STATUS_CLOSE = 'zamknęte';

    const PRIORITY = [self::PRIORITY_URGENT, self::PRIORITY_HIGH, self::PRIORITY_NORMAL, self::PRIORITY_LOW];
    const STATUS = [self::STATUS_OPEN, self::STATUS_CLOSE, self::STATUS_NEW];

    /**
     * @var integer
     *
     * @ORM\Column(name="ta_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $taId;

    /**
     * @var string
     *
     * @ORM\Column(name="ta_name", type="string", length=255, nullable=false)
     */
    private $taName;

    /**
     * @var string
     *
     * @ORM\Column(name="ta_description", type="text", length=65535, nullable=true)
     */
    private $taDescription;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="ta_date_create", type="datetime", nullable=false)
     */
    private $taDateCreate;

    /**
     * @var integer
     *
     * @ORM\Column(name="ta_priority", type="string", length=16, nullable=false)
     */
    private $taPriority;

    /**
     * @var integer
     *
     * @ORM\Column(name="ta_status", type="string", length=16, nullable=false)
     */
    private $taStatus;

    /**
     * @var \Project
     *
     * @ORM\ManyToOne(targetEntity="Project")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="project_pr_id", referencedColumnName="pr_id")
     * })
     */
    private $projectPr;

    /**
     * @var \Worker
     *
     * @ORM\ManyToOne(targetEntity="Worker")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="worker_wo_id", referencedColumnName="wo_id")
     * })
     */
    private $workerWo;

    /**
     * Get taId
     *
     * @return integer
     */
    public function getTaId()
    {
        return $this->taId;
    }

    /**
     * Set taName
     *
     * @param string $taName
     * @return Task
     */
    public function setTaName($taName)
    {
        $this->taName = $taName;

        return $this;
    }

    /**
     * Get taName
     *
     * @return string
     */
    public function getTaName()
    {
        return $this->taName;
    }

    /**
     * Set taDateCreate
     *
     * @param \DateTime $taDateCreate
     * @return Task
     */
    public function setTaDateCreate($taDateCreate)
    {
        $this->taDateCreate = $taDateCreate;

        return $this;
    }

    /**
     * Get taDateCreate
     *
     * @return \DateTime
     */
    public function getTaDateCreate()
    {
        return $this->taDateCreate;
    }

    /**
     * @return string
     */
    public function getTaStatus()
    {
        return $this->taStatus;
    }

    /**
     * @param string $taStatus
     * @return Task
     */
    public function setTaStatus($taStatus)
    {
        $this->taStatus = in_array($taStatus, self::STATUS) ? $taStatus : self::STATUS_NEW;

        return $this;
    }

    /**
     * Set taPriority
     *
     * @param string $taPriority
     * @return Task
     */
    public function setTaPriority($taPriority)
    {
        $this->taPriority = in_array($taPriority, self::PRIORITY) ? $taPriority : self::PRIORITY_NORMAL;

        return $this;
    }

    /**
     * Get taPriority
     *
     * @return string
     */
    public function getTaPriority()
    {
        return $this->taPriority;
    }

    /**
     * Set projectPr
     *
     * @param \AppBundle\Entity\Project $projectPr
     * @return Task
     */
    public function setProjectPr(\AppBundle\Entity\Project $projectPr = null)
    {
        $this->projectPr = $projectPr;

        return $this;
    }

    /**
     * Get projectPr
     *
     * @return \AppBundle\Entity\Project
     */
    public function getProjectPr()
    {
        return $this->projectPr;
    }

    /**
     * Set workerWo
     *
     * @param \AppBundle\Entity\Worker $workerWo
     * @return Task
     */
    public function setWorkerWo(\AppBundle\Entity\Worker $workerWo = null)
    {
        $this->workerWo = $workerWo;

        return $this;
    }

    /**
     * Get workerWo
     *
     * @return \AppBundle\Entity\Worker
     */
    public function getWorkerWo()
    {
        return $this->workerWo;
    }

    /**
     * @return string
     */
    public function getTaDescription()
    {
        return $this->taDescription;
    }

    /**
     * @param string $taDescription
     * @return Task
     */
    public function setTaDescription($taDescription)
    {
        $this->taDescription = $taDescription;
        return $this;
    }

}
