local sharedFlagsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.SharedFlags)

return {
	FFlagClosePeoplePageWhenNoRoomBesideSideSheet = require(script.FFlagClosePeoplePageWhenNoRoomBesideSideSheet),
	FFlagMountUnmountSideSheet = require(script.FFlagMountUnmountSideSheet),
	FFlagSideSheetOpenPeoplePage = sharedFlagsModule.FFlagSideSheetOpenPeoplePage,
	FFlagSideSheetOpenPeoplePageRestoreChat = game:DefineFastFlag("SideSheetOpenPeoplePageRestoreChat", false) and sharedFlagsModule.FFlagSideSheetOpenPeoplePage
}