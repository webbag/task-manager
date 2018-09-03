<?php

namespace AppBundle\Form;

use AppBundle\Entity\Task;
use Symfony\Component\Form\AbstractType;
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
            ->add('taPriority', 'Symfony\Component\Form\Extension\Core\Type\ChoiceType', [
                'choices' => Task::$priority,
                'label' => 'Priorytet'
            ])
            ->add('taStatus', 'Symfony\Component\Form\Extension\Core\Type\ChoiceType', [
                'choices' => Task::$status,
                'label' => 'Status'
            ])
            ->add('workerWo', 'Symfony\Bridge\Doctrine\Form\Type\EntityType', [
                'class' => 'AppBundle\Entity\Worker',
                'choice_label' => 'woName',
                'label' => 'Pracownik',
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
