local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens

return reactModule.forwardRef(function(p0, p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full row flex-between",
		Size = p0.Size,
		ZIndex = p0.ZIndex,
		LayoutOrder = p0.LayoutOrder,
		NextSelectionUp = p0.NextSelectionUp,
		NextSelectionDown = p0.NextSelectionDown,
		backgroundStyle = var2.Color.Surface.Surface_0,
		ref = p1,
		padding = if p0.padding then {
			left = UDim.new(0, p0.padding.left or 0),
			right = UDim.new(0, p0.padding.right or 0),
			top = UDim.new(0, p0.padding.top or 0),
			bottom = UDim.new(0, p0.padding.bottom or 0)
		} else nil
	}, {
		Title = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-align-x-left text-heading-small",
			LayoutOrder = 1,
			Text = p0.text or ""
		}),
		CloseButton = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			LayoutOrder = 2,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p0.onClose
		}, {
			ButtonImage = reactModule.createElement(foundationModule.Image, {
				Image = "icons/navigation/close",
				tag = "size-600-600",
				imageStyle = var2.Color.Content.Emphasis
			})
		})
	})
end)