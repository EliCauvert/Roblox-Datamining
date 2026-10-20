local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Checkbox = FoundationModule.Checkbox
local Text = FoundationModule.Text
local View = FoundationModule.View
local GradientBackdrop = require(Parent.MomentsCommon).Components.GradientBackdrop
local GetCaptureContentModule = require(MomentsCreation.Capture.getCaptureContent)
local GetFormatTimeModule = require(MomentsCreation.Utils.getFormatTime)
local FFlagMomentsGalleryCaptureOverlayUpdateModule = require(MomentsCreation.Flags.FFlagMomentsGalleryCaptureOverlayUpdate)
local UseCallbackFunction = ReactModule.useCallback
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseCallbackFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), GradientBackdrop (copy), FFlagMomentsGalleryCaptureOverlayUpdateModule (copy), Checkbox (copy), Text (copy), GetFormatTimeModule (copy), GetCaptureContentModule (copy)
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
		Overlay = ReactModule.createElement(View, {
			ZIndex = 3,
			tag = {
				["size-full padding-small"] = FFlagMomentsGalleryCaptureOverlayUpdateModule,
				["size-full padding-medium"] = not FFlagMomentsGalleryCaptureOverlayUpdateModule
			}
		}, {
			SelectedIndicator = if p1.selected then ReactModule.createElement(Checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function(_)
					-- upvalues: UseCallbackResult (copy)
					UseCallbackResult()
				end,
				Position = UDim2.fromScale(1, 0),
				size = if FFlagMomentsGalleryCaptureOverlayUpdateModule then FoundationModule.Enums.InputSize.XSmall else FoundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLengthShadow = if FFlagMomentsGalleryCaptureOverlayUpdateModule and p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(Text, {
				tag = "auto-xy text-label-medium",
				ZIndex = 1,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, 0, 1, 1),
				Text = GetFormatTimeModule(p1.capture.TimeLength),
				textStyle = UseTokensResult.Color.Common.Shadow
			}) else nil,
			TimeLength = if p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(Text, {
				tag = "position-bottom-right anchor-bottom-right auto-xy text-label-medium content-emphasis",
				Text = GetFormatTimeModule(p1.capture.TimeLength),
				ZIndex = if FFlagMomentsGalleryCaptureOverlayUpdateModule then 2 else nil
			}) else nil
		}),
		CaptureThumbnail = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = GetCaptureContentModule(p1.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	})
end