local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local FollowingsGetStatusModule = require(Modules.LuaApp.Http.Requests.FollowingsGetStatus)
local SetGameFollowingStatusModule = require(Modules.LuaApp.Actions.SetGameFollowingStatus)
local SetExperienceNotificationsEnabledCountModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount)
local SetExperienceNotificationsEnabledLimitModule = require(Modules.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit)

return function(p1, Text: string)
	-- upvalues: PerformFetch (copy), FollowingsGetStatusModule (copy), SetGameFollowingStatusModule (copy), SetExperienceNotificationsEnabledCountModule (copy), SetExperienceNotificationsEnabledLimitModule (copy), PromiseModule (copy), Logging (copy)
	if type(Text) ~= "string" then
		error("ApiFetchGameFollowingStatus thunk expects universeId to be a string")
	end
	return PerformFetch.Single("ApiFetchGameFollowingStatus" .. Text, function(p2)
		-- upvalues: FollowingsGetStatusModule (upval), p1 (copy), Text (copy), SetGameFollowingStatusModule (upval), SetExperienceNotificationsEnabledCountModule (upval), SetExperienceNotificationsEnabledLimitModule (upval), PromiseModule (upval), Logging (upval)
		return FollowingsGetStatusModule(p1, p2:getState().LocalUserId, Text):andThen(function(Result)
			-- upvalues: p2 (copy), SetGameFollowingStatusModule (upval), Text (upval), SetExperienceNotificationsEnabledCountModule (upval), SetExperienceNotificationsEnabledLimitModule (upval), PromiseModule (upval), Logging (upval)
			local ResponseBody = Result.responseBody
			
			if ResponseBody == nil or ResponseBody.CanFollow == nil or ResponseBody.IsFollowing == nil then
				Logging.warn("Response from FollowingsGetStatus is malformed!")
				
				return PromiseModule.reject({ HttpError = Enum.HttpError.OK })
			else
				p2:dispatch(SetGameFollowingStatusModule(Text, ResponseBody.CanFollow, ResponseBody.IsFollowing))
				local Number: number = if ResponseBody.FollowingLimitByType == nil then 0 else tonumber(ResponseBody.FollowingLimitByType)
				p2:dispatch(SetExperienceNotificationsEnabledCountModule(if ResponseBody.FollowingCountByType == nil then 0 else tonumber(ResponseBody.FollowingCountByType)))
				p2:dispatch(SetExperienceNotificationsEnabledLimitModule(Number))
				
				return PromiseModule.resolve(Result)
			end
		end)
	end)
end