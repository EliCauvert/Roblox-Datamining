local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local ServiceModule = require(Chrome.Service)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local GetSideSheetVisibilityFunction = InExperienceSideSheetModule.getSideSheetVisibility
local list = {
	ConstantsModule.IN_EXPERIENCE_SHOP_ID,
	ConstantsModule.AVATAR_SWITCHER_ID
}
local v1 = nil

return function()
	-- upvalues: ServiceModule (copy), SignalsModule (copy), GetSideSheetVisibilityFunction (copy), list (copy), v1 (ref)
	local function _(p1): boolean
		-- upvalues: ServiceModule (upval)
		local IntegrationsResultEntry = ServiceModule:integrations()[p1]
		local Components = if IntegrationsResultEntry then IntegrationsResultEntry.components else nil
		
		return Components ~= nil and Components.Window ~= nil
	end
	
	local _ = function(p1)
		-- upvalues: ServiceModule (upval)
		local IntegrationsResultEntry = ServiceModule:integrations()[p1]
		local Components = if IntegrationsResultEntry then IntegrationsResultEntry.components else nil
		
		if Components ~= nil and Components.Window ~= nil and ServiceModule:isWindowOpen(p1) then
			ServiceModule:toggleWindow(p1)
			
			return
		end
	end
	
	local Effect = SignalsModule.createEffect(function(p1)
		-- upvalues: GetSideSheetVisibilityFunction (upval), list (upval), ServiceModule (upval)
		if not GetSideSheetVisibilityFunction(p1) then return end
		for _, value in list do
			local IntegrationsResultEntry = ServiceModule:integrations()[value]
			local Components = if IntegrationsResultEntry then IntegrationsResultEntry.components else nil
			
			if Components ~= nil and Components.Window ~= nil and ServiceModule:isWindowOpen(value) then
				ServiceModule:toggleWindow(value)
			end
		end
	end)
	local _ = nil
	
	local function v12()
		-- upvalues: v1 (upval), v12 (ref), Effect (copy)
		if v1 == v12 then
			v1 = nil
		end
		Effect()
	end
	
	v1 = v12
	
	return v12
end