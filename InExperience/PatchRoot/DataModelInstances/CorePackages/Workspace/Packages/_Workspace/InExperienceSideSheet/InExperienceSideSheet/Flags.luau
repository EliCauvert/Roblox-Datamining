return {
	FFlagClosePeoplePageWhenNoRoomBesideSideSheet = require(script.FFlagClosePeoplePageWhenNoRoomBesideSideSheet),
	FFlagMountUnmountSideSheet = require(script.FFlagMountUnmountSideSheet),
	FFlagSideSheetEmphasizeLeave = require(script.FFlagSideSheetEmphasizeLeave),
	FFlagSideSheetOpenPeoplePage = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.SharedFlags).FFlagSideSheetOpenPeoplePage,
	FFlagSideSheetOpenPeoplePageRestoreChat = game:DefineFastFlag("SideSheetOpenPeoplePageRestoreChat2", false)
}