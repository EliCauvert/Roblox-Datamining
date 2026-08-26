local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local list = { constantsModule.ReportDialogKey }

return function(p1, p2)
	-- upvalues: constantsModule (ref), list (ref), guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), sendAnalyticsModule (ref)
	return function(p3)
		-- upvalues: p2 (write), constantsModule (copy), list (copy), guiService (copy), setMenuOpenModule (copy), setCurrentPageModule (copy), sendAnalyticsModule (copy), p1 (ref)
		if not p2 then
			p2 = constantsModule.defaultPageKey
		end
		if not table.find(list, p2) then
			if p2 ~= constantsModule.InitalPageKey then
				guiService:SetMenuIsOpen(true, "InGameMenu")
			end
			p3:dispatch(setMenuOpenModule(true))
			p3:dispatch(setCurrentPageModule(p2))
		end
		sendAnalyticsModule(constantsModule.AnalyticsMenuOpenName, constantsModule.AnalyticsMenuActionName, { source = p1 })
	end
end