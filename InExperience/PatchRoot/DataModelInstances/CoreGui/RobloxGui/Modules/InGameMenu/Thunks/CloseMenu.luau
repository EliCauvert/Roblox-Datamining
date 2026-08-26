local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)

return function(p1)
	-- upvalues: guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), constantsModule (ref), sendAnalyticsModule (ref)
	guiService:SetMenuIsOpen(false, "InGameMenu")
	guiService.SelectedCoreObject = nil
	p1:dispatch(setMenuOpenModule(false))
	p1:dispatch(setCurrentPageModule(constantsModule.InitalPageKey))
	sendAnalyticsModule(constantsModule.AnalyticsMenuCloseName, constantsModule.AnalyticsMenuActionName, {})
end