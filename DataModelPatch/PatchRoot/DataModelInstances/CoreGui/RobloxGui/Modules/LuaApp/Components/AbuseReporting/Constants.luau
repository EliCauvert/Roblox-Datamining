return {
	PROFILE_THUMBNAIL_DATA = { Size = 420, Type = "AvatarHeadShot" },
	EXP_THUMBNAIL_DATA = { Size = 512, Type = "GameIcon" },
	ITEM_THUMBNAIL_DATA = { Size = 420, Type = "Asset" },
	SUCCESS_TOAST_DATA = {
		toastMessage = "Feature.ReportAbuse.Label.Confirmation.Title",
		toastSubMessage = "Feature.ReportAbuse.Label.Confirmation.Subheading",
		isLocalized = false,
		toastType = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.ToastType).SuccessConfirmation
	},
	BEDUI_FETCH_FAILURE = "Feature.ReportAbuse.Message.ErrorBEDUIFetchFailed",
	REPORT_SUBMIT_LOADING = "Feature.ReportAbuse.Message.Loading",
	REPORT_SUBMIT_FAILURE = "Feature.ReportAbuse.Message.ErrorSubmitFailure",
	BEDUI_FETCH_FAILURE_PRIMARY = "Trouble Loading Report",
	BEDUI_FETCH_FAILURE_SECONDARY = "Something went wrong. Please try again.",
	BEDUI_BASE_URL = "abuse-reporting/v1/dynamic-dialog",
	BEDUI_SURFACES = { VR = "vr" },
	REPORT_ENTRYPOINT = {
		Profile = "Profile",
		Chat = "Chat",
		Item = "Item",
		ExperienceDetails = "ExperienceDetails",
		Notification = "Notification"
	},
	BEDUI_FETCH_CONTEXT = {
		Profile = "profile",
		Experience = "experience",
		Item = "item",
		Notification = "notification"
	},
	ABUSE_VECTOR = {
		UserProfile = "user_profile",
		Place = "place",
		Notification = "notifications"
	},
	SAFETY_EVENT_SUBMISSION_ENTRY_POINT = {
		VR = "vr",
		Phone = "phone",
		Tablet = "tablet",
		Desktop = "desktop"
	},
	ANALYTICS_EVENT_NAMES = {
		SUBMITTED = "TreeBasedAbuseReportSubmitted",
		ABANDONED = "TreeBasedAbuseReportAbandoned"
	},
	COMMON_FORMAT_ENTRY_POINT = {
		Profile = "profile",
		Experience = "experience",
		Item = "item",
		Chat = "chat"
	},
	BEDUI_VERSIONS = { V1 = "v1", DEV = "v_dev" }
}