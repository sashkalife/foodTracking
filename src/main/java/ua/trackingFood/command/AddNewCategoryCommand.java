package ua.trackingFood.command;

import org.apache.log4j.Logger;
import ua.trackingFood.command.Command;
import ua.trackingFood.entity.CategoryProducts;
import ua.trackingFood.exception.ServiceException;
import ua.trackingFood.service.*;
import ua.trackingFood.validation.EnterDataValidator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import static ua.trackingFood.utils.resourceHolders.AttributesHolder.ATTR_CATEGORY_NAME;
import static ua.trackingFood.utils.resourceHolders.AttributesHolder.ATTR_ERROR_MESSAGE;
import static ua.trackingFood.utils.resourceHolders.PagesHolder.CHOOSE_CATEGORY_PAGE;

public class AddNewCategoryCommand implements Command {
    private static final Logger LOGGER = Logger.getLogger(AddNewCategoryCommand.class.getSimpleName());
    private static final AddNewCategoryService addNewCategoryService = ServiceFactory.getServiceFactory().getAddNewCategoryService();
    private static final GeneralService generalService = new GeneralService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter(ATTR_CATEGORY_NAME);
        if(EnterDataValidator.isValidName(name)){
            CategoryProducts categoryProducts = new CategoryProducts(name);
            try {
                addNewCategoryService.createCategory(categoryProducts);
            } catch (ServiceException e) {
                LOGGER.error("new category didn't add");
            }
        }else{
            request.setAttribute(ATTR_ERROR_MESSAGE, "Name is not correct");
        }
        List<CategoryProducts> categoryList = generalService.readCategories();
        request.setAttribute("list", categoryList);
        request.getRequestDispatcher(CHOOSE_CATEGORY_PAGE).forward(request, response);
    }
}