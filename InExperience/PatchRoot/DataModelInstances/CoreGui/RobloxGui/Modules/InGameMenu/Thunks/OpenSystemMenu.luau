local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local setMenuIconTooltipOpenModule = require(parent.Actions.SetMenuIconTooltipOpen)

return function(p1)
	-- upvalues: guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), constantsModule (ref), setMenuIconTooltipOpenModule (ref), sendAnalyticsModule (ref)
	return function(p2)
		-- upvalues: guiService (copy), setMenuOpenModule (copy), setCurrentPageModule (copy), constantsModule (copy), setMenuIconTooltipOpenModule (copy), sendAnalyticsModule (copy), p1 (ref)
		guiService:SetMenuIsOpen(true, "InGameMenu")
		p2:dispatch(setMenuOpenModule(true))
		p2:dispatch(setCurrentPageModule(constantsModule.MainPagePageKey))
		
		if p2:getState().nativeClosePrompt.menuIconTooltipOpen then
			p2:dispatch(setMenuIconTooltipOpenModule(false))
		end
		sendAnalyticsModule(constantsModule.AnalyticsMenuOpenName, constantsModule.AnalyticsMenuActionName, { source = p1 })
	end
end