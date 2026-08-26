local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full row flex-between",
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		LayoutOrder = p1.LayoutOrder,
		NextSelectionUp = p1.NextSelectionUp,
		NextSelectionDown = p1.NextSelectionDown,
		backgroundStyle = var1.Color.Surface.Surface_0,
		ref = p2,
		padding = if p1.padding then {
			left = UDim.new(0, p1.padding.left or 0),
			right = UDim.new(0, p1.padding.right or 0),
			top = UDim.new(0, p1.padding.top or 0),
			bottom = UDim.new(0, p1.padding.bottom or 0)
		} else nil
	}, {
		Title = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-align-x-left text-heading-small",
			LayoutOrder = 1,
			Text = p1.text or ""
		}),
		CloseButton = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy",
			LayoutOrder = 2,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			onActivated = p1.onClose
		}, {
			ButtonImage = reactModule.createElement(foundationModule.Image, {
				Image = "icons/navigation/close",
				tag = "size-600-600",
				imageStyle = var1.Color.Content.Emphasis
			})
		})
	})
end)