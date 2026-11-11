local CrossPlay = script:FindFirstAncestor("CrossPlay")
local ConstantsModule = require(CrossPlay.Hooks.Constants)
local config = {
	OnLeaveConstrained = require(CrossPlay.Parent.AppCommonLib).Signal.new(),
	BeginCheckXboxPrivilege = function(_, _)
		-- upvalues: ConstantsModule (copy)
		return {
			CanJoinGame = true,
			Success = true,
			PrivilegeCheckResult = ConstantsModule.PrivilegeCheckResults.NO_ISSUE
		}
	end,
	GetPlatformPartyMembers = function(_)
		return {}
	end
}
local PlatformService = nil
pcall(function()
	-- upvalues: PlatformService (ref)
	PlatformService = game:GetService("PlatformService")
end)

return PlatformService or config