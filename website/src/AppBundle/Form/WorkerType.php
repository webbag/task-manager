<?php

namespace AppBundle\Form;

use AppBundle\Entity\Worker;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class WorkerType.
 *
 * @package AppBundle\Form
 */
class WorkerType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('woFirstName', 'text', ['label' => 'Imię'])
            ->add('woLastName', 'text', ['label' => 'Nazwisko'])
            ->add('woEmail', 'text', ['label' => 'Email']);
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => Worker::class
        ));
    }
}
