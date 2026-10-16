local SelfViewVisibilityUpdatedSignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local SelfViewIsOpenAndVisible = false

return {
	getSelfViewIsOpenAndVisible = function() --[[ Line: 8 ]]
		-- upvalues: SelfViewIsOpenAndVisible (ref)
		return SelfViewIsOpenAndVisible
	end,
	setSelfViewIsOpenAndVisible = function(Value) --[[ Line: 14 ]]
		-- upvalues: SelfViewIsOpenAndVisible (ref), SelfViewVisibilityUpdatedSignalModule (copy)
		SelfViewIsOpenAndVisible = Value
		SelfViewVisibilityUpdatedSignalModule:fire()
	end
}