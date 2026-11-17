local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local DisplayModule = require(InExperienceSideSheet.Parent.Display)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local FFlagKeepSideSheetOpenBesideMenu = require(InExperienceSideSheet.Flags).FFlagKeepSideSheetOpenBesideMenu

return function(p1, p2, p3)
	-- upvalues: ConstantsModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), DisplayModule (copy)
	local ScaledMenuScreenMargin = ConstantsModule.MenuScreenMargin * 2
	
	if FFlagKeepSideSheetOpenBesideMenu then
		local DeviceSafePadding = DisplayModule.GetDisplayStore(false).getDeviceSafePadding(false)
		ScaledMenuScreenMargin = math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.left) + math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.right)
	end
	return p1 - p2 - ScaledMenuScreenMargin - p3
end