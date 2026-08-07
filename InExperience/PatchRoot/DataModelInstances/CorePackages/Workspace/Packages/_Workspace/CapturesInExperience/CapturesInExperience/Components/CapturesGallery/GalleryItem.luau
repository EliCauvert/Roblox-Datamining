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

return function(p0) --[[ line: 30 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), reactModule (ref), eventNamesModule (ref), carouselOpenedModule (ref), getCropSize (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getContentFromObject (ref), fFlagUseRbxstorageInGalleryModule (ref), text (ref), getFormatTimeModule (ref)
	local var10 = useAnalyticsModule()
	local var11 = useDispatch()
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14, var15 = reactModule.useState(Vector2.new(0, 0))
	local var16, var17 = reactModule.useState(UDim2.fromScale(1, 1))
	local var18 = reactModule.useCallback(function() --[[ line: 38 ]]
		-- upvalues: var10 (ref), eventNamesModule (copy), var11 (ref), carouselOpenedModule (copy), p0 (ref)
		var10.fireEvent(eventNamesModule.CapturesCarouselOpened)
		var11(carouselOpenedModule(p0.captureIndex))
	end, {})
	local var19 = reactModule.useCallback(function(p1) --[[ line: 43 ]]
		-- upvalues: var13 (ref)
		var13(p1.AbsoluteSize)
	end, {})
	local var20 = reactModule.useCallback(function(p2) --[[ line: 47 ]]
		-- upvalues: var15 (ref)
		var15(p2.Resolution)
	end, {})
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var17 (ref), getCropSize (copy), var12 (ref), var14 (ref)
		var17(getCropSize(var12, var14))
	end, { var12, var14 })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p0.capture.type == captureTypeModule.Screenshot then p0.capture.contentId elseif p0.capture.type == captureTypeModule.Video then p0.capture.thumbnailKey else nil,
		ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p0.capture) else nil,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxstorageInGalleryModule then var19 else nil,
		[reactModule.Event.Activated] = var18
	}, {
		TimeLength = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p0.capture.CaptureType == Enum.CaptureType.Video then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = getFormatTimeModule(p0.capture.TimeLength)
		}) elseif fFlagEnableCapturesGalleryRetrievalCoreScriptModule and p0.capture.CaptureType == Enum.CaptureType.Screenshot then nil elseif fFlagUseRbxstorageInGalleryModule and p0.capture.type == captureTypeModule.Video then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = getFormatTimeModule(p0.capture.videoCapture.TimeLength)
		}) else nil,
		VideoPreview = if fFlagUseRbxstorageInGalleryModule or p0.capture.type ~= captureTypeModule.Video then nil else reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = false,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = var16,
			Video = p0.capture.contentId,
			[reactModule.Event.Loaded] = var20
		})
	})
end