<?php

namespace AppBundle\Form;

use AppBundle\Entity\Project;
use AppBundle\Entity\Task;
use AppBundle\Entity\Worker;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class TaskType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('taName')
            ->add('taDescription')
            ->add('taDateCreate', 'datetime')
            ->add('taPriority', ChoiceType::class, array(
                'choices' => Task::PRIORITY
            ))
            ->add('taStatus', ChoiceType::class, array(
                'choices' => Task::STATUS
            ));
//            ->add('workerWo', EntityType::class, [
//                'class' => Worker::class,
//                'choice_label' => 'woLastName',
//            ])
//            ->add('projectPr', EntityType::class, [
//                'class' => Project::class,
//                'choice_label' => 'prName',
//            ]);;
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
