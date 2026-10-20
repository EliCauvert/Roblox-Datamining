local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local PromiseModule = require(Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local GetAccessStatusModule = require(Modules.LuaApp.Http.Requests.UserAccess.GetAccessStatus)
local TutilsModule = require(CorePackages.Packages.tutils)
local SetModerationStatusModule = require(Modules.LuaApp.Actions.Moderation.SetModerationStatus)
local SetUserAccessRestrictionDetailModule = require(Modules.LuaApp.Actions.UserAccess.SetUserAccessRestrictionDetail)
local ApiFetchModerationDetailsModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchModerationDetails)
local RestrictionDetailModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionDetail)
local RestrictionSourceModule = require(Modules.LuaApp.Models.UserModerationApi.RestrictionSource)

return function(p1)
	-- upvalues: PerformFetch (copy), GetAccessStatusModule (copy), RestrictionDetailModule (copy), Logging (copy), TutilsModule (copy), PromiseModule (copy), SetModerationStatusModule (copy), SetUserAccessRestrictionDetailModule (copy), RestrictionSourceModule (copy), ApiFetchModerationDetailsModule (copy)
	return PerformFetch.Single("luaapp.usermoderationapi.UserModeration.get_v2_not_approved", function(p2)
		-- upvalues: GetAccessStatusModule (upval), p1 (copy), RestrictionDetailModule (upval), Logging (upval), TutilsModule (upval), PromiseModule (upval), SetModerationStatusModule (upval), SetUserAccessRestrictionDetailModule (upval), RestrictionSourceModule (upval), ApiFetchModerationDetailsModule (upval)
		return GetAccessStatusModule(p1):andThen(function(Result)
			-- upvalues: RestrictionDetailModule (upval), Logging (upval), TutilsModule (upval), PromiseModule (upval), p2 (copy), SetModerationStatusModule (upval), SetUserAccessRestrictionDetailModule (upval), RestrictionSourceModule (upval), ApiFetchModerationDetailsModule (upval), p1 (upval)
			local ResponseBody = Result.responseBody
			local UnwrapResult, UnwrapResult2 = RestrictionDetailModule.fromJsonData(ResponseBody):unwrap()
			
			if UnwrapResult == false then
				Logging.warn("Failed to parse Use detail. Data: " .. TutilsModule.toString(ResponseBody))
				
				return PromiseModule.reject(Result)
			end
			if UnwrapResult2.restriction == nil then
				p2:dispatch(SetModerationStatusModule(false))
				p2:dispatch(SetUserAccessRestrictionDetailModule(nil))
				
				return PromiseModule.resolve(nil)
			end
			p2:dispatch(SetUserAccessRestrictionDetailModule(UnwrapResult2.restriction))
			
			if UnwrapResult2.restriction.source == RestrictionSourceModule.Moderation then
				p2:dispatch(ApiFetchModerationDetailsModule(p1))
			end
			return PromiseModule.resolve(UnwrapResult2.restriction)
		end, function(p3)
			-- upvalues: Logging (upval), TutilsModule (upval), PromiseModule (upval)
			Logging.warn(TutilsModule.print(p3))
			
			return PromiseModule.reject(p3)
		end)
	end)
end