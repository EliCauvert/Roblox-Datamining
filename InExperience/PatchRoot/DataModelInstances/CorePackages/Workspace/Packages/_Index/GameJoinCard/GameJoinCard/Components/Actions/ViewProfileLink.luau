local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Text = FoundationModule.Text
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), ControlState (copy), View (copy), StateLayerAffordance (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(View, {
		Name = "ViewProfileButton",
		tag = "row align-x-center align-y-center",
		Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_600),
		onActivated = Frame.onActivated,
		onStateChanged = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover)
		end, {}),
		stateLayer = { affordance = StateLayerAffordance.None },
		LayoutOrder = Frame.LayoutOrder
	}, {
		Label = ReactModule.createElement(Text, {
			RichText = true,
			tag = "auto-xy text-title-medium text-align-x-center content-emphasis",
			Text = if UseStateResult then `<u>{Frame.text}</u>` else Frame.text
		})
	})
end