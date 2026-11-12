local SendBuildExperienceEventModule = require(script:FindFirstAncestor("BuildExperience").Telemetry.sendBuildExperienceEvent)

local function getEventParameters(Action, p1, List)
	local config = {
		action = Action,
		context = if p1 == nil then "unknown" else p1,
		isInExperience = if game.GameId == 0 then "false" else "true"
	}
	
	if List ~= nil then
		for i, value in List do
			config[i] = value
		end
	end
	return config
end

return {
	Action = {
		ArchiveGame = "archive_game",
		AudienceChange = "audience_change",
		ExperienceDetailsSave = "experience_details_save",
		Publish = "publish",
		Share = "share",
		UpdateRating = "update_rating",
		VersionDetailsSave = "version_details_save"
	},
	Context = {
		AudienceBanner = "audience_banner",
		GamesList = "games_list",
		PublishFooter = "publish_footer",
		PublishSnackbar = "publish_snackbar",
		Settings = "settings"
	},
	FailureReason = {
		AccountTooNew = "account_too_new",
		AudienceNotPublic = "audience_not_public",
		ContentUnrated = "content_unrated",
		RatingRequired = "rating_required",
		RequestFailed = "request_failed"
	},
	Stage = {
		RefreshEligibility = "refresh_eligibility",
		RefreshSummary = "refresh_summary",
		SaveAndPublish = "save_and_publish",
		SetAudience = "set_audience"
	},
	getChangedFields = function(p2, p3): string
		return if p2 and p3 then "title,description" elseif p2 then "title" else "description"
	end,
	sendClick = function(Action, p2, p3, p4)
		-- upvalues: SendBuildExperienceEventModule (copy), getEventParameters (copy)
		SendBuildExperienceEventModule("CONFIGURATION_ACTION_CLICK", p2, (getEventParameters(Action, p3, p4)))
	end,
	sendSuccess = function(Action, p2, p3, p4)
		-- upvalues: SendBuildExperienceEventModule (copy), getEventParameters (copy)
		SendBuildExperienceEventModule("CONFIGURATION_ACTION_SUCCESS", p2, (getEventParameters(Action, p3, p4)))
	end,
	sendFailure = function(Action, p2, p3, p4, p5)
		-- upvalues: getEventParameters (copy), SendBuildExperienceEventModule (copy)
		local EventParameters = getEventParameters(Action, p4, p5)
		EventParameters.reason = p3.reason
		local Stage = p3.stage
		
		if Stage ~= nil then
			EventParameters.stage = Stage
		end
		local Error = if type(p3.error) == "table" then p3.error else nil
		local Number = if Error == nil then nil else tonumber(Error.responseCode)
		local Response = if Error == nil or type(Error.response) ~= "table" then nil else Error.response
		local Number1 = if Response == nil then nil else tonumber(Response.statusCode)
		
		if Number ~= nil then
			EventParameters.errorCode = tostring(Number)
		end
		if Number1 ~= nil then
			EventParameters.httpStatus = tostring(Number1)
		end
		SendBuildExperienceEventModule("CONFIGURATION_ACTION_FAILURE", p2, EventParameters)
	end
}