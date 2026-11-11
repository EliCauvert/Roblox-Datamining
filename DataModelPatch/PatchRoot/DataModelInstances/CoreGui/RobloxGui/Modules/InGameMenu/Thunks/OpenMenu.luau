local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local SetMenuOpenModule = require(Parent.Actions.SetMenuOpen)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local List = { ConstantsModule.ReportDialogKey }

return function(Source, Value)
	-- upvalues: ConstantsModule (copy), List (copy), GuiService (copy), SetMenuOpenModule (copy), SetCurrentPageModule (copy), SendAnalyticsModule (copy)
	return function(p1)
		-- upvalues: Value (ref), ConstantsModule (upval), List (upval), GuiService (upval), SetMenuOpenModule (upval), SetCurrentPageModule (upval), SendAnalyticsModule (upval), Source (copy)
		if not Value then
			Value = ConstantsModule.defaultPageKey
		end
		if not table.find(List, Value) then
			if Value ~= ConstantsModule.InitalPageKey then
				GuiService:SetMenuIsOpen(true, "InGameMenu")
			end
			p1:dispatch(SetMenuOpenModule(true))
			p1:dispatch(SetCurrentPageModule(Value))
		end
		SendAnalyticsModule(ConstantsModule.AnalyticsMenuOpenName, ConstantsModule.AnalyticsMenuActionName, { source = Source })
	end
end