local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local checkbox = foundationModule.Checkbox
local text = foundationModule.Text
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local getCaptureContentModule = require(momentsCreation.Capture.getCaptureContent)
local getFormatTimeModule = require(momentsCreation.Utils.getFormatTime)
local useCallback = reactModule.useCallback
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 34 ]]
	-- upvalues: useTokens (ref), useCallback (ref), reactModule (ref), view (ref), foundationModule (ref), gradientBackdrop (ref), checkbox (ref), text (ref), getFormatTimeModule (ref), getCaptureContentModule (ref)
	local var6 = useCallback(function() --[[ line: 37 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.capture)
	end, { p0.capture, p0.onActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = var6,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p0.zIndex
	}, {
		GradientBackdrop = reactModule.createElement(gradientBackdrop, {
			rotation = 270,
			startingTransparency = 0.6,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = useTokens().Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 1)
		}),
		Overlay = reactModule.createElement(view, { tag = "size-full padding-medium", ZIndex = 3 }, {
			SelectedIndicator = if p0.selected then reactModule.createElement(checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function(_) --[[ line: 66 ]]
					-- upvalues: var6 (ref)
					var6()
				end,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLength = if p0.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(text, {
				tag = "position-bottom-right anchor-bottom-right auto-xy text-label-medium content-emphasis",
				Text = getFormatTimeModule(p0.capture.TimeLength)
			}) else nil
		}),
		CaptureThumbnail = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = getCaptureContentModule(p0.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	})
end