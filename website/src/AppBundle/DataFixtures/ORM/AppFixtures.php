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
        $countWorker = rand(3, 10);
        $workers = [];
        for ($i = 0; $i < $countWorker; $i++) {
            $worker = new Worker();
            $worker->setWoFirstName($this->randFirstName());
            $worker->setWoLastName($this->randLastName());
            $worker->setWoEmail($this->generateEmail(
                $worker->getWoFirstName(),
                $worker->getWoLastName()
            ));
            $manager->persist($worker);

            $workers[] = $worker;
        }
        $manager->flush();

        for ($i = 0; $i < rand(4, 8); $i++) {

            $customer = new Customer();
            $customer->setCuName($this->randCustomer());
            $manager->persist($customer);

            $project = new Project();
            $project->setPrName($this->randProject());
            $project->setCustomerCu($customer);
            $manager->persist($project);

            foreach ($this->randTasks() as $taskName => $taskDescription) {
                $randWorkerKey = rand(1, $countWorker - 1);
                $workerRand = $workers[$randWorkerKey];

                $task = new Task();
                $task->setProjectPr($project);
                $task->setWorkerWo($workerRand);
                $task->setTaName($taskName);
                $task->setTaDescription($taskDescription);
                $task->setTaDateCreate($this->randDate());
                $task->setTaPriority(rand(1, 4));
                $task->setTaStatus(rand(1, 2));
                $manager->persist($task);

            }
            $manager->flush();
        }
    }

    protected function randFirstName()
    {
        $data = ['Marika', 'Agnieszka', 'Krzysztof', 'Adam', 'Dariusz', 'Mirosław', 'Adrianna',];
        $randomKeys = array_rand($data, 1);

        return $data[$randomKeys];
    }

    protected function randLastName()
    {
        $data = ['Kowalczyk', 'Wasilek', 'Zduńsk', 'Bielawka', 'Woźnim', 'Sobiszyn'];
        $randomKeys = array_rand($data, 1);

        return $data[$randomKeys];
    }

    protected function randCustomer()
    {
        $data = ['Maxime', 'Nobis', 'Optio', 'Mutta', 'Dixi', 'Prolox'];
        $randomKeys = array_rand($data, 1);

        return $data[$randomKeys];
    }

    protected function randProject()
    {
        $s = substr(str_shuffle(str_repeat("ABCE", 5)), 0, 3);
        return 'Projekt ' . $s;
    }

    protected function randTasks()
    {
        for ($i = 0; $i < rand(8, 24); $i++) {
            $s = substr(str_shuffle(str_repeat("XYZQ", 5)), 0, 6);
            $tasks['Zadanie [' . $s . ']'] = $this->randDescription();
        }

        return $tasks;
    }

    protected function randDescription()
    {
        $description = 'am libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Qua temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae pondere ad lineam. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat';
        $descriptionEx = explode(' ', $description);
        shuffle($descriptionEx);

        return implode(' ', $descriptionEx);
    }

    protected function generateEmail($firstName, $lastName)
    {
        return strtolower($firstName) . '.' . strtolower($lastName) . '@' . strtolower($lastName) . '.pl';
    }

    protected function randDate()
    {
        $year = date('Y', time());
        $mount = rand(6, 9);
        $day = rand(1, 30);
        $hour = rand(0, 18);
        $minute = rand(10, 59);
        $sec = rand(10, 59);
        $timeRand = $year . '-' . $mount . '-' . $day . ' ' . $hour . ':' . $minute . ':' . $sec;

        return \DateTime::createFromFormat('Y-m-d H:i:s', $timeRand);
    }

}
