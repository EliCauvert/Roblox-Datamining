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

return function(p1)
	-- upvalues: useTokens (ref), useCallback (ref), reactModule (ref), view (ref), foundationModule (ref), gradientBackdrop (ref), checkbox (ref), text (ref), getFormatTimeModule (ref), getCaptureContentModule (ref)
	local var1 = useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.capture)
	end, { p1.capture, p1.onActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = var1,
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.zIndex
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
			SelectedIndicator = if p1.selected then reactModule.createElement(checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function(_)
					-- upvalues: var1 (ref)
					var1()
				end,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLength = if p1.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(text, {
				tag = "position-bottom-right anchor-bottom-right auto-xy text-label-medium content-emphasis",
				Text = getFormatTimeModule(p1.capture.TimeLength)
			}) else nil
		}),
		CaptureThumbnail = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = getCaptureContentModule(p1.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	})
end