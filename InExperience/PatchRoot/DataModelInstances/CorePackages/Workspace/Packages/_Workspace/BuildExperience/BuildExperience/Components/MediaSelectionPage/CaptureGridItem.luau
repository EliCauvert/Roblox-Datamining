local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), foundationModule (ref), checkbox (ref)
	local var1 = useTokens()
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.capture)
	end, { p1.capture, p1.onActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = var2,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		stroke = if p1.isSelected then {
			Color = var1.Color.Content.Emphasis.Color3,
			Thickness = var1.Stroke.Thick,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		} else nil
	}, {
		CaptureThumbnail = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = if typeof(p1.capture) == "Object" then Content.fromObject(p1.capture) else Content.none,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}),
		SelectionOverlay = if p1.isSelected then reactModule.createElement(view, { tag = "size-full padding-small", ZIndex = 3 }, {
			SelectedIndicator = reactModule.createElement(checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function()
					-- upvalues: var2 (ref)
					var2()
				end,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			})
		}) else nil
	})
end