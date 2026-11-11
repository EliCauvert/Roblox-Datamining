local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)

return function(FailureReason, ExpirationTimeInMinutes)
	-- upvalues: SetCentralOverlayModule (copy), OverlayTypeModule (copy)
	return function(p1)
		-- upvalues: SetCentralOverlayModule (upval), OverlayTypeModule (upval), FailureReason (copy), ExpirationTimeInMinutes (copy)
		p1:dispatch(SetCentralOverlayModule(OverlayTypeModule.EconomicRestrictionPrompt, {
			failureReason = FailureReason,
			expirationTimeInMinutes = ExpirationTimeInMinutes
		}))
	end
end