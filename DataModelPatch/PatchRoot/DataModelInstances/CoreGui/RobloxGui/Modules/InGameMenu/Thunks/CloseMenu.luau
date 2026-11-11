local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local SetMenuOpenModule = require(Parent.Actions.SetMenuOpen)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)

return function(p1)
	-- upvalues: GuiService (copy), SetMenuOpenModule (copy), SetCurrentPageModule (copy), ConstantsModule (copy), SendAnalyticsModule (copy)
	GuiService:SetMenuIsOpen(false, "InGameMenu")
	GuiService.SelectedCoreObject = nil
	p1:dispatch(SetMenuOpenModule(false))
	p1:dispatch(SetCurrentPageModule(ConstantsModule.InitalPageKey))
	SendAnalyticsModule(ConstantsModule.AnalyticsMenuCloseName, ConstantsModule.AnalyticsMenuActionName, {})
end