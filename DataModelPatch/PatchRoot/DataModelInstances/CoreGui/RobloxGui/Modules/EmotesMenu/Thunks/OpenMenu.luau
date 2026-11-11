local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(Parent1.BackpackScript)
local ShowMenuModule = require(Parent.Actions.ShowMenu)
local WithEventStreamResult = require(Parent.Analytics).new():withEventStream(require(CorePackages.Workspace.Packages.Analytics).AnalyticsReporters.EventStream.new((game:GetService("RbxAnalyticsService"))))

return function(_)
	-- upvalues: GuiService (copy), VRService (copy), FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy), WithEventStreamResult (copy), ShowMenuModule (copy)
	return function(p1)
		-- upvalues: GuiService (upval), VRService (upval), FFlagEnableNewBackpack (upval), Features (upval), BackpackScriptModule (upval), WithEventStreamResult (upval), ShowMenuModule (upval)
		if GuiService.MenuIsOpen then
			if not VRService.VREnabled then return end
			GuiService:SetMenuIsOpen(false, "VRMenu")
		end
		if FFlagEnableNewBackpack then
			Features.setVisibility(Features.FeatureName.Backpack, false)
			
			if Features.getVisibility(Features.FeatureName.Backpack) then return end
		else
			if BackpackScriptModule.IsOpen then
				BackpackScriptModule.OpenClose()
			end
			if BackpackScriptModule.IsOpen then return end
		end
		WithEventStreamResult:onMenuOpened()
		p1:dispatch(ShowMenuModule())
	end
end