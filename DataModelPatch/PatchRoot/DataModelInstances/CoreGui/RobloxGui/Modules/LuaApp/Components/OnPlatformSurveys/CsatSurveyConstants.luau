local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus

return {
	LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS = "CsatCompletedSurveyIds",
	LOCAL_STORAGE_KEY_CSAT_LAST_SURVBLOX_CALL_TIMESTAMP = "CsatLastSurvBloxCallTimestamp",
	LOCAL_STORAGE_CSAT_SURVEY_IDS_LIMIT = 10,
	LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION = "ExperienceMenuVersion",
	ANALYTICS_CONTEXT_APP = "app",
	ANALYTICS_EXPERIMENT_MENU_GET_COMPLETED_SURVEY_IDS_FIELD = "get_completed_survey_ids",
	ANALYTICS_EXPERIMENT_MENU_SET_COMPLETED_SURVEY_IDS_FIELD = "set_completed_survey_ids",
	ANALYTICS_EXPERIMENT_MENU_GET_LAST_SURVBLOX_CALL_TIMESTAMP = "get_last_survblox_call_timestamp",
	ANALYTICS_SURVEY_EVENT = "survey_event",
	WEBVIEW_NAME_KEY = "Feature.QualtricsSurveyPrompt.Heading.WebviewName",
	CHROME_SURVEY_NAME = "chromeSurvey",
	ON_GAME_LEAVE_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Game", "onGameLeave"),
		validateParams = TModule.table
	},
	ON_SURVEY_EVENT_DESCRIPTOR = {
		mid = MessageBus.getMessageId("Game", "openSurvey"),
		validateParams = TModule.strictInterface({
			eventType = TModule.string,
			userId = TModule.optional(TModule.string),
			customProps = TModule.optional(TModule.table)
		})
	},
	EVENT_TYPE_ENUM = { ON_LEAVE_BUTTON_CLICK = "leaveButtonClick" }
}