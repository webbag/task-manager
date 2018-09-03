<?php

namespace AppBundle\Form;

use AppBundle\Entity\Task;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

/**
 * Class TaskType.
 *
 * @package AppBundle\Form
 */
class TaskType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('taName', 'text', ['label' => 'Nazwa'])
            ->add('taDescription', 'textarea', ['label' => 'Opis'])
            ->add('taDateCreate', 'datetime', ['label' => 'Data utworzenia'])
            ->add('taPriority', ChoiceType::class, [
                'choices' => Task::PRIORITY,
                 'label' => 'Priorytet'
            ])
            ->add('taStatus', ChoiceType::class, [
                'choices' => Task::STATUS,
                'label' => 'Status'
            ]);
    }

    /**
     * @param OptionsResolver $resolver
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Task'
        ));
    }
}
