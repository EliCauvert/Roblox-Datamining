local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local displayModule = require(parent.Display)
local _ = require(parent.Signals)
local constantsModule = require(inExperienceSideSheet.Common.Constants)
local flagsModule = require(inExperienceSideSheet.Flags)
local getSideSheetDrawerWidthModule = require(script.Parent.getSideSheetDrawerWidth)
local hasRoomForPeoplePageModule = require(script.Parent.hasRoomForPeoplePage)
local fFlagClosePeoplePageWhenNoRoomBesideSideSheet = flagsModule.FFlagClosePeoplePageWhenNoRoomBesideSideSheet

return function(p1, p2)
	-- upvalues: fFlagClosePeoplePageWhenNoRoomBesideSideSheet (ref), displayModule (ref), getSideSheetDrawerWidthModule (ref), constantsModule (ref), hasRoomForPeoplePageModule (ref)
	local var1
	local var2 = if p1 == nil then false else p1
	local _ = nil
	
	if fFlagClosePeoplePageWhenNoRoomBesideSideSheet and p2 ~= nil then
		var1 = p2
	else
		local displayStore = displayModule.GetDisplayStore(var2)
		local deviceSafePadding = displayStore.getDeviceSafePadding(var2)
		var1 = displayStore.getViewportSize(var2).X - deviceSafePadding.left - deviceSafePadding.right
	end
	local var3 = getSideSheetDrawerWidthModule(var2)
	
	if var3 <= 0 then
		var3 = constantsModule.NominalSideSheetWidth
	end
	return hasRoomForPeoplePageModule(var1, var3)
end