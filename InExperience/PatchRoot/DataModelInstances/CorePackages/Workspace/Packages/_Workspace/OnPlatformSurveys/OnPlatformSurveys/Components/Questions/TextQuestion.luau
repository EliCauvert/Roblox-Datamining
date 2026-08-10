local onPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local parent = onPlatformSurveys.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local textInput = foundationModule.TextInput
local view = foundationModule.View
local _ = require(onPlatformSurveys.Types.InlineSurveyTypes)

return reactModule.memo(function(p0) --[[ line: 21 | named "TextQuestion" ]]
	-- upvalues: reactModule (ref), view (ref), textInput (ref)
	local onAnswerChanged = p0.onAnswerChanged
	
	return reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = p0.layoutOrder }, {
		Input = reactModule.createElement(textInput, {
			label = "",
			text = p0.answer.text or "",
			width = UDim.new(1, 0),
			isDisabled = p0.isDisabled,
			onChanged = reactModule.useCallback(function(p1) --[[ line: 23 ]]
				-- upvalues: onAnswerChanged (ref)
				onAnswerChanged({ text = p1 })
			end, { onAnswerChanged })
		})
	})
end)