local SelfViewVisibilityUpdatedSignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local SelfViewIsOpenAndVisible = false

return {
	getSelfViewIsOpenAndVisible = function()
		-- upvalues: SelfViewIsOpenAndVisible (ref)
		return SelfViewIsOpenAndVisible
	end,
	setSelfViewIsOpenAndVisible = function(Value)
		-- upvalues: SelfViewIsOpenAndVisible (ref), SelfViewVisibilityUpdatedSignalModule (copy)
		SelfViewIsOpenAndVisible = Value
		SelfViewVisibilityUpdatedSignalModule:fire()
	end
}