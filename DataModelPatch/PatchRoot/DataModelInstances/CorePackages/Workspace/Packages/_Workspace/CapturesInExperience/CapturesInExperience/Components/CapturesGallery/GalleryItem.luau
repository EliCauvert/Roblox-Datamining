local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonModule = require(Parent1.CapturesCommon)
local ReactModule = require(Parent1.React)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CarouselOpenedModule = require(Parent.Actions.CarouselOpened)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetContentFromObjectFunction = CapturesCommonModule.Utils.getContentFromObject
local GetCropSizeFunction = CapturesCommonModule.Utils.getCropSize
local GetFormatTimeModule = require(Parent.Utils.getFormatTime)
local _ = require(Parent.Types)
local Text = require(Parent1.Foundation).Text
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), ReactModule (copy), EventNamesModule (copy), CarouselOpenedModule (copy), GetCropSizeFunction (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), GetContentFromObjectFunction (copy), FFlagUseRbxstorageInGalleryModule (copy), Text (copy), GetFormatTimeModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UDim2.fromScale(1, 1))
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselOpenedModule (upval), p1 (copy)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselOpened)
		UseDispatchResult(CarouselOpenedModule(p1.captureIndex))
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2.Resolution)
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), GetCropSizeFunction (upval), UseStateResult (copy), UseStateResult1 (copy)
		UseStateResult2_2(GetCropSizeFunction(UseStateResult, UseStateResult1))
	end, { UseStateResult, UseStateResult1 })
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p1.capture.type == CaptureTypeModule.Screenshot then p1.capture.contentId elseif p1.capture.type == CaptureTypeModule.Video then p1.capture.thumbnailKey else nil,
		ImageContent = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then GetContentFromObjectFunction(p1.capture) else nil,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsoluteSize] = if FFlagUseRbxstorageInGalleryModule then nil else UseResult1,
		[ReactModule.Event.Activated] = UseResult
	}, {
		TimeLength = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.capture.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = GetFormatTimeModule(p1.capture.TimeLength)
		}) elseif FFlagEnableCapturesGalleryRetrievalCoreScriptModule and p1.capture.CaptureType == Enum.CaptureType.Screenshot then nil elseif FFlagUseRbxstorageInGalleryModule and p1.capture.type == CaptureTypeModule.Video then ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "text-title-large content-emphasis auto-xy size-full text-align-x-right text-align-y-bottom padding-x-small padding-y-xsmall",
			Text = GetFormatTimeModule(p1.capture.videoCapture.TimeLength)
		}) else nil,
		VideoPreview = if FFlagUseRbxstorageInGalleryModule or p1.capture.type ~= CaptureTypeModule.Video then nil else ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			Playing = false,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UseStateResult3,
			Video = p1.capture.contentId,
			[ReactModule.Event.Loaded] = UseResult2
		})
	})
end