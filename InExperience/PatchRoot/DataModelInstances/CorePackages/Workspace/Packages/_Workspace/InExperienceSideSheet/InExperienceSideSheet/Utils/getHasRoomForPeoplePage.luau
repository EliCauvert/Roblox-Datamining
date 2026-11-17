local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local DisplayModule = require(Parent.Display)
local _ = require(Parent.Signals)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local FlagsModule = require(InExperienceSideSheet.Flags)
local GetSideSheetDrawerWidthModule = require(script.Parent.getSideSheetDrawerWidth)
local HasRoomForPeoplePageModule = require(script.Parent.hasRoomForPeoplePage)
local FFlagClosePeoplePageWhenNoRoomBesideSideSheet = FlagsModule.FFlagClosePeoplePageWhenNoRoomBesideSideSheet
local FFlagKeepSideSheetOpenBesideMenu = FlagsModule.FFlagKeepSideSheetOpenBesideMenu

return function(p1, p2)
	-- upvalues: GetSideSheetDrawerWidthModule (copy), ConstantsModule (copy), FFlagKeepSideSheetOpenBesideMenu (copy), DisplayModule (copy), FFlagClosePeoplePageWhenNoRoomBesideSideSheet (copy), HasRoomForPeoplePageModule (copy)
	local P0 = p1 ~= nil and p1
	local SideSheetDrawerWidthModule = GetSideSheetDrawerWidthModule(P0)
	
	if SideSheetDrawerWidthModule <= 0 then
		SideSheetDrawerWidthModule = ConstantsModule.NominalSideSheetWidth
	end
	if FFlagKeepSideSheetOpenBesideMenu then
		local DisplayStore = DisplayModule.GetDisplayStore(P0)
		local DeviceSafePadding = DisplayStore.getDeviceSafePadding(P0)
		
		return ConstantsModule.MinMenuWidthBesideSideSheet * (SideSheetDrawerWidthModule / ConstantsModule.NominalSideSheetWidth) <= (if p2 == nil then DisplayStore.getViewportSize(P0).X else p2) - (SideSheetDrawerWidthModule + math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.left)) - math.max(0, ConstantsModule.MenuScreenMargin - DeviceSafePadding.right)
	end
	local XDelta = nil
	if FFlagClosePeoplePageWhenNoRoomBesideSideSheet and p2 ~= nil then
		XDelta = p2
	else
		local DisplayStore = DisplayModule.GetDisplayStore(P0)
		local DeviceSafePadding = DisplayStore.getDeviceSafePadding(P0)
		XDelta = DisplayStore.getViewportSize(P0).X - DeviceSafePadding.left - DeviceSafePadding.right
	end
	return HasRoomForPeoplePageModule(XDelta, SideSheetDrawerWidthModule)
end