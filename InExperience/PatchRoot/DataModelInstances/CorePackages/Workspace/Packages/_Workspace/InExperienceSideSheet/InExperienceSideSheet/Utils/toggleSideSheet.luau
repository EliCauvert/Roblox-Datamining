local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local getDrawerVisibleStore = require(inExperienceSideSheet.Parent.Drawer).Stores.GetDrawerVisibleStore
local flagsModule = require(inExperienceSideSheet.Flags)
local getSideSheetConfigStoreModule = require(inExperienceSideSheet.Stores.GetSideSheetConfigStore)
local getHasRoomForPeoplePageModule = require(inExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local registerInGameMenuPeoplePageActionsModule = require(inExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)
local fFlagSideSheetOpenPeoplePage = flagsModule.FFlagSideSheetOpenPeoplePage

return function(p1)
	-- upvalues: getDrawerVisibleStore (ref), fFlagSideSheetOpenPeoplePage (ref), getHasRoomForPeoplePageModule (ref), getSideSheetConfigStoreModule (ref), registerInGameMenuPeoplePageActionsModule (ref)
	local var1 = getDrawerVisibleStore(false)
	local var2 = fFlagSideSheetOpenPeoplePage and (p1 and getHasRoomForPeoplePageModule())
	
	if fFlagSideSheetOpenPeoplePage and p1 then
		getSideSheetConfigStoreModule(false).setDidSideSheetOpenWithPeoplePage(var2)
	end
	var1.setDrawerVisible(p1)
	
	if var2 then
		task.delay(0, function()
			-- upvalues: var1 (ref), registerInGameMenuPeoplePageActionsModule (copy)
			if var1.getDrawerVisible(false) then
				registerInGameMenuPeoplePageActionsModule.openPeoplePage()
			end
		end)
	end
end