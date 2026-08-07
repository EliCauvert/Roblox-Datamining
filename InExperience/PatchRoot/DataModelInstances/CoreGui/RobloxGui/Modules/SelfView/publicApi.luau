local selfViewVisibilityUpdatedSignalModule = require(game:GetService("CoreGui").RobloxGui.Modules.SelfView.selfViewVisibilityUpdatedSignal)
local var1 = false

return {
	getSelfViewIsOpenAndVisible = function() --[[ line: 8 ]]
		-- upvalues: var1 (write)
		return var1
	end,
	setSelfViewIsOpenAndVisible = function(value) --[[ line: 14 ]]
		-- upvalues: var1 (write), selfViewVisibilityUpdatedSignalModule (ref)
		var1 = value
		selfViewVisibilityUpdatedSignalModule:fire()
	end
}