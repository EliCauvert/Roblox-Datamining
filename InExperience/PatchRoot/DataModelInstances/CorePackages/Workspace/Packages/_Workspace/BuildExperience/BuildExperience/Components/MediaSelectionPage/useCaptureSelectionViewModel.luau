local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)

return function(p1) --[[ Line: 22 | Named "useCaptureSelectionViewModel" ]]
	-- upvalues: SignalsReactModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.captureSource.getCaptures)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(p1.captureSource.getIsFinished)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return {
		captures = UseSignalStateResult,
		selectedCapture = UseStateResult,
		previewContent = ReactModule.useMemo(function() --[[ Line: 27 ]]
			-- upvalues: UseStateResult (copy)
			return if UseStateResult == nil or typeof(UseStateResult) ~= "Object" then nil else Content.fromObject(UseStateResult)
		end, { UseStateResult }),
		isFinished = UseSignalStateResult1,
		onCaptureSelected = ReactModule.useCallback(function(p2) --[[ Line: 34 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2)
		end, {}),
		onConfirm = ReactModule.useCallback(function() --[[ Line: 38 ]]
			-- upvalues: UseStateResult (copy), p1 (copy)
			if UseStateResult ~= nil then
				p1.onCaptureConfirmed(UseStateResult)
			end
		end, { UseStateResult, p1.onCaptureConfirmed }),
		onShowMore = p1.captureSource.fetchMore
	}
end