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
local UseCallbackFunction = ReactModule.useCallback
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 34 ]]
	-- upvalues: UseTokensFunction (copy), UseCallbackFunction (copy), ReactModule (copy), View (copy), FoundationModule (copy), GradientBackdrop (copy), Checkbox (copy), Text (copy), GetFormatTimeModule (copy), GetCaptureContentModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseCallbackResult = UseCallbackFunction(function() --[[ Line: 37 ]]
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
		Overlay = ReactModule.createElement(View, { tag = "size-full padding-medium", ZIndex = 3 }, {
			SelectedIndicator = if p1.selected then ReactModule.createElement(Checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function(_) --[[ Line: 66 ]]
					-- upvalues: UseCallbackResult (copy)
					UseCallbackResult()
				end,
				Position = UDim2.fromScale(1, 0),
				size = FoundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLength = if p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(Text, {
				tag = "position-bottom-right anchor-bottom-right auto-xy text-label-medium content-emphasis",
				Text = GetFormatTimeModule(p1.capture.TimeLength)
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