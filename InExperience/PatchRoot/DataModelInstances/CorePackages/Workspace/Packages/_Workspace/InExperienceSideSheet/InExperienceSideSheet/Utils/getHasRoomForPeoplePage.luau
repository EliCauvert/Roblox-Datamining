local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local displayModule = require(inExperienceSideSheet.Parent.Display)
local constantsModule = require(inExperienceSideSheet.Common.Constants)
local getSideSheetDrawerWidthModule = require(script.Parent.getSideSheetDrawerWidth)
local hasRoomForPeoplePageModule = require(script.Parent.hasRoomForPeoplePage)

return function()
	-- upvalues: displayModule (ref), getSideSheetDrawerWidthModule (ref), constantsModule (ref), hasRoomForPeoplePageModule (ref)
	local displayStore = displayModule.GetDisplayStore(false)
	local deviceSafePadding = displayStore.getDeviceSafePadding(false)
	local var1 = displayStore.getViewportSize(false).X - deviceSafePadding.left - deviceSafePadding.right
	local var2 = getSideSheetDrawerWidthModule()
	
	if var2 <= 0 then
		var2 = constantsModule.NominalSideSheetWidth
	end
	return hasRoomForPeoplePageModule(var1, var2)
end