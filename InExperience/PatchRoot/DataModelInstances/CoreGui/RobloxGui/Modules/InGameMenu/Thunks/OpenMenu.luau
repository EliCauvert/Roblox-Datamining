local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local list = { constantsModule.ReportDialogKey }

return function(p0, p1)
	-- upvalues: constantsModule (ref), list (ref), guiService (ref), setMenuOpenModule (ref), setCurrentPageModule (ref), sendAnalyticsModule (ref)
	return function(p2)
		-- upvalues: p1 (write), constantsModule (copy), list (copy), guiService (copy), setMenuOpenModule (copy), setCurrentPageModule (copy), sendAnalyticsModule (copy), p0 (ref)
		if not p1 then
			p1 = constantsModule.defaultPageKey
		end
		if not table.find(list, p1) then
			if p1 ~= constantsModule.InitalPageKey then
				guiService:SetMenuIsOpen(true, "InGameMenu")
			end
			p2:dispatch(setMenuOpenModule(true))
			p2:dispatch(setCurrentPageModule(p1))
		end
		sendAnalyticsModule(constantsModule.AnalyticsMenuOpenName, constantsModule.AnalyticsMenuActionName, { source = p0 })
	end
end