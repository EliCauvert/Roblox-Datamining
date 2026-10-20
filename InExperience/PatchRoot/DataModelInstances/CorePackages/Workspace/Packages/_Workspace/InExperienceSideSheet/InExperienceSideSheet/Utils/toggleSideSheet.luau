local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local GetDrawerVisibleStoreFunction = require(InExperienceSideSheet.Parent.Drawer).Stores.GetDrawerVisibleStore
local GetSideSheetConfigStoreModule = require(InExperienceSideSheet.Stores.GetSideSheetConfigStore)
local GetHasRoomForPeoplePageModule = require(InExperienceSideSheet.Utils.getHasRoomForPeoplePage)
local RegisterInGameMenuPeoplePageActionsModule = require(InExperienceSideSheet.Utils.registerInGameMenuPeoplePageActions)
local FFlagSideSheetOpenPeoplePage = require(InExperienceSideSheet.Flags).FFlagSideSheetOpenPeoplePage

return function(p1)
	-- upvalues: GetDrawerVisibleStoreFunction (copy), FFlagSideSheetOpenPeoplePage (copy), GetHasRoomForPeoplePageModule (copy), GetSideSheetConfigStoreModule (copy), RegisterInGameMenuPeoplePageActionsModule (copy)
	local DrawerVisibleStore = GetDrawerVisibleStoreFunction(false)
	local HasRoomForPeoplePageModule = FFlagSideSheetOpenPeoplePage and (p1 and GetHasRoomForPeoplePageModule())
	
	if FFlagSideSheetOpenPeoplePage and p1 then
		GetSideSheetConfigStoreModule(false).setDidSideSheetOpenWithPeoplePage(HasRoomForPeoplePageModule)
	end
	DrawerVisibleStore.setDrawerVisible(p1)
	
	if HasRoomForPeoplePageModule then
		task.delay(0, function()
			-- upvalues: DrawerVisibleStore (copy), RegisterInGameMenuPeoplePageActionsModule (upval)
			if DrawerVisibleStore.getDrawerVisible(false) then
				RegisterInGameMenuPeoplePageActionsModule.openPeoplePage()
			end
		end)
	end
end