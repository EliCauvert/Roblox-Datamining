local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local setMenuIconTooltipOpenModule = require(parent.Actions.SetMenuIconTooltipOpen)

return function(p0)
	-- upvalues: guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), constantsModule (ref), setMenuIconTooltipOpenModule (ref), sendAnalyticsModule (ref)
	return function(p1)
		-- upvalues: guiService (copy), setMenuOpenModule (copy), setCurrentPageModule (copy), constantsModule (copy), setMenuIconTooltipOpenModule (copy), sendAnalyticsModule (copy), p0 (ref)
		guiService:SetMenuIsOpen(true, "InGameMenu")
		p1:dispatch(setMenuOpenModule(true))
		p1:dispatch(setCurrentPageModule(constantsModule.MainPagePageKey))
		
		if p1:getState().nativeClosePrompt.menuIconTooltipOpen then
			p1:dispatch(setMenuIconTooltipOpenModule(false))
		end
		sendAnalyticsModule(constantsModule.AnalyticsMenuOpenName, constantsModule.AnalyticsMenuActionName, { source = p0 })
	end
end