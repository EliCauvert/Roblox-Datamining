local EventNamesModule = require(script.Parent.EventNames)
local DiagEventTypes = require(script:FindFirstAncestor("UserProfiles").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local ErrorCodesForLoggingModule = require(script.Parent.ErrorCodesForLogging)

return {
	[EventNamesModule.UserProfilesRequestBegin] = {
		name = game:DefineFastString("UserProfilesRequestBegin", "UserProfilesRequestBegin")
	},
	[EventNamesModule.UserProfilesRequestSuccess] = {
		name = game:DefineFastString("UserProfilesRequestSuccess", "UserProfilesRequestSuccess")
	},
	[EventNamesModule.UserProfilesRequestFail] = {
		name = game:DefineFastString("UserProfilesRequestFail", "UserProfilesRequestFail")
	},
	[EventNamesModule.UserProfilesRequestFailAfterRetry] = {
		name = game:DefineFastString("UserProfilesRequestFailAfterRetry", "UserProfilesRequestFailAfterRetry")
	},
	[EventNamesModule.UserProfilesRequestSuccessAfterRetry] = {
		name = game:DefineFastString("UserProfilesRequestSuccessAfterRetry", "UserProfilesRequestSuccessAfterRetry")
	},
	[EventNamesModule.UserProfilesErrorCode] = {
		type = DiagEventTypes.Counter,
		name = function(p1) --[[ Line: 31 ]]
			-- upvalues: EventNamesModule (copy), ErrorCodesForLoggingModule (copy)
			local Text = tostring(p1.status)
			local UserProfilesErrorCode = EventNamesModule.UserProfilesErrorCode
			
			if ErrorCodesForLoggingModule[Text] then
				UserProfilesErrorCode ..= Text
				
				return UserProfilesErrorCode
			else
				return UserProfilesErrorCode .. "Other"
			end
		end
	},
	[EventNamesModule.UserProfilesUnmountEarly] = {
		type = DiagEventTypes.Counter,
		name = game:DefineFastString("UserProfilesUnmountEarly", "UserProfilesUnmountEarly")
	}
}