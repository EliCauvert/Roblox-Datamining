local SharedFlagsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.SharedFlags)

return {
	FFlagClosePeoplePageWhenNoRoomBesideSideSheet = require(script.FFlagClosePeoplePageWhenNoRoomBesideSideSheet),
	FFlagMountUnmountSideSheet = require(script.FFlagMountUnmountSideSheet),
	FFlagSideSheetEmphasizeLeave = require(script.FFlagSideSheetEmphasizeLeave),
	FFlagSideSheetOpenPeoplePage = SharedFlagsModule.FFlagSideSheetOpenPeoplePage,
	FFlagSideSheetOpenPeoplePageRestoreChat = game:DefineFastFlag("SideSheetOpenPeoplePageRestoreChat", false) and SharedFlagsModule.FFlagSideSheetOpenPeoplePage
}