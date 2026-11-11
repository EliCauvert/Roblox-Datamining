local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ModerationDetailModule = require(Modules.LuaApp.Models.UserModerationApi.ModerationDetail)
local GetModerationDetailModule = require(Modules.LuaApp.Http.Requests.ModerationAPI.GetModerationDetail)
local SetModerationDetailModule = require(Modules.LuaApp.Actions.Moderation.SetModerationDetail)
local TutilsModule = require(CorePackages.Packages.tutils)
local SetModerationStatusModule = require(Modules.LuaApp.Actions.Moderation.SetModerationStatus)

return function(p1)
	-- upvalues: PerformFetch (copy), GetModerationDetailModule (copy), Logging (copy), SetModerationStatusModule (copy), PromiseModule (copy), ModerationDetailModule (copy), MutedErrorModule (copy), TutilsModule (copy), SetModerationDetailModule (copy)
	return PerformFetch.Single("luaapp.usermoderationapi.UserModeration.get_v1_not_approved", function(p2)
		-- upvalues: GetModerationDetailModule (upval), p1 (copy), Logging (upval), SetModerationStatusModule (upval), PromiseModule (upval), ModerationDetailModule (upval), MutedErrorModule (upval), TutilsModule (upval), SetModerationDetailModule (upval)
		return GetModerationDetailModule(p1):andThen(function(Result)
			-- upvalues: Logging (upval), p2 (copy), SetModerationStatusModule (upval), PromiseModule (upval), ModerationDetailModule (upval), MutedErrorModule (upval), TutilsModule (upval), SetModerationDetailModule (upval)
			local ResponseBody = Result.responseBody
			Logging.warn("The user is moderated with type: `" .. tostring(ResponseBody.punishmentTypeDescription) .. "`")
			Logging.warn("Verification category is: `" .. tostring(ResponseBody.verificationCategory) .. "`")
			
			if ResponseBody.punishmentTypeDescription == nil then
				p2:dispatch(SetModerationStatusModule(false))
				
				return PromiseModule.resolve()
			end
			local FromJsonDataResult = ModerationDetailModule.fromJsonData(ResponseBody)
			local UnwrapResult, UnwrapResult2 = FromJsonDataResult:unwrap()
			
			if UnwrapResult == false then
				Logging.warn("Failed to parse moderation detail.")
				MutedErrorModule("(Moderation) Failed to parse moderation detail. Data: " .. TutilsModule.toString(ResponseBody))
				
				return PromiseModule.reject(Result)
			else
				p2:dispatch(SetModerationDetailModule(UnwrapResult2))
				
				return PromiseModule.resolve(FromJsonDataResult)
			end
		end, function(p3)
			-- upvalues: Logging (upval), TutilsModule (upval), MutedErrorModule (upval), PromiseModule (upval)
			Logging.warn("Failed to get moderation detail: ")
			Logging.warn(TutilsModule.print(p3))
			MutedErrorModule("(Moderation) Failed to get moderation detail: " .. TutilsModule.toString(p3))
			
			return PromiseModule.reject(p3)
		end)
	end)
end