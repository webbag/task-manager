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

        $tasksName = [
            'Instalacja i konfiguracja kontenerów Dockera' => '',
            'Instalacja symfony 2.8.6' => '',
            'Zmiana w kodowaniu znaków na utf8mb4' => '',
            'Generowanie modelu' => 'Import na podstawie bazy danych',
            'Generowanie CRUD' => '',
            'Podpięcie bootstrapa 3 i dodanie do twig motywu bootstra' => '',
            'Zmiana na php 7.1 z 7.2' => '',
            'Instalacja bundle fixtures' => 'Załadowanie przykładowych danych',
        ];
        foreach ($tasksName as $taskName => $taskDesccription) {

            $task = new Task();
            $task->setProjectPr($project);
            $task->setWorkerWo($worker);
            $task->setTaName($taskName);
            $task->setTaDescription($taskDesccription);
            $task->setTaDateCreate(new \DateTime());
            $keyRand = array_rand(Task::PRIORITY, 1);
            $task->setTaPriority(Task::PRIORITY[$keyRand]);
            $keyRand = array_rand(Task::STATUS, 1);
            $task->setTaStatus(Task::STATUS[$keyRand]);
            $manager->persist($task);

        }

        $manager->flush();
    }
}