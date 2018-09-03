<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Project model.
 *
 * @ORM\Table(name="project", indexes={@ORM\Index(name="project_customer_cu_id_fk", columns={"customer_cu_id"})})
 * @ORM\Entity
 * @package AppBundle\Entity
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 */
class Project
{
    /**
     * @var integer
     *
     * @ORM\Column(name="pr_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $prId;

    /**
     * @var string
     *
     * @ORM\Column(name="pr_name", type="string", length=255, nullable=true)
     */
    private $prName;

    /**
     * @var \Customer
     *
     * @ORM\ManyToOne(targetEntity="Customer")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="customer_cu_id", referencedColumnName="cu_id")
     * })
     */
    private $customerCu;

    /**
     * Get prId.
     *
     * @return integer 
     */
    public function getPrId()
    {
        return $this->prId;
    }

    /**
     * Set prName.
     *
     * @param string $prName
     * @return Project
     */
    public function setPrName($prName)
    {
        $this->prName = $prName;

        return $this;
    }

    /**
     * Get prName.
     *
     * @return string 
     */
    public function getPrName()
    {
        return $this->prName;
    }

    /**
     * Set customerCu.
     *
     * @param \AppBundle\Entity\Customer $customerCu
     * @return Project
     */
    public function setCustomerCu(\AppBundle\Entity\Customer $customerCu = null)
    {
        $this->customerCu = $customerCu;

        return $this;
    }

    /**
     * Get customerCu.
     *
     * @return \AppBundle\Entity\Customer 
     */
    public function getCustomerCu()
    {
        return $this->customerCu;
    }
}
