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
     * @var \DateTime
     *
     * @ORM\Column(name="ta_date_create", type="datetime", nullable=false)
     */
    private $taDateCreate;

    /**
     * @var boolean
     *
     * @ORM\Column(name="ta_priority", type="boolean", nullable=false)
     */
    private $taPriority;

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
     * Set taPriority
     *
     * @param boolean $taPriority
     * @return Task
     */
    public function setTaPriority($taPriority)
    {
        $this->taPriority = $taPriority;

        return $this;
    }

    /**
     * Get taPriority
     *
     * @return boolean 
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
}
