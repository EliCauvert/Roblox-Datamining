local Parent = script:FindFirstAncestor("MomentsCreationFlow").Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Image = require(Parent.BuilderIcons).Icon.Image
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local LoadableVideo = require(Parent.MomentsCommon).LoadableVideo
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), Image (copy), LoadableVideo (copy), DashModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return if p1.capture then ReactModule.createElement(View, { tag = "size-full" }, {
		UIPadding = if p1.scaleType == Enum.ScaleType.Fit then ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}) else nil,
		Overlay = ReactModule.createElement(ReactModule.Fragment, {}, p1.children),
		VideoPreview = if p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(LoadableVideo, {
			Looped = false,
			Playing = true,
			cornerRadius = UseTokensResult.Radius.Large,
			onLoaded = DashModule.noop,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
			onResolutionChanged = p1.onResolutionChanged,
			renderOnFailed = p1.onRenderFailed,
			Size = UDim2.fromScale(1, 1),
			scaleType = p1.scaleType,
			videoRef = p1.playbackController.videoRef
		}) else nil,
		ImagePreview = if p1.capture.CaptureType == Enum.CaptureType.Screenshot then ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ref = p1.playbackController.imageRef,
			ScaleType = p1.scaleType,
			Size = UDim2.fromScale(1, 1),
			[ReactModule.Change.AbsoluteSize] = p1.onAbsoluteSizeChanged
		}) else nil
	}) else ReactModule.createElement(View, { tag = "bg-shift-200 radius-large size-full" }, {
		EmptyState = ReactModule.createElement(Icon, {
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = UseTokensResult.Size.Size_1200,
			style = UseTokensResult.Color.Shift.Shift_400
		})
	})
end