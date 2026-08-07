-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local checkbox = foundationModule.Checkbox
local text = foundationModule.Text
local view = foundationModule.View
local gradientBackdrop = momentsCommonModule.GradientBackdrop
local getContentFromCaptureModule = require(momentsCreationFlow.Utils.getContentFromCapture)
local getFormatTime = momentsCommonModule.Utils.getFormatTime
local useCallback = reactModule.useCallback
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 29 ]]
	-- upvalues: useTokens (ref), useCallback (ref), reactModule (ref), view (ref), foundationModule (ref), gradientBackdrop (ref), checkbox (ref), text (ref), getFormatTime (ref), getContentFromCaptureModule (ref)
	local var5 = useCallback(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref)
		p0.onActivated(p0.capture)
	end, { p0.capture, p0.onActivated })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onActivated = var5,
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
		Overlay = reactModule.createElement(view, { tag = "padding-medium size-full", ZIndex = 3 }, {
			SelectedIndicator = if p0.selected then reactModule.createElement(checkbox, {
				isChecked = true,
				AnchorPoint = Vector2.new(1, 0),
				onActivated = var5,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			}) else nil,
			TimeLength = if p0.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(text, {
				tag = "anchor-bottom-right auto-xy content-emphasis position-bottom-right text-label-medium",
				Text = getFormatTime(p0.capture.TimeLength)
			}) else nil
		}),
		CaptureThumbnail = reactModule.createElement("ImageLabel", {
			BorderSizePixel = 0,
			ZIndex = 1,
			ImageContent = getContentFromCaptureModule(p0.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		})
	})
end