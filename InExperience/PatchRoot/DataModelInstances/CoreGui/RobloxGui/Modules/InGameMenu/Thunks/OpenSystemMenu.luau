local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local SetMenuOpenModule = require(Parent.Actions.SetMenuOpen)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local SetMenuIconTooltipOpenModule = require(Parent.Actions.SetMenuIconTooltipOpen)

return function(Source) --[[ Line: 10 ]]
	-- upvalues: GuiService (copy), SetMenuOpenModule (copy), SetCurrentPageModule (copy), ConstantsModule (copy), SetMenuIconTooltipOpenModule (copy), SendAnalyticsModule (copy)
	return function(p1) --[[ Line: 11 ]]
		-- upvalues: GuiService (upval), SetMenuOpenModule (upval), SetCurrentPageModule (upval), ConstantsModule (upval), SetMenuIconTooltipOpenModule (upval), SendAnalyticsModule (upval), Source (copy)
		GuiService:SetMenuIsOpen(true, "InGameMenu")
		p1:dispatch(SetMenuOpenModule(true))
		p1:dispatch(SetCurrentPageModule(ConstantsModule.MainPagePageKey))
		
		if p1:getState().nativeClosePrompt.menuIconTooltipOpen then
			p1:dispatch(SetMenuIconTooltipOpenModule(false))
		end
		SendAnalyticsModule(ConstantsModule.AnalyticsMenuOpenName, ConstantsModule.AnalyticsMenuActionName, { source = Source })
	end
end