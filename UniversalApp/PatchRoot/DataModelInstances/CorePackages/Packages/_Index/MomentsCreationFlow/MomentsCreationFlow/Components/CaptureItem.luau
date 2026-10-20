local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Checkbox = FoundationModule.Checkbox
local Text = FoundationModule.Text
local View = FoundationModule.View
local GradientBackdrop = MomentsCommonModule.GradientBackdrop
local GetContentFromCaptureModule = require(MomentsCreationFlow.Utils.getContentFromCapture)
local GetFormatTimeFunction = MomentsCommonModule.Utils.getFormatTime
local UseCallbackFunction = ReactModule.useCallback
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseCallbackFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), GradientBackdrop (copy), Checkbox (copy), Text (copy), GetFormatTimeFunction (copy), GetContentFromCaptureModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy)
		p1.onActivated(p1.capture)
	end, { p1.capture, p1.onActivated })
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onActivated = UseCallbackResult,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		ZIndex = p1.zIndex
	}, {
		GradientBackdrop = ReactModule.createElement(GradientBackdrop, {
			rotation = 270,
			startingTransparency = 0.6,
			zIndex = 2,
			anchorPoint = Vector2.new(0, 1),
			color3 = UseTokensResult.Color.Common.Scrim.Color3,
			position = UDim2.fromScale(0, 1),
			size = UDim2.fromScale(1, 1)
		}),
		Overlay = ReactModule.createElement(View, { tag = "padding-medium size-full", ZIndex = 3 }, {
			SelectedIndicator = if p1.selected then ReactModule.createElement(Checkbox, {
				isChecked = true,
				AnchorPoint = Vector2.new(1, 0),
				onActivated = UseCallbackResult,
				Position = UDim2.fromScale(1, 0),
				size = FoundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLength = if p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(Text, {
				tag = "anchor-bottom-right auto-xy content-emphasis position-bottom-right text-label-medium",
				Text = GetFormatTimeFunction(p1.capture.TimeLength)
			}) else nil
		}),
		CaptureThumbnail = ReactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = GetContentFromCaptureModule(p1.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	})
end