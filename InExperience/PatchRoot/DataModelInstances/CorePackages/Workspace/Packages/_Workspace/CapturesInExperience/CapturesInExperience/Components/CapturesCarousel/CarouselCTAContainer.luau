local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local MomentsCommonModule = require(Parent1.MomentsCommon)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SignalsModule = require(Parent1.Signals)
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local UIBloxModule = require(Parent1.UIBlox)
local GetMomentsCapabilitiesFunction = MomentsCommonModule.Stores.GetMomentsCapabilities
local IconButton = UIBloxModule.App.Button.IconButton
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CanCreateMomentsModule = require(Parent.Utils.canCreateMoments)
local CapturesPolicyModule = require(Parent.App.CapturesPolicy)
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local CheckMomentsEligibilityModule = require(Parent.Thunks.CheckMomentsEligibility)
local ConstantsModule = require(Parent.Constants)
local DeleteWarningModalOpenedModule = require(Parent.Actions.DeleteWarningModalOpened)
local EventNamesModule = require(Parent.Analytics.EventNames)
local ExternalShareSourceTypeModule = require(Parent.Enums.ExternalShareSourceType)
local GetIsDeleteWarningModalOptedOutModule = require(Parent.Utils.getIsDeleteWarningModalOptedOut)
local GetCaptureObjectModule = require(Parent.Utils.getCaptureObject)
local GetSaveToStoragePermissionModule = require(Parent.Utils.getSaveToStoragePermission)
local IsEligibleForMomentsModule = require(Parent.Utils.isEligibleForMoments)
local ShareCaptureModule = require(Parent.Thunks.ShareCapture)
local StartMomentsCreationFlowModule = require(Parent.Thunks.StartMomentsCreationFlow)
local _ = require(Parent.Types)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local FFlagCapturesCarouselMomentsButtonModule = require(Parent.Flags.FFlagCapturesCarouselMomentsButton)
local FFlagCreateMomentsToastModule = require(Parent.Flags.FFlagCreateMomentsToast)
local FIntMomentsInExperienceMinCaptureSecondsModule = require(Parent.Flags.FIntMomentsInExperienceMinCaptureSeconds)
local _UDim = UDim.new(0.12, 0)
local _UDim2 = UDim2.fromOffset(36, 36)
local _UDim1 = UDim.new(0, 8)
local CapturesCarousel = MomentsCommonModule.Analytics.FunnelEventNames.CreationIntentSource.CapturesCarousel
local list = { 0, -1, 1 }

local function _(Sound): boolean
	-- upvalues: FIntMomentsInExperienceMinCaptureSecondsModule (copy)
	if Sound == nil then
		return false
	elseif Sound.CaptureType == Enum.CaptureType.Video then
		local TimeLength = Sound.TimeLength
		
		return type(TimeLength) == "number" and FIntMomentsInExperienceMinCaptureSecondsModule <= TimeLength
	else
		return true
	end
end

return (CapturesPolicyModule.connect(function(p1)
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(Frame)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), FFlagCapturesCarouselMomentsButtonModule (copy), FFlagCreateMomentsToastModule (copy), ReactModule (copy), CanCreateMomentsModule (copy), SignalsModule (copy), GetMomentsCapabilitiesFunction (copy), list (copy), GetCaptureObjectModule (copy), FIntMomentsInExperienceMinCaptureSecondsModule (copy), CheckMomentsEligibilityModule (copy), IsEligibleForMomentsModule (copy), GetSaveToStoragePermissionModule (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), EventNamesModule (copy), SocialStopwatchModule (copy), ShareCaptureModule (copy), ExternalShareSourceTypeModule (copy), StartMomentsCreationFlowModule (copy), CapturesCarousel (copy), GetIsDeleteWarningModalOptedOutModule (copy), DeleteWarningModalOpenedModule (copy), _UDim1 (copy), _UDim (copy), IconButton (copy), Images (copy), _UDim2 (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = UseRefFunction(0)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures[p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex]
	end)
	local FFlagCreateMomentsToastModule1 = FFlagCapturesCarouselMomentsButtonModule and FFlagCreateMomentsToastModule
	local UseSelectorResult1 = if FFlagCreateMomentsToastModule1 then UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end) else nil
	local UseSelectorResult2 = if FFlagCreateMomentsToastModule1 then UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.SelectedCaptureIndex
	end) else nil
	local v1 = false
	
	if FFlagCreateMomentsToastModule1 then
		local UseStateResult2 = nil
		v1, UseStateResult2 = ReactModule.useState(function()
			-- upvalues: CanCreateMomentsModule (upval)
			return CanCreateMomentsModule()
		end)
		ReactModule.useEffect(function()
			-- upvalues: SignalsModule (upval), GetMomentsCapabilitiesFunction (upval), UseStateResult2 (ref), CanCreateMomentsModule (upval)
			return SignalsModule.createEffect(function(p1)
				-- upvalues: GetMomentsCapabilitiesFunction (upval), UseStateResult2 (upval), CanCreateMomentsModule (upval)
				GetMomentsCapabilitiesFunction(p1).getCanCreateMoments(p1)
				UseStateResult2(CanCreateMomentsModule())
			end)
		end, {})
	end
	if FFlagCreateMomentsToastModule1 then
		ReactModule.useEffect(function()
			-- upvalues: UseSelectorResult1 (copy), UseSelectorResult2 (copy), v1 (ref), list (upval), GetCaptureObjectModule (upval), FIntMomentsInExperienceMinCaptureSecondsModule (upval), UseDispatchResult (copy), CheckMomentsEligibilityModule (upval)
			if UseSelectorResult1 == nil or UseSelectorResult2 == nil or not v1 then return end
			if UseSelectorResult1[UseSelectorResult2] == nil then return end
			local t = {}
			
			for _, value in list do
				local UseSelectorResultEntry = UseSelectorResult1[UseSelectorResult2 + value]
				local CaptureObjectModule = if UseSelectorResultEntry then GetCaptureObjectModule(UseSelectorResultEntry) else nil
				
				if CaptureObjectModule then
					local Flag = nil
					if CaptureObjectModule == nil then
						Flag = false
					elseif CaptureObjectModule.CaptureType == Enum.CaptureType.Video then
						local TimeLength = CaptureObjectModule.TimeLength
						Flag = type(TimeLength) == "number" and TimeLength >= FIntMomentsInExperienceMinCaptureSecondsModule
					else
						Flag = true
					end
					if Flag and not t[CaptureObjectModule.SourceUniverseId] then
						t[CaptureObjectModule.SourceUniverseId] = true
						UseDispatchResult(CheckMomentsEligibilityModule(CaptureObjectModule.SourceUniverseId))
					end
				end
			end
		end, {
			UseSelectorResult1,
			UseSelectorResult2,
			v1,
			UseDispatchResult
		})
	end
	local UseMemoResult = if FFlagCreateMomentsToastModule1 then ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), GetCaptureObjectModule (upval)
		return if UseSelectorResult == nil then nil else GetCaptureObjectModule(UseSelectorResult)
	end, { UseSelectorResult }) else nil
	local SourceUniverseId = if UseMemoResult then UseMemoResult.SourceUniverseId else nil
	local UseSelectorResult3 = if FFlagCreateMomentsToastModule1 then UseSelectorFunction(function(p1)
		-- upvalues: SourceUniverseId (copy), IsEligibleForMomentsModule (upval), ConstantsModule (upval)
		return SourceUniverseId ~= nil and IsEligibleForMomentsModule(p1[ConstantsModule.RoduxKey].MomentsEligibility, SourceUniverseId)
	end) else false
	local UseMemoResult1 = if UseSelectorResult3 then UseMemoResult else nil
	local UseResult = ReactModule.useCallback(function(): boolean
		-- upvalues: Frame (copy), UseRefResult (copy)
		return if Frame.isDisabled then true else DateTime.now().UnixTimestampMillis - UseRefResult.current < 500
	end, { Frame.isDisabled })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = DateTime.now().UnixTimestampMillis
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
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
	local UseResult3 = ReactModule.useCallback(function()
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
	local UseResult4 = if FFlagCreateMomentsToastModule1 then ReactModule.useCallback(function()
		-- upvalues: UseMemoResult1 (copy), UseResult (copy), UseResult1 (copy), UseDispatchResult (copy), StartMomentsCreationFlowModule (upval), CapturesCarousel (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		if UseMemoResult1 ~= nil and not UseResult() then
			UseResult1()
			local Guid = game:GetService("HttpService"):GenerateGUID(false)
			UseDispatchResult(StartMomentsCreationFlowModule(UseMemoResult1, Guid, CapturesCarousel))
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.XExpMomentCreationStarted, { creationSessionId = Guid, source = CapturesCarousel })
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselCreateMomentActivated)
			
			return
		end
	end, {
		UseMemoResult1,
		UseResult,
		UseResult1,
		UseAnalyticsModuleResult.fireEvent,
		UseDispatchResult
	}) else nil
	local UseResult5 = ReactModule.useCallback(function()
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
	})
	local CreateElementFunction = ReactModule.createElement
	local v2 = "Frame"
	local config = {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height),
		ZIndex = Frame.ZIndex
	}
	local config1 = {
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
		})
	}
	local Element = nil
	repeat
		if FFlagCapturesCarouselMomentsButtonModule and UseResult4 and UseMemoResult1 then
			local Flag = nil
			if UseMemoResult1 == nil then
				Flag = false
			elseif UseMemoResult1.CaptureType == Enum.CaptureType.Video then
				local TimeLength = UseMemoResult1.TimeLength
				Flag = type(TimeLength) == "number" and TimeLength >= FIntMomentsInExperienceMinCaptureSecondsModule
			else
				Flag = true
			end
			if Flag then
				Element = ReactModule.createElement(IconButton, {
					layoutOrder = 0,
					showBackground = false,
					backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
					icon = Images["icons/brands/moments"],
					onActivated = UseResult4,
					size = _UDim2
				})
				break
			end
		end
		Element = nil
	until true
	config1.CreateMomentButton = Element
	config1.SaveButton = if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then ReactModule.createElement(IconButton, {
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
	})
	config1.ShareButton = Frame.enableShareCaptureCTA and ReactModule.createElement(IconButton, {
		layoutOrder = 2,
		showBackground = false,
		backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
		icon = Images["icons/actions/share"],
		onActivated = UseResult3,
		size = _UDim2
	})
	config1.DeleteButton = ReactModule.createElement(IconButton, {
		layoutOrder = 4,
		showBackground = false,
		icon = Images["icons/actions/edit/delete"],
		onActivated = UseResult5,
		size = _UDim2
	})
	
	return CreateElementFunction(v2, config, config1)
end))