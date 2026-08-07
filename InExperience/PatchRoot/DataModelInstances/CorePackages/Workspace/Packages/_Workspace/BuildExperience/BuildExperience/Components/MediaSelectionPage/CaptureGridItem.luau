local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 18 | named "CaptureGridItem" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), foundationModule (ref), checkbox (ref)
	local var2 = useTokens()
	local var3 = reactModule.useCallback(function() --[[ line: 21 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.capture)
	end, { p0.capture, p0.onActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = var3,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		stroke = if p0.isSelected then {
			Color = var2.Color.Content.Emphasis.Color3,
			Thickness = var2.Stroke.Thick,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		} else nil
	}, {
		CaptureThumbnail = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = if typeof(p0.capture) == "Object" then Content.fromObject(p0.capture) else Content.none,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}),
		SelectionOverlay = if p0.isSelected then reactModule.createElement(view, { tag = "size-full padding-small", ZIndex = 3 }, {
			SelectedIndicator = reactModule.createElement(checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function() --[[ line: 57 ]]
					-- upvalues: var3 (ref)
					var3()
				end,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			})
		}) else nil
	})
end