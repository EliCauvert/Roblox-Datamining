local eventNamesModule = require(script.Parent.EventNames)
local diagEventTypes = require(script:FindFirstAncestor("UserProfiles").Parent.SocialLuaAnalytics).Analytics.Enums.DiagEventTypes
local errorCodesForLoggingModule = require(script.Parent.ErrorCodesForLogging)

return {
	[eventNamesModule.UserProfilesRequestBegin] = {
		name = game:DefineFastString("UserProfilesRequestBegin", "UserProfilesRequestBegin")
	},
	[eventNamesModule.UserProfilesRequestSuccess] = {
		name = game:DefineFastString("UserProfilesRequestSuccess", "UserProfilesRequestSuccess")
	},
	[eventNamesModule.UserProfilesRequestFail] = {
		name = game:DefineFastString("UserProfilesRequestFail", "UserProfilesRequestFail")
	},
	[eventNamesModule.UserProfilesRequestFailAfterRetry] = {
		name = game:DefineFastString("UserProfilesRequestFailAfterRetry", "UserProfilesRequestFailAfterRetry")
	},
	[eventNamesModule.UserProfilesRequestSuccessAfterRetry] = {
		name = game:DefineFastString("UserProfilesRequestSuccessAfterRetry", "UserProfilesRequestSuccessAfterRetry")
	},
	[eventNamesModule.UserProfilesErrorCode] = {
		type = diagEventTypes.Counter,
		name = function(p0)
			-- upvalues: eventNamesModule (ref), errorCodesForLoggingModule (ref)
			local var2 = tostring(p0.status)
			local userProfilesErrorCode = eventNamesModule.UserProfilesErrorCode
			
			if errorCodesForLoggingModule[var2] then
				userProfilesErrorCode ..= var2
				
				return userProfilesErrorCode
			end
			return userProfilesErrorCode .. "Other"
		end
	},
	[eventNamesModule.UserProfilesUnmountEarly] = {
		type = diagEventTypes.Counter,
		name = game:DefineFastString("UserProfilesUnmountEarly", "UserProfilesUnmountEarly")
	}
}