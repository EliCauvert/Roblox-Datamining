local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonModule = require(parent_1.CapturesCommon)
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local checkbox = foundationModule.Checkbox
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local images = require(parent_1.UIBlox).App.ImageSet.Images
local text = foundationModule.Text
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local captureTypeModule = require(parent.Enums.CaptureType)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getContentFromObject = capturesCommonModule.Utils.getContentFromObject
local getCropSize = capturesCommonModule.Utils.getCropSize
local getFormatTimeModule = require(parent.Utils.getFormatTime)
local selectCaptureModule = require(parent.Thunks.SelectCapture)
local _ = require(parent.Types)
local fFlagUseRbxstorageInGalleryModule = require(parent.Flags.FFlagUseRbxstorageInGallery)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)

return function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), reactModule (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), selectCaptureModule (ref), getCropSize (ref), cryoModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), fFlagUseRbxstorageInGalleryModule (ref), getContentFromObject (ref), checkbox (ref), images (ref), text (ref), getFormatTimeModule (ref)
	local var13 = useAnalyticsModule()
	local var14 = useDispatch()
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(UDim2.fromScale(1, 1))
	local var21, var22 = reactModule.useState(false)
	local var23 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var24 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var21 (ref), var13 (ref), eventNamesModule (copy), var14 (ref), selectCaptureModule (copy), p0 (ref)
		var22(not var21)
		var13.fireEvent(eventNamesModule.CapturesManagerItemActivated)
		var14(selectCaptureModule(p0.capture))
	end, { var21, p0.capture })
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var16 (ref)
		var16(p2.AbsoluteSize)
	end, {})
	local var26 = reactModule.useCallback(function(p3)
		-- upvalues: var18 (ref)
		var18(p3.Resolution)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), getCropSize (copy), var15 (ref), var17 (ref)
		var20(getCropSize(var15, var17))
	end, { var15, var17 })
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), cryoModule (copy), var23 (ref), p0 (ref)
		var22(cryoModule.List.find(var23, p0.capture) ~= nil)
	end, { var23, p0.capture })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p0.capture.type == captureTypeModule.Screenshot then p0.capture.contentId elseif fFlagUseRbxstorageInGalleryModule then p0.capture.thumbnailKey else nil,
		ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p0.capture) else nil,
		ImageTransparency = if var21 then 0.5 else 0,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxstorageInGalleryModule then var25 else nil,
		[reactModule.Event.Activated] = var24
	}, {
		CheckboxFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.new(1, -34, 0, 8),
			Size = UDim2.fromOffset(26, 26)
		}, {
			Checkbox = if var21 then reactModule.createElement(checkbox, {
				isChecked = true,
				isDisabled = false,
				LayoutOrder = 1,
				label = "",
				onActivated = var24
			}) else reactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				Image = images["squircles/hollow"].Image,
				ImageRectOffset = images["squircles/hollow"].ImageRectOffset,
				ImageRectSize = images["squircles/hollow"].ImageRectSize,
				ImageTransparency = 0.7,
				Size = UDim2.fromOffset(26, 26),
				[reactModule.Event.Activated] = var24
			})
		}),
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
			Size = var19,
			Video = p0.capture.contentId,
			[reactModule.Event.Loaded] = var26
		})
	})
end