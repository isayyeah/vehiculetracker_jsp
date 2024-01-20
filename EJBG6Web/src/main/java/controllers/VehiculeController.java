package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sessions.VehiculeFacade;

import java.io.IOException;

import entities.Vehicule;

/**
 * Servlet implementation class VehiculeController
 */
public class VehiculeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@EJB
	private VehiculeFacade facade;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehiculeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*String matricule = request.getParameter("matricule");
		Vehicule v = new Vehicule();
		v.setMatricule(matricule);
		facade.create(v);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("vehicules.jsp");
		request.setAttribute("vehicules", facade.findAll());
		dispatcher.forward(request, response);*/
		 String action = request.getParameter("action");

		    if (action != null) {
		        switch (action) {
		            case "add":
		                addVehicule(request);
		                break;
		            case "edit":
		                editVehicule(request);
		                break;
		            case "delete":
		                deleteVehicule(request);
		                break;
		            default:
		                break;
		        }
		    }

		    // Forward to the view (vehicules.jsp)
		    RequestDispatcher dispatcher = request.getRequestDispatcher("vehicules.jsp");
		    request.setAttribute("vehicules", facade.findAll());
		    dispatcher.forward(request, response);
	}
	

private void addVehicule(HttpServletRequest request) {
    String matricule = request.getParameter("matricule");

    if (matricule != null && !matricule.isEmpty()) {
        Vehicule v = new Vehicule();
        v.setMatricule(matricule);
        facade.create(v);
    }
}

private void editVehicule(HttpServletRequest request) {
    String vehiculeId = request.getParameter("id");
    String matricule = request.getParameter("matricule");

    if (vehiculeId != null && matricule != null) {
        int id = Integer.parseInt(vehiculeId);
        Vehicule v = facade.find(id);

        if (v != null) {
            v.setMatricule(matricule);
            facade.edit(v);
        }
    }
}

private void deleteVehicule(HttpServletRequest request) {
    String vehiculeId = request.getParameter("id");

    if (vehiculeId != null) {
        int id = Integer.parseInt(vehiculeId);
        Vehicule v = facade.find(id);

        if (v != null) {
            facade.remove(v);
        }
    }
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
