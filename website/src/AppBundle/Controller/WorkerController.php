<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Worker;
use AppBundle\Form\WorkerType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Worker CRUD controller.
 *
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 * @package AppBundle\Controller
 * @Route("/worker")
 */
class WorkerController extends Controller
{
    /**
     * Lists all Worker entities.
     *
     * @Route("/", name="worker_index")
     * @Method("GET")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $workers = $em->getRepository(Worker::class)->findAll();

        return $this->render('worker/index.html.twig', array(
            'workers' => $workers,
        ));
    }

    /**
     * Creates a new Worker entity.
     *
     * @Route("/new", name="worker_new")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function newAction(Request $request)
    {
        $worker = new Worker();
        $form = $this->createForm(WorkerType::class, $worker);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($worker);
            $em->flush();

            return $this->redirectToRoute('worker_index');
        }

        return $this->render('worker/new.html.twig', array(
            'worker' => $worker,
            'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Worker entity.
     *
     * @Route("/{id}/edit", name="worker_edit")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @param Worker $worker
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, Worker $worker)
    {
        $editForm = $this->createForm(WorkerType::class, $worker);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($worker);
            $em->flush();

            return $this->redirectToRoute('worker_edit', array('id' => $worker->getWoId()));
        }

        return $this->render('worker/edit.html.twig', array(
            'worker' => $worker,
            'edit_form' => $editForm->createView(),
        ));
    }

}
