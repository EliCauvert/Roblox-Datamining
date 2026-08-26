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

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), reactModule (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), selectCaptureModule (ref), getCropSize (ref), cryoModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), fFlagUseRbxstorageInGalleryModule (ref), getContentFromObject (ref), checkbox (ref), images (ref), text (ref), getFormatTimeModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	local var7, var8 = reactModule.useState(UDim2.fromScale(1, 1))
	local var9, var10 = reactModule.useState(false)
	local var11 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var12 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var9 (ref), var1 (ref), eventNamesModule (copy), var2 (ref), selectCaptureModule (copy), p1 (ref)
		var10(not var9)
		var1.fireEvent(eventNamesModule.CapturesManagerItemActivated)
		var2(selectCaptureModule(p1.capture))
	end, { var9, p1.capture })
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4(p2.AbsoluteSize)
	end, {})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.Resolution)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), getCropSize (copy), var3 (ref), var5 (ref)
		var8(getCropSize(var3, var5))
	end, { var3, var5 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), cryoModule (copy), var11 (ref), p1 (ref)
		var10(cryoModule.List.find(var11, p1.capture) ~= nil)
	end, { var11, p1.capture })
	
	return reactModule.createElement("ImageButton", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Image = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then nil elseif p1.capture.type == captureTypeModule.Screenshot then p1.capture.contentId elseif fFlagUseRbxstorageInGalleryModule then p1.capture.thumbnailKey else nil,
		ImageContent = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then getContentFromObject(p1.capture) else nil,
		ImageTransparency = if var9 then 0.5 else 0,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[reactModule.Change.AbsoluteSize] = if not fFlagUseRbxstorageInGalleryModule then var13 else nil,
		[reactModule.Event.Activated] = var12
	}, {
		CheckboxFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.new(1, -34, 0, 8),
			Size = UDim2.fromOffset(26, 26)
		}, {
			Checkbox = if var9 then reactModule.createElement(checkbox, {
				isChecked = true,
				isDisabled = false,
				LayoutOrder = 1,
				label = "",
				onActivated = var12
			}) else reactModule.createElement("ImageButton", {
				BackgroundTransparency = 1,
				Image = images["squircles/hollow"].Image,
				ImageRectOffset = images["squircles/hollow"].ImageRectOffset,
				ImageRectSize = images["squircles/hollow"].ImageRectSize,
				ImageTransparency = 0.7,
				Size = UDim2.fromOffset(26, 26),
				[reactModule.Event.Activated] = var12
			})
		}),
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
			[reactModule.Event.Loaded] = var14
		})
	})
end