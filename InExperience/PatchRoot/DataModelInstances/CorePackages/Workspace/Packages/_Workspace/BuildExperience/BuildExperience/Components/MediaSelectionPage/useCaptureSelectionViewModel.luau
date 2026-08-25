local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)

return function(p0)
	-- upvalues: signalsReactModule (ref), reactModule (ref)
	local var2 = signalsReactModule.useSignalState(p0.captureSource.getCaptures)
	local var3 = signalsReactModule.useSignalState(p0.captureSource.getIsFinished)
	local var4, var5 = reactModule.useState(nil)
	
	return {
		captures = var2,
		selectedCapture = var4,
		previewContent = reactModule.useMemo(function()
			-- upvalues: var4 (ref)
			return if var4 == nil or typeof(var4) ~= "Object" then nil else Content.fromObject(var4)
		end, { var4 }),
		isFinished = var3,
		onCaptureSelected = reactModule.useCallback(function(p1)
			-- upvalues: var5 (ref)
			var5(p1)
		end, {}),
		onConfirm = reactModule.useCallback(function()
			-- upvalues: var4 (ref), p0 (ref)
			if var4 ~= nil then
				p0.onCaptureConfirmed(var4)
			end
		end, { var4, p0.onCaptureConfirmed }),
		onShowMore = p0.captureSource.fetchMore
	}
end