<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Worker model.
 *
 * @ORM\Table(name="worker")
 * @ORM\Entity
 * @package AppBundle\Entity
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 */
class Worker
{
    /**
     * @var integer
     *
     * @ORM\Column(name="wo_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $woId;

    /**
     * @var string
     *
     * @ORM\Column(name="wo_first_name", type="string", length=64, nullable=false)
     */
    private $woFirstName;

    /**
     * @var string
     *
     * @ORM\Column(name="wo_last_name", type="string", length=64, nullable=false)
     */
    private $woLastName;

    /**
     * @var string
     *
     * @ORM\Column(name="wo_email", type="string", length=126, nullable=false)
     */
    private $woEmail;

    /**
     * Get woId.
     *
     * @return integer
     */
    public function getWoId()
    {
        return $this->woId;
    }

    /**
     * Set woFirstName.
     *
     * @param string $woFirstName
     * @return Worker
     */
    public function setWoFirstName($woFirstName)
    {
        $this->woFirstName = $woFirstName;

        return $this;
    }

    /**
     * Get woFirstName.
     *
     * @return string
     */
    public function getWoFirstName()
    {
        return $this->woFirstName;
    }

    /**
     * Set woLastName.
     *
     * @param string $woLastName
     * @return Worker
     */
    public function setWoLastName($woLastName)
    {
        $this->woLastName = $woLastName;

        return $this;
    }

    /**
     * Get woLastName.
     *
     * @return string
     */
    public function getWoLastName()
    {
        return $this->woLastName;
    }

    /**
     * Set woEmail.
     *
     * @param string $woEmail
     * @return Worker
     */
    public function setWoEmail($woEmail)
    {
        $this->woEmail = $woEmail;

        return $this;
    }

    /**
     * Get woEmail.
     *
     * @return string
     */
    public function getWoEmail()
    {
        return $this->woEmail;
    }

    /**
     * Get woFirstName woLastName.
     *
     * @return string
     */
    public function getWoName()
    {
        return $this->woFirstName . ' ' . $this->woLastName;
    }

}
