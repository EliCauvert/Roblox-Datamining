local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local ApiFetchModerationDetailsModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchModerationDetails)
local SetModerationStatusModule = require(Modules.LuaApp.Actions.Moderation.SetModerationStatus)
local DetectModeratedUserModule = require(Modules.LuaApp.Thunks.Moderation.DetectModeratedUser)
local ApiFetchAccessStatusModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchAccessStatus)
local LoginStatusModule = require(Modules.LuaApp.Enum.LoginStatus)
local FFlagEnableUserAccessServiceIntegration = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableUserAccessServiceIntegration
local FFlagCheckUserModerationAfterLogin = require(CorePackages.Workspace.Packages.SharedFlags).FFlagCheckUserModerationAfterLogin

return function(p1, p2)
	-- upvalues: FFlagCheckUserModerationAfterLogin (copy), LoginStatusModule (copy), DetectModeratedUserModule (copy), Logging (copy), SetModerationStatusModule (copy), FFlagEnableUserAccessServiceIntegration (copy), ApiFetchAccessStatusModule (copy), ApiFetchModerationDetailsModule (copy)
	return function(p3)
		-- upvalues: FFlagCheckUserModerationAfterLogin (upval), LoginStatusModule (upval), DetectModeratedUserModule (upval), p2 (copy), Logging (upval), SetModerationStatusModule (upval), FFlagEnableUserAccessServiceIntegration (upval), ApiFetchAccessStatusModule (upval), p1 (copy), ApiFetchModerationDetailsModule (upval)
		local Moderation = p3:getState().Moderation
		
		if Moderation and Moderation.userModerated or false then return end
		if FFlagCheckUserModerationAfterLogin and p3:getState().AuthenticationStatus.status ~= LoginStatusModule.LOGGED_IN then return end
		if DetectModeratedUserModule(p2) then
			Logging.warn("The user is moderated.")
			p3:dispatch(SetModerationStatusModule(true))
			
			if FFlagEnableUserAccessServiceIntegration then
				p3:dispatch(ApiFetchAccessStatusModule(p1))
				
				return
			end
			p3:dispatch(ApiFetchModerationDetailsModule(p1))
		end
	end
end