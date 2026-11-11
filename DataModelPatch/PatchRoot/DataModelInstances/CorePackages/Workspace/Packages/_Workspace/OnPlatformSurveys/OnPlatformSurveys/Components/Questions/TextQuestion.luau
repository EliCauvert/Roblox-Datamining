local OnPlatformSurveys = script:FindFirstAncestor("OnPlatformSurveys")
local Parent = OnPlatformSurveys.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local _ = require(OnPlatformSurveys.Types.InlineSurveyTypes)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), TextInput (copy)
	local OnAnswerChangedFunction = p1.onAnswerChanged
	
	return ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		Input = ReactModule.createElement(TextInput, {
			label = "",
			text = p1.answer.text or "",
			width = UDim.new(1, 0),
			isDisabled = p1.isDisabled,
			onChanged = ReactModule.useCallback(function(Text)
				-- upvalues: OnAnswerChangedFunction (copy)
				OnAnswerChangedFunction({ text = Text })
			end, { OnAnswerChangedFunction })
		})
	})
end)