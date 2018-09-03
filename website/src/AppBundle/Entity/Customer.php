<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Customer model.
 *
 * @ORM\Table(name="customer")
 * @ORM\Entity
 * @package AppBundle\Entity
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 */
class Customer
{
    /**
     * @var integer
     *
     * @ORM\Column(name="cu_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $cuId;

    /**
     * @var string
     *
     * @ORM\Column(name="cu_name", type="string", length=255, nullable=true)
     */
    private $cuName;

    /**
     * Get cuId.
     *
     * @return integer 
     */
    public function getCuId()
    {
        return $this->cuId;
    }

    /**
     * Set cuName.
     *
     * @param string $cuName
     * @return Customer
     */
    public function setCuName($cuName)
    {
        $this->cuName = $cuName;

        return $this;
    }

    /**
     * Get cuName.
     *
     * @return string 
     */
    public function getCuName()
    {
        return $this->cuName;
    }
}
