-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local builderIconsModule = require(parent.BuilderIcons)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local image = builderIconsModule.Icon.Image
local icon = foundationModule.Icon
local view = foundationModule.View
local loadableVideo = momentsCommonModule.LoadableVideo
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 34 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), image (ref), loadableVideo (ref), dashModule (ref)
	local var5 = useTokens()
	
	return if p0.capture then reactModule.createElement(view, { tag = "size-full" }, {
		UIPadding = if p0.scaleType == Enum.ScaleType.Fit then reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}) else nil,
		Overlay = reactModule.createElement(reactModule.Fragment, {}, p0.children),
		VideoPreview = if p0.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(loadableVideo, {
			Looped = false,
			Playing = true,
			cornerRadius = var5.Radius.Large,
			onLoaded = dashModule.noop,
			onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
			onResolutionChanged = p0.onResolutionChanged,
			renderOnFailed = p0.onRenderFailed,
			Size = UDim2.fromScale(1, 1),
			scaleType = p0.scaleType,
			videoRef = p0.playbackController.videoRef
		}) else nil,
		ImagePreview = if p0.capture.CaptureType == Enum.CaptureType.Screenshot then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ref = p0.playbackController.imageRef,
			ScaleType = p0.scaleType,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Change.AbsoluteSize] = p0.onAbsoluteSizeChanged
		}) else nil
	}) else reactModule.createElement(view, { tag = "bg-shift-200 radius-large size-full" }, {
		EmptyState = reactModule.createElement(icon, {
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var5.Size.Size_1200,
			style = var5.Color.Shift.Shift_400
		})
	})
end