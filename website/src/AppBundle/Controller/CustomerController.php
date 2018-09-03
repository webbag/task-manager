<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Customer;
use AppBundle\Form\CustomerType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Customer CRUD controller.
 * @author Krzysztof Kromolicki <k.kromolicki@gmail.com>
 * @package AppBundle\Controller
 * @Route("/customer")
 */
class CustomerController extends Controller
{
    /**
     * Lists all Customer entities.
     *
     * @Route("/", name="customer_index")
     * @Method("GET")
     * @return \Symfony\Component\HttpFoundation\Response
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $customers = $em->getRepository(Customer::class)->findAll();

        return $this->render('customer/index.html.twig', array(
            'customers' => $customers,
        ));
    }

    /**
     * Creates a new Customer entity.
     *
     * @Route("/new", name="customer_new")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function newAction(Request $request)
    {
        $customer = new Customer();
        $form = $this->createForm(CustomerType::class, $customer);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($customer);
            $em->flush();

            return $this->redirectToRoute('customer_index');
        }

        return $this->render('customer/new.html.twig', array(
            'customer' => $customer,
            'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Customer entity.
     *
     * @Route("/{id}/edit", name="customer_edit")
     * @Method({"GET", "POST"})
     * @param Request $request
     * @param Customer $customer
     * @return \Symfony\Component\HttpFoundation\RedirectResponse|\Symfony\Component\HttpFoundation\Response
     */
    public function editAction(Request $request, Customer $customer)
    {
        $editForm = $this->createForm(CustomerType::class, $customer);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($customer);
            $em->flush();

            return $this->redirectToRoute('customer_edit', array('id' => $customer->getCuId()));
        }

        return $this->render('customer/edit.html.twig', array(
            'customer' => $customer,
            'edit_form' => $editForm->createView(),
        ));
    }

}
