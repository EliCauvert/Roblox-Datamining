local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.FeedbackAction)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconVariant = FoundationModule.Enums.IconVariant
local InputSize = FoundationModule.Enums.InputSize

return function(p1) --[[ Line: 34 | Named "UserFeedback" ]]
	-- upvalues: IconVariant (copy), ReactModule (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy), View (copy)
	local TestId = p1.testId or "user-feedback"
	local OnActivatedFunction = p1.onActivated
	local SelectedAction = p1.selectedAction
	local Elements = {}
	
	for LayoutOrder, icon in p1.icons do
		local IsSelectedActionMatch = SelectedAction == icon.action
		Elements[icon.testId or `{icon.iconName}-{LayoutOrder}`] = ReactModule.createElement(IconButton, {
			LayoutOrder = LayoutOrder,
			icon = if IsSelectedActionMatch then { name = icon.iconName, variant = IconVariant.Filled } else icon.iconName,
			isDisabled = icon.isDisabled,
			onActivated = function() --[[ Line: 52 ]]
				-- upvalues: SelectedAction (copy), icon (copy), OnActivatedFunction (copy)
				if SelectedAction ~= icon.action or icon.allowRepeatedActivation == true then
					OnActivatedFunction(icon)
					
					return
				end
			end,
			size = InputSize.Small,
			variant = ButtonVariant.Utility,
			testId = icon.testId or `{TestId}-{icon.iconName}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "row align-y-center size-full-0 auto-y padding-top-small",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row wrap align-x-right align-y-center gap-small auto-xy"
		}, Elements)
	})
end