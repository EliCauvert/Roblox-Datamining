local selfViewVisibilityUpdatedSignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local var1 = false

return {
	getSelfViewIsOpenAndVisible = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setSelfViewIsOpenAndVisible = function(value)
		-- upvalues: var1 (write), selfViewVisibilityUpdatedSignalModule (ref)
		var1 = value
		selfViewVisibilityUpdatedSignalModule:fire()
	end
}