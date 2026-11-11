local EventIngestService = game:GetService("EventIngestService")
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.Constants)
local COMMONFORMATENTRYPOINT = ConstantsModule.COMMON_FORMAT_ENTRY_POINT
local REPORTENTRYPOINT = ConstantsModule.REPORT_ENTRYPOINT

local function getCommonFormattedEntryPoint(Chat)
	-- upvalues: COMMONFORMATENTRYPOINT (copy), REPORTENTRYPOINT (copy)
	return if Chat == COMMONFORMATENTRYPOINT.Profile or Chat == COMMONFORMATENTRYPOINT.Chat or Chat == COMMONFORMATENTRYPOINT.Experience or Chat == COMMONFORMATENTRYPOINT.Item then Chat elseif Chat == REPORTENTRYPOINT.Profile then COMMONFORMATENTRYPOINT.Profile elseif Chat == REPORTENTRYPOINT.Chat then COMMONFORMATENTRYPOINT.Chat elseif Chat == REPORTENTRYPOINT.ExperienceDetails then COMMONFORMATENTRYPOINT.Experience elseif Chat == REPORTENTRYPOINT.Item then COMMONFORMATENTRYPOINT.Item else ""
end

local ActionTypes = {
	SET_BASIC_INFO = "SET_BASIC_INFO",
	INCREMENT_SELECTION_ITEM = "INCREMENT_SELECTION_ITEM",
	INCREMENT_BACK_BUTTON_CLICK = "INCREMENT_BACK_BUTTON_CLICK",
	SET_IS_SEEN_SUMMARY_PAGE = "SET_IS_SEEN_SUMMARY_PAGE"
}

return {
	reportAnalyticsReducer = function(Tbl, p1)
		-- upvalues: ActionTypes (copy), getCommonFormattedEntryPoint (copy)
		local Copy = table.clone(Tbl)
		
		if p1.type == ActionTypes.SET_BASIC_INFO then
			Copy.platform = p1.platform
			Copy.dialogEntryPoint = getCommonFormattedEntryPoint(p1.dialogEntryPoint)
			
			return Copy
		end
		if p1.type == ActionTypes.INCREMENT_SELECTION_ITEM then
			Copy.selectItemCount += 1
			
			return Copy
		end
		if p1.type == ActionTypes.INCREMENT_BACK_BUTTON_CLICK then
			Copy.backButtonClickCount += 1
			
			return Copy
		end
		if p1.type == ActionTypes.SET_IS_SEEN_SUMMARY_PAGE then
			Copy.isSeenSummaryPage = true
		end
		return Copy
	end,
	EMPTY_LOGGING_STATE = {
		platform = "",
		dialogEntryPoint = "",
		selectItemCount = 0,
		backButtonClickCount = 0,
		isSeenSummaryPage = false
	},
	sendEventData = function(AdditionalArgs, EventName)
		-- upvalues: EventIngestService (copy)
		if AdditionalArgs.platform ~= "" and AdditionalArgs.dialogEntryPoint ~= "" then
			EventIngestService:SendEventDeferred(AdditionalArgs.platform, AdditionalArgs.dialogEntryPoint, EventName, AdditionalArgs)
		end
	end,
	ActionTypes = ActionTypes
}