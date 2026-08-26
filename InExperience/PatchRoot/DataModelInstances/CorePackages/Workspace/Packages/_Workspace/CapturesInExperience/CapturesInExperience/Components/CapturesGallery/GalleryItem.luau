local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonModule = require(parent_1.CapturesCommon)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local captureTypeModule = require(parent.Enums.CaptureType)
local carouselOpenedModule = require(parent.Actions.CarouselOpened)
local eventNamesModule = require(parent.Analytics.EventNames)
local getContentFromObject = capturesCommonModule.Utils.getContentFromObject
local getCropSize = capturesCommonModule.Utils.getCropSize
local getFormatTimeModule = require(parent.Utils.getFormatTime)
local _ = require(parent.Types)
local text = foundationModule.Text
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), reactModule (ref), eventNamesModule (ref), carouselOpenedModule (ref), getCropSize (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getContentFromObject (ref), fFlagUseRbxstorageInGalleryModule (ref), text (ref), getFormatTimeModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	local var7, var8 = reactModule.useState(UDim2.fromScale(1, 1))
	local var9 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), eventNamesModule (copy), var2 (ref), carouselOpenedModule (copy), p1 (ref)
		var1.fireEvent(eventNamesModule.CapturesCarouselOpened)
		var2(carouselOpenedModule(p1.captureIndex))
	end, {})
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4(p2.AbsoluteSize)
	end, {})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.Resolution)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), getCropSize (copy), var3 (ref), var5 (ref)
		var8(getCropSize(var3, var5))
	end, { var3, var5 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p1.capture.type == captureTypeModule.Screenshot then p1.capture.contentId elseif p1.capture.type == captureTypeModule.Video then p1.capture.thumbnailKey else nil,
		ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p1.capture) else nil,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxstorageInGalleryModule then var10 else nil,
		[reactModule.Event.Activated] = var9
	}, {
		TimeLength = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = getFormatTimeModule(p1.capture.TimeLength)
		}) elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.capture.CaptureType == Enum.CaptureType.Screenshot then nil elseif fFlagUseRbxstorageInGalleryModule and p1.capture.type == captureTypeModule.Video then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = getFormatTimeModule(p1.capture.videoCapture.TimeLength)
		}) else nil,
		VideoPreview = if fFlagUseRbxstorageInGalleryModule or p1.capture.type ~= captureTypeModule.Video then nil else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = false,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var7,
			Video = p1.capture.contentId,
			[reactModule.Event.Loaded] = var11
		})
	})
end