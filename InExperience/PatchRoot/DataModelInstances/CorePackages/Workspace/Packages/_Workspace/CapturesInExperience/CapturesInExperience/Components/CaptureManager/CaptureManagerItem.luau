local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonModule = require(Parent1.CapturesCommon)
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local Checkbox = FoundationModule.Checkbox
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local Images = require(Parent1.UIBlox).App.ImageSet.Images
local Text = FoundationModule.Text
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetContentFromObjectFunction = CapturesCommonModule.Utils.getContentFromObject
local GetCropSizeFunction = CapturesCommonModule.Utils.getCropSize
local GetFormatTimeModule = require(Parent.Utils.getFormatTime)
local SelectCaptureModule = require(Parent.Thunks.SelectCapture)
local _ = require(Parent.Types)
local FFlagUseRbxstorageInGalleryModule = require(Parent.Flags.FFlagUseRbxstorageInGallery)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p1) --[[ Line: 43 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), ReactModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), EventNamesModule (copy), SelectCaptureModule (copy), GetCropSizeFunction (copy), CryoModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), FFlagUseRbxstorageInGalleryModule (copy), GetContentFromObjectFunction (copy), Checkbox (copy), Images (copy), Text (copy), GetFormatTimeModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UDim2.fromScale(1, 1))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 51 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: UseStateResult2_3 (copy), UseStateResult4 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), SelectCaptureModule (upval), p1 (copy)
		UseStateResult2_3(not UseStateResult4)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerItemActivated)
		UseDispatchResult(SelectCaptureModule(p1.capture))
	end, { UseStateResult4, p1.capture })
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 61 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 65 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2.Resolution)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 70 ]]
		-- upvalues: UseStateResult2_2 (copy), GetCropSizeFunction (upval), UseStateResult (copy), UseStateResult1 (copy)
		UseStateResult2_2(GetCropSizeFunction(UseStateResult, UseStateResult1))
	end, { UseStateResult, UseStateResult1 })
	ReactModule.useEffect(function() --[[ Line: 74 ]]
		-- upvalues: UseStateResult2_3 (copy), CryoModule (upval), UseSelectorResult (copy), p1 (copy)
		UseStateResult2_3(CryoModule.List.find(UseSelectorResult, p1.capture) ~= nil)
	end, { UseSelectorResult, p1.capture })
	
	return ReactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p1.capture.type == CaptureTypeModule.Screenshot then p1.capture.contentId elseif FFlagUseRbxstorageInGalleryModule then p1.capture.thumbnailKey else nil,
		ImageContent = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then GetContentFromObjectFunction(p1.capture) else nil,
		ImageTransparency = if UseStateResult4 then 0.5 else 0,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Change.AbsoluteSize] = if FFlagUseRbxstorageInGalleryModule then nil else UseResult1,
		[ReactModule.Event.Activated] = UseResult
	}, {
		CheckboxFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.new(1, -34, 0, 8),
			Size = UDim2.fromOffset(26, 26)
		}, {
			Checkbox = if UseStateResult4 then ReactModule.createElement(Checkbox, {
				isChecked = true,
				isDisabled = false,
				LayoutOrder = 1,
				label = "",
				onActivated = UseResult
			}) else ReactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				Image = Images["squircles/hollow"].Image,
				ImageRectOffset = Images["squircles/hollow"].ImageRectOffset,
				ImageRectSize = Images["squircles/hollow"].ImageRectSize,
				ImageTransparency = 0.7,
				Size = UDim2.fromOffset(26, 26),
				[ReactModule.Event.Activated] = UseResult
			})
		}),
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