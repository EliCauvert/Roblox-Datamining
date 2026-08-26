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

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), image (ref), loadableVideo (ref), dashModule (ref)
	local var1 = useTokens()
	
	return if p1.capture then reactModule.createElement(view, { tag = "size-full" }, {
		UIPadding = if p1.scaleType == Enum.ScaleType.Fit then reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}) else nil,
		Overlay = reactModule.createElement(reactModule.Fragment, {}, p1.children),
		VideoPreview = if p1.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(loadableVideo, {
			Looped = false,
			Playing = true,
			cornerRadius = var1.Radius.Large,
			onLoaded = dashModule.noop,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
			onResolutionChanged = p1.onResolutionChanged,
			renderOnFailed = p1.onRenderFailed,
			Size = UDim2.fromScale(1, 1),
			scaleType = p1.scaleType,
			videoRef = p1.playbackController.videoRef
		}) else nil,
		ImagePreview = if p1.capture.CaptureType == Enum.CaptureType.Screenshot then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ref = p1.playbackController.imageRef,
			ScaleType = p1.scaleType,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		}) else nil
	}) else reactModule.createElement(view, { tag = "bg-shift-200 radius-large size-full" }, {
		EmptyState = reactModule.createElement(icon, {
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var1.Size.Size_1200,
			style = var1.Color.Shift.Shift_400
		})
	})
end