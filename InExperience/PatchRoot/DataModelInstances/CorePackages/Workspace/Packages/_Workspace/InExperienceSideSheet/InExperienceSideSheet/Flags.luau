local SharedFlagsModule = require(script:FindFirstAncestor("InExperienceSideSheet").Parent.SharedFlags)

return {
	FFlagClosePeoplePageWhenNoRoomBesideSideSheet = require(script.FFlagClosePeoplePageWhenNoRoomBesideSideSheet),
	FFlagMountUnmountSideSheet = require(script.FFlagMountUnmountSideSheet),
	FFlagSideSheetEmphasizeLeave = require(script.FFlagSideSheetEmphasizeLeave),
	FFlagSideSheetFullWidthScrollView = require(script.FFlagSideSheetFullWidthScrollView),
	FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu,
	FFlagSideSheetOpenPeoplePage = SharedFlagsModule.FFlagSideSheetOpenPeoplePage,
	FFlagSideSheetOpenPeoplePageRestoreChat = game:DefineFastFlag("SideSheetOpenPeoplePageRestoreChat2", false),
	FFlagPioneerLogoutButtonLabel = game:DefineFastFlag("PioneerLogoutButtonLabel", false)
}