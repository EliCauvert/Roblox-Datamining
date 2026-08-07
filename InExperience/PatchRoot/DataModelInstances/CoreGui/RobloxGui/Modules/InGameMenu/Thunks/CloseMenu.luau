local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)

return function(p0) --[[ line: 9 ]]
	-- upvalues: guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), constantsModule (ref), sendAnalyticsModule (ref)
	guiService:SetMenuIsOpen(false, "InGameMenu")
	guiService.SelectedCoreObject = nil
	p0:dispatch(setMenuOpenModule(false))
	p0:dispatch(setCurrentPageModule(constantsModule.InitalPageKey))
	sendAnalyticsModule(constantsModule.AnalyticsMenuCloseName, constantsModule.AnalyticsMenuActionName, {})
end