<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Task model.
 *
 * @ORM\Table(name="task", indexes={@ORM\Index(name="task_project_pr_id_fk", columns={"project_pr_id"}),
 *     @ORM\Index(name="task_worker_wo_id_fk", columns={"worker_wo_id"})})
 * @ORM\Entity
 * @package AppBundle\Entity
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 */
class Task
{

    const PRIORITY_URGENT = 1;
    const PRIORITY_HIGH = 2;
    const PRIORITY_NORMAL = 3;
    const PRIORITY_LOW = 4;

    const STATUS_OPEN = 1;
    const STATUS_CLOSE = 2;

    const PRIORITY = [
        self::PRIORITY_URGENT => 'pilne',
        self::PRIORITY_HIGH => 'wysokie',
        self::PRIORITY_NORMAL => 'normalne',
        self::PRIORITY_LOW => 'niskie',
    ];

    const PRIORITY_COLOR = [
        self::PRIORITY_URGENT => 'danger',
        self::PRIORITY_HIGH => 'warning',
        self::PRIORITY_NORMAL => 'primary',
        self::PRIORITY_LOW => 'info',
    ];
    const STATUS = [
        self::STATUS_OPEN => 'otwarte',
        self::STATUS_CLOSE => 'zamknięte',
    ];
    const STATUS_COLOR = [
        self::STATUS_OPEN => 'warning',
        self::STATUS_CLOSE => 'success',
    ];
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
     * @ORM\Column(name="ta_priority", type="smallint", nullable=false)
     */
    private $taPriority;

    /**
     * @var integer
     *
     * @ORM\Column(name="ta_status", type="smallint", nullable=false)
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
     * Get taId.
     *
     * @return integer
     */
    public function getTaId()
    {
        return $this->taId;
    }

    /**
     * Set taName.
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
     * Get taName.
     *
     * @return string
     */
    public function getTaName()
    {
        return $this->taName;
    }

    /**
     * Set taDateCreate.
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
     * Get taDateCreate.
     *
     * @return \DateTime
     */
    public function getTaDateCreate()
    {
        return $this->taDateCreate;
    }

    /**
     * Get taStatus number.
     *
     * @return int
     */
    public function getTaStatus()
    {
        return $this->taStatus;
    }

    /**
     * Get status name.
     *
     * @return string
     */
    public function getTaStatusName()
    {
        return self::STATUS[$this->taStatus];
    }

    /**
     * Get class css bootstrap.
     *
     * @return string
     */
    public function getTaStatusColor()
    {
        return self::STATUS_COLOR[$this->taStatus];
    }

    /**
     * Set taStatus.
     *
     * @param int $taStatus self::STATUS_OPEN | self::STATUS_CLOSE
     * @return Task
     */
    public function setTaStatus($taStatus)
    {
        $this->taStatus = $taStatus;

        return $this;
    }

    /**
     * Set taPriority number.
     *
     * @param int $taPriority self::PRIORITY_URGENT | self::PRIORITY_HIGH  | self::PRIORITY_NORMAL  | self::PRIORITY_LOW
     * @return Task
     */
    public function setTaPriority($taPriority)
    {
        $this->taPriority = $taPriority;

        return $this;
    }

    /**
     * Get taPriority.
     *
     * @return int
     */
    public function getTaPriority()
    {
        return $this->taPriority;
    }

    /**
     * Get priority name.
     *
     * @return string
     */
    public function getTaPriorityName()
    {
        return self::PRIORITY[$this->taPriority];
    }

    /**
     * Get class css bootstrap.
     *
     * @return string
     */
    public function getTaPriorityColor()
    {
        return self::PRIORITY_COLOR[$this->taPriority];
    }

    /**
     * Set projectPr.
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
     * Get projectPr.
     *
     * @return \AppBundle\Entity\Project
     */
    public function getProjectPr()
    {
        return $this->projectPr;
    }

    /**
     * Set workerWo.
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
     * Get workerWo.
     *
     * @return \AppBundle\Entity\Worker
     */
    public function getWorkerWo()
    {
        return $this->workerWo;
    }

    /**
     * Get taDescription.
     *
     * @return string
     */
    public function getTaDescription()
    {
        return $this->taDescription;
    }

    /**
     * Set taDescription.
     *
     * @param string $taDescription
     * @return Task
     */
    public function setTaDescription($taDescription)
    {
        $this->taDescription = $taDescription;
        return $this;
    }

}
