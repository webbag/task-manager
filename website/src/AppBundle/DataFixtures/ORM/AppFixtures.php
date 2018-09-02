<?php

namespace AppBundle\DataFixtures;

use AppBundle\Entity\Customer;
use AppBundle\Entity\Project;
use AppBundle\Entity\Task;
use AppBundle\Entity\Worker;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {

        $customer = new Customer();
        $customer->setCuName('WeBBag');
        $manager->persist($customer);

        $project = new Project();
        $project->setPrName('Task Manager');
        $project->setCustomerCu($customer);
        $manager->persist($project);

        $worker = new Worker();
        $worker->setWoFirstName('Kris');
        $worker->setWoLastName('Kros');
        $worker->setWoEmail('kris.kros@webbag.pl');
        $manager->persist($worker);

        $task = new Task();
        $task->setProjectPr($project);
        $task->setWorkerWo($worker);
        $task->setTaName('Instalacja i konfiguracja kontenerów Dockera');
        $task->setTaDateCreate(new \DateTime());
        $task->setTaPriority(Task::PRIORITY_HIGH);
        $task->setTaStatus(Task::STATUS_NEW);
        $manager->persist($task);

        $task = new Task();
        $task->setProjectPr($project);
        $task->setWorkerWo($worker);
        $task->setTaName('Instalacja symfony 2.8.6');
        $task->setTaDateCreate(new \DateTime());
        $task->setTaPriority(Task::PRIORITY_HIGH);
        $task->setTaStatus(Task::STATUS_NEW);
        $manager->persist($task);

        $manager->flush();
    }
}