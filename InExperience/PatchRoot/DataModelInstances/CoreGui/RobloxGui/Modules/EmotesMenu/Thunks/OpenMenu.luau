local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local parent = script.Parent.Parent
local actions = parent.Actions
local parent_1 = parent.Parent
local eventStream = require(corePackagesService.Workspace.Packages.Analytics).AnalyticsReporters.EventStream
local analyticsModule = require(parent.Analytics)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var5 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var6 = if not fFlagEnableNewBackpack then require(parent_1.BackpackScript) else nil
local showMenuModule = require(actions.ShowMenu)
local var8 = analyticsModule.new():withEventStream(eventStream.new(rbxAnalyticsService))

return function(_)
	-- upvalues: guiService (ref), VRService (ref), fFlagEnableNewBackpack (ref), var5 (ref), var6 (ref), var8 (ref), showMenuModule (ref)
	return function(p0)
		-- upvalues: guiService (copy), VRService (copy), fFlagEnableNewBackpack (copy), var5 (copy), var6 (copy), var8 (copy), showMenuModule (copy)
		if guiService.MenuIsOpen then
			if VRService.VREnabled then
				guiService:SetMenuIsOpen(false, "VRMenu")
			else
				return
			end
		end
		if fFlagEnableNewBackpack then
			var5.setVisibility(var5.FeatureName.Backpack, false)
			
			if var5.getVisibility(var5.FeatureName.Backpack) then
				return
			end
		elseif var6.IsOpen then
			var6.OpenClose()
		end
		if var6.IsOpen then
			return
		end
		var8:onMenuOpened()
		p0:dispatch(showMenuModule())
	end
end