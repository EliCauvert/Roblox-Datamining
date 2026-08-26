local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local textInput = foundationModule.TextInput
local view = foundationModule.View
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), textInput (ref)
	local onAnswerChanged = p1.onAnswerChanged
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		Input = reactModule.createElement(textInput, {
			label = "",
			text = p1.answer.text or "",
			width = UDim.new(1, 0),
			isDisabled = p1.isDisabled,
			onChanged = reactModule.useCallback(function(p2)
				-- upvalues: onAnswerChanged (ref)
				onAnswerChanged({ text = p2 })
			end, { onAnswerChanged })
		})
	})
end)