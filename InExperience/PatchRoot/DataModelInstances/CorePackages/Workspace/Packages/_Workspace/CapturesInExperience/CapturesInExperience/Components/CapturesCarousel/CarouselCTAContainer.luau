local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local UIBloxModule = require(Parent1.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local ConstantsModule = require(Parent.Constants)
local DeleteWarningModalOpenedModule = require(Parent.Actions.DeleteWarningModalOpened)
local EventNamesModule = require(Parent.Analytics.EventNames)
local ExternalShareSourceTypeModule = require(Parent.Enums.ExternalShareSourceType)
local GetIsDeleteWarningModalOptedOutModule = require(Parent.Utils.getIsDeleteWarningModalOptedOut)
local GetSaveToStoragePermissionModule = require(Parent.Utils.getSaveToStoragePermission)
local ShareCaptureModule = require(Parent.Thunks.ShareCapture)
local _ = require(Parent.Types)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local _UDim = UDim.new(0.12, 0)
local _UDim2 = UDim2.fromOffset(36, 36)
local _UDim1 = UDim.new(0, 8)

return (require(Parent.App.CapturesPolicy).connect(function(p1) --[[ Line: 214 ]]
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(Frame) --[[ Line: 48 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), GetSaveToStoragePermissionModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), EventNamesModule (copy), SocialStopwatchModule (copy), ShareCaptureModule (copy), ExternalShareSourceTypeModule (copy), GetIsDeleteWarningModalOptedOutModule (copy), DeleteWarningModalOpenedModule (copy), _UDim1 (copy), _UDim (copy), IconButton (copy), Images (copy), _UDim2 (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = UseRefFunction(0)
	local UseSelectorResult = UseSelectorFunction(function(p1) --[[ Line: 55 ]]
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures[p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex]
	end)
	local UseResult = ReactModule.useCallback(function(): boolean --[[ Line: 60 ]]
		-- upvalues: Frame (copy), UseRefResult (copy)
		return if Frame.isDisabled then true else DateTime.now().UnixTimestampMillis - UseRefResult.current < 500
	end, { Frame.isDisabled })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 74 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = DateTime.now().UnixTimestampMillis
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 79 ]]
		-- upvalues: UseResult (copy), GetSaveToStoragePermissionModule (upval), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), UseSelectorResult (copy), Frame (copy), UseDispatchResult (copy), UseResult1 (copy), CaptureTypeModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		if UseResult() then return end
		GetSaveToStoragePermissionModule(if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then { UseSelectorResult } else UseSelectorResult, Frame.openPermissionModal, UseDispatchResult)
		UseResult1()
		
		if if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then UseSelectorResult.CaptureType == Enum.CaptureType.Video else UseSelectorResult.type == CaptureTypeModule.Video then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated)
			
			return
		else
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselSaveToExternalStorageActivated)
		end
	end, {
		UseSelectorResult,
		UseResult,
		UseResult1,
		Frame.openPermissionModal
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 101 ]]
		-- upvalues: UseResult (copy), UseResult1 (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), UseSelectorResult (copy), CaptureTypeModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), SocialStopwatchModule (upval), UseDispatchResult (copy), ShareCaptureModule (upval), ExternalShareSourceTypeModule (upval)
		if UseResult() then return end
		UseResult1()
		
		if if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then UseSelectorResult.CaptureType == Enum.CaptureType.Video else UseSelectorResult.type == CaptureTypeModule.Video then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselVideoShareActivated)
		else
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselShareActivated)
		end
		if SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CaptureShared) == nil then
			SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CaptureShared)
		end
		UseDispatchResult(ShareCaptureModule(UseSelectorResult, ExternalShareSourceTypeModule.CapturesCarousel))
	end, {
		UseSelectorResult,
		Frame.isDisabled,
		UseResult,
		UseResult1
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height),
		ZIndex = Frame.ZIndex
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim1 }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		}),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = _UDim,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SaveButton = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then ReactModule.createElement(IconButton, {
			layoutOrder = 1,
			showBackground = false,
			backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
			icon = Images["icons/actions/download_medium"],
			onActivated = UseResult2,
			size = _UDim2
		}) else ReactModule.createElement(IconButton, {
			layoutOrder = 1,
			showBackground = false,
			backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
			icon = Images["icons/actions/download_medium"],
			onActivated = UseResult2,
			size = _UDim2
		}),
		ShareButton = Frame.enableShareCaptureCTA and ReactModule.createElement(IconButton, {
			layoutOrder = 2,
			showBackground = false,
			backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
			icon = Images["icons/actions/share"],
			onActivated = UseResult3,
			size = _UDim2
		}),
		DeleteButton = ReactModule.createElement(IconButton, {
			layoutOrder = 4,
			showBackground = false,
			icon = Images["icons/actions/edit/delete"],
			onActivated = ReactModule.useCallback(function() --[[ Line: 125 ]]
				-- upvalues: UseResult (copy), UseResult1 (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), UseSelectorResult (copy), CaptureTypeModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), GetIsDeleteWarningModalOptedOutModule (upval), Frame (copy), UseDispatchResult (copy), DeleteWarningModalOpenedModule (upval)
				if UseResult() then return end
				UseResult1()
				
				if if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then UseSelectorResult.CaptureType == Enum.CaptureType.Video else UseSelectorResult.type == CaptureTypeModule.Video then
					UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesVideoDeleteActivatedInCarousel)
				else
					UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesDeleteActivatedInCarousel)
				end
				if GetIsDeleteWarningModalOptedOutModule() then
					assert(Frame.deleteItem ~= nil, "props.deleteItem should not be nil")
					Frame.deleteItem()
					
					return
				else
					UseDispatchResult(DeleteWarningModalOpenedModule())
				end
			end, {
				UseSelectorResult,
				Frame.deleteItem,
				Frame.isDisabled,
				UseResult,
				UseResult1
			}),
			size = _UDim2
		})
	})
end))