local Parent = script:FindFirstAncestor("SocialCommon").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SearchFieldModule = require(script.Parent.SearchField)

return function(Frame)
	-- upvalues: ReactModule (copy), FoundationModule (copy), SearchFieldModule (copy)
	local OnExit = Frame.onExit
	local ExitVariant = Frame.exitVariant or "Cancel"
	local ExitTestId = Frame.exitTestId or "SearchRow"
	local Height = Frame.height
	local PaddingHorizontal = Frame.paddingHorizontal
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["row align-y-center gap-small"] = true,
			["size-full"] = Height == nil
		},
		Size = if Height then UDim2.new(1, 0, 0, Height) else nil,
		LayoutOrder = Frame.LayoutOrder,
		padding = if PaddingHorizontal then {
			left = UDim.new(0, PaddingHorizontal),
			right = UDim.new(0, PaddingHorizontal)
		} else nil
	}, {
		back = if OnExit and ExitVariant == "Chevron" then ReactModule.createElement(FoundationModule.IconButton, {
			LayoutOrder = 1,
			icon = FoundationModule.Enums.IconName.ChevronLargeLeft,
			size = FoundationModule.Enums.InputSize.Medium,
			testId = `{ExitTestId}Back`,
			onActivated = OnExit
		}) else nil,
		field = ReactModule.createElement(FoundationModule.View, { tag = "grow auto-y", LayoutOrder = 2 }, {
			input = ReactModule.createElement(SearchFieldModule, {
				text = Frame.text,
				placeholder = Frame.placeholder,
				shouldAutoFocus = Frame.shouldAutoFocus,
				onChanged = Frame.onChanged,
				onExit = OnExit,
				onFocusGained = Frame.onFocusGained,
				testId = Frame.testId
			})
		}),
		cancel = if OnExit and ExitVariant == "Cancel" then ReactModule.createElement(FoundationModule.Button, {
			LayoutOrder = 3,
			text = Frame.cancelText or "",
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			size = FoundationModule.Enums.InputSize.Medium,
			testId = `{ExitTestId}Cancel`,
			onActivated = OnExit
		}) else nil
	})
end