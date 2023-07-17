from SeleniumLibrary.base import keyword
from selenium import webdriver
from selenium.webdriver.common.action_chains import ActionChains
from SeleniumLibrary import SeleniumLibrary
class SeleniumELibrary(SeleniumLibrary):
    @keyword
    def right_click_element_at_coordinates(self, locator, xoffset, yoffset):
        element = self.find_element(locator)
        action = ActionChains(self.driver)
        action.move_to_element(element)
        action.move_by_offset(xoffset, yoffset)
        action.context_click()
        action.perform()


    @keyword
    def double_click_element_at_coordinates(self, locator, xoffset, yoffset):
        element = self.find_element(locator)
        action = ActionChains(self.driver)
        action.move_to_element(element)
        action.move_by_offset(xoffset, yoffset)
        action.double_click()
        action.perform()
    
    @keyword
    def Mouse_Move(self,xoffset,yoffset):
        action = ActionChains(self.driver)
        action.move_by_offset(xoffset,yoffset)
        action.click(None)
        action.perform()

    @keyword
    def copy_to_clipboard(self, command):
        clipboard.copy(command)

    @keyword
    def paste_command_to_console(self, command):
        clipboard.copy(command)
        
        
    # @keyword
    # def double_click_element_at_coordinates(self, locator, xoffset, yoffset):
    #     element = self.find_element(locator)
    #     ActionChains(self.driver).move_to_element_with_offset(element, xoffset, yoffset).double_click().perform()
