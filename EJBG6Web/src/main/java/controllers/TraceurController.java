package controllers;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sessions.TrackerFacade;

import java.io.IOException;

import entities.Tracker;

/**
 * Servlet implementation class TraceurController
 */
public class TraceurController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private TrackerFacade facade;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TraceurController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 String action = request.getParameter("action");

		    if (action != null) {
		        switch (action) {
		            case "add":
		                addTracker(request);
		                break;
		            case "edit":
		                editTracker(request);
		                break;
		            case "delete":
		                deleteTracker(request);
		                break;
		            default:
		                break;
		        }
		    }

		    // Forward to the view (vehicules.jsp)
		    RequestDispatcher dispatcher = request.getRequestDispatcher("traceurs.jsp");
		    request.setAttribute("traceurs", facade.findAll());
		    dispatcher.forward(request, response);
	}
	

private void addTracker(HttpServletRequest request) {
    String simNumber = request.getParameter("simNumber");

    if (simNumber != null && !simNumber.isEmpty()) {
        Tracker v = new Tracker();
        v.setSimNumber(simNumber);
        facade.create(v);
    }
}

private void editTracker(HttpServletRequest request) {
    String traceurId = request.getParameter("id");
    String simNumber = request.getParameter("simNumber");

    if (traceurId != null && simNumber != null) {
        int id = Integer.parseInt(traceurId);
        Tracker v = facade.find(id);

        if (v != null) {
            v.setSimNumber(simNumber);
            facade.edit(v);
        }
    }
}

private void deleteTracker(HttpServletRequest request) {
    String traceurId = request.getParameter("id");

    if (traceurId != null) {
        int id = Integer.parseInt(traceurId);
        Tracker v = facade.find(id);

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
