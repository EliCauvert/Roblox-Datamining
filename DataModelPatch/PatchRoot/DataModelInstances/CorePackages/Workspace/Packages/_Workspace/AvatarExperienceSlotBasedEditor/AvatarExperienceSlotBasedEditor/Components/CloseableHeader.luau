local Parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return (ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-full row flex-between",
		Size = Frame.Size,
		ZIndex = Frame.ZIndex,
		LayoutOrder = Frame.LayoutOrder,
		NextSelectionUp = Frame.NextSelectionUp,
		NextSelectionDown = Frame.NextSelectionDown,
		backgroundStyle = UseTokensResult.Color.Surface.Surface_0,
		ref = Ref,
		padding = if Frame.padding then {
			left = UDim.new(0, Frame.padding.left or 0),
			right = UDim.new(0, Frame.padding.right or 0),
			top = UDim.new(0, Frame.padding.top or 0),
			bottom = UDim.new(0, Frame.padding.bottom or 0)
		} else nil
	}, {
		Title = ReactModule.createElement(FoundationModule.Text, {
			tag = "auto-xy text-align-x-left text-heading-small",
			LayoutOrder = 1,
			Text = Frame.text or ""
		}),
		CloseButton = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy",
			LayoutOrder = 2,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = Frame.onClose
		}, {
			ButtonImage = ReactModule.createElement(FoundationModule.Image, {
				Image = "icons/navigation/close",
				tag = "size-600-600",
				imageStyle = UseTokensResult.Color.Content.Emphasis
			})
		})
	})
end))