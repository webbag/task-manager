<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Project;
use AppBundle\Entity\Task;
use AppBundle\Form\TaskType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Task CRUD controller.
 *
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 * @package AppBundle\Controller
 * @Route("/task")
 */
class TaskController extends Controller
{
    /**
     * Lists all Task entities by project id.
     *
     * @Route("/{id}", name="task_index")
     * @Method("GET")
     * @param $id Project::getPrId()
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $tasks = $em->getRepository(Task::class)->findBy(['projectPr' => $id], ['taStatus' => 'ASC']);
        $project = $em->getRepository(Project::class)->find($id);

        return $this->render('task/index.html.twig', array(
            'tasks' => $tasks,
            'project' => $project,
        ));
    }

    /**
     * Creates a new Task entity.
     *
     * @Route("/new", name="task_new")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function newAction(Request $request)
    {
        $task = new Task();
        $form = $this->createForm(TaskType::class, $task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($task);
            $em->flush();

            return $this->redirectToRoute('task_show', array('id' => $task->getTaId()));
        }

        return $this->render('task/new.html.twig', array(
            'task' => $task,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Task entity.
     *
     * @Route("/{id}/show", name="task_show")
     * @Method("GET")
     * @param Task $task
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function showAction(Task $task)
    {
        $deleteForm = $this->createDeleteForm($task);

        return $this->render('task/show.html.twig', array(
            'task' => $task,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Task entity.
     *
     * @Route("/{id}/edit", name="task_edit")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @param Task $task
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, Task $task)
    {
        $deleteForm = $this->createDeleteForm($task);
        $editForm = $this->createForm(TaskType::class, $task);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($task);
            $em->flush();

            return $this->redirectToRoute('task_edit', array('id' => $task->getTaId()));
        }

        return $this->render('task/edit.html.twig', array(
            'task' => $task,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Task entity.
     *
     * @Route("/{id}", name="task_delete")
     * @Method("DELETE")
     * @param Request $request
     * @param Task $task
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function deleteAction(Request $request, Task $task)
    {
        $form = $this->createDeleteForm($task);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($task);
            $em->flush();
        }

        return $this->redirectToRoute('task_index', ['id'=> $task->getProjectPr()->getPrId()]);
    }

    /**
     * Creates a form to delete a Task entity.
     *
     * @param Task $task
     * @return \Symfony\Component\Form\Form
     */
    private function createDeleteForm(Task $task)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('task_delete', array('id' => $task->getTaId())))
            ->setMethod('DELETE')
            ->getForm();
    }
}
