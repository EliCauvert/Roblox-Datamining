local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)

return function(p1)
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local var1 = signalsReactModule.useSignalState(p1.captureSource.getCaptures)
	local var2 = signalsReactModule.useSignalState(p1.captureSource.getIsFinished)
	local var3, var4 = reactModule.useState(nil)
	
	return {
		captures = var1,
		selectedCapture = var3,
		previewContent = reactModule.useMemo(function()
			-- upvalues: var3 (ref)
			return if var3 == nil or typeof(var3) ~= "Object" then nil else Content.fromObject(var3)
		end, { var3 }),
		isFinished = var2,
		onCaptureSelected = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref)
			var4(p2)
		end, {}),
		onConfirm = reactModule.useCallback(function()
			-- upvalues: var3 (ref), p1 (ref)
			if var3 ~= nil then
				p1.onCaptureConfirmed(var3)
			end
		end, { var3, p1.onCaptureConfirmed }),
		onShowMore = p1.captureSource.fetchMore
	}
end