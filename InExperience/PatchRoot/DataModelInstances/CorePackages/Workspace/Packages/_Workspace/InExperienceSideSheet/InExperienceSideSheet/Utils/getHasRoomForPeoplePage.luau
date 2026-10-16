local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local DisplayModule = require(Parent.Display)
local _ = require(Parent.Signals)
local ConstantsModule = require(InExperienceSideSheet.Common.Constants)
local GetSideSheetDrawerWidthModule = require(script.Parent.getSideSheetDrawerWidth)
local HasRoomForPeoplePageModule = require(script.Parent.hasRoomForPeoplePage)
local FFlagClosePeoplePageWhenNoRoomBesideSideSheet = require(InExperienceSideSheet.Flags).FFlagClosePeoplePageWhenNoRoomBesideSideSheet

return function(p1, p2) --[[ Line: 15 ]]
	-- upvalues: FFlagClosePeoplePageWhenNoRoomBesideSideSheet (copy), DisplayModule (copy), GetSideSheetDrawerWidthModule (copy), ConstantsModule (copy), HasRoomForPeoplePageModule (copy)
	local P0 = p1 ~= nil and p1
	local XDelta = nil
	
	if FFlagClosePeoplePageWhenNoRoomBesideSideSheet and p2 ~= nil then
		XDelta = p2
	else
		local DisplayStore = DisplayModule.GetDisplayStore(P0)
		local DeviceSafePadding = DisplayStore.getDeviceSafePadding(P0)
		XDelta = DisplayStore.getViewportSize(P0).X - DeviceSafePadding.left - DeviceSafePadding.right
	end
	local SideSheetDrawerWidthModule = GetSideSheetDrawerWidthModule(P0)
	
	if SideSheetDrawerWidthModule <= 0 then
		SideSheetDrawerWidthModule = ConstantsModule.NominalSideSheetWidth
	end
	return HasRoomForPeoplePageModule(XDelta, SideSheetDrawerWidthModule)
end