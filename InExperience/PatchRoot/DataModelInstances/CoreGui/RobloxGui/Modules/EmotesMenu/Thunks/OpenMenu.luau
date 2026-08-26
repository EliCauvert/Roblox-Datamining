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
local var1 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var2 = if not fFlagEnableNewBackpack then require(parent_1.BackpackScript) else nil
local showMenuModule = require(actions.ShowMenu)
local var3 = analyticsModule.new():withEventStream(eventStream.new(rbxAnalyticsService))

return function(_)
	-- upvalues: guiService (ref), VRService (ref), fFlagEnableNewBackpack (ref), var1 (ref), var2 (ref), var3 (ref), showMenuModule (ref)
	return function(p1)
		-- upvalues: guiService (copy), VRService (copy), fFlagEnableNewBackpack (copy), var1 (copy), var2 (copy), var3 (copy), showMenuModule (copy)
		if guiService.MenuIsOpen then
			if VRService.VREnabled then
				guiService:SetMenuIsOpen(false, "VRMenu")
			else
				return
			end
		end
		if fFlagEnableNewBackpack then
			var1.setVisibility(var1.FeatureName.Backpack, false)
			
			if var1.getVisibility(var1.FeatureName.Backpack) then
				return
			end
		elseif var2.IsOpen then
			var2.OpenClose()
		end
		if var2.IsOpen then
			return
		end
		var3:onMenuOpened()
		p1:dispatch(showMenuModule())
	end
end