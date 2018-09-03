<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

/**
 * Default class homepage.
 *
 * @package AppBundle\Controller
 */
class DefaultController extends Controller
{
    /**
     * Default action start - redirect header 301 to list projects.
     *
     * @Route("/", name="homepage")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function indexAction(Request $request)
    {
        return $this->redirectToRoute('project_index', [], 301);
    }
}
