local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local Parent = VirtualEvents.Parent
local IXPService = game:GetService("IXPService")
local FireEventDetailsPageVisitModule = require(VirtualEvents.Analytics.fireEventDetailsPageVisit)
local FetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)
local GetEventDetailsPageKeyModule = require(script.Parent.getEventDetailsPageKey)
local EventDetailsFeedSkeletonModule = require(script.Parent.EventDetailsFeedSkeleton)
local EventDetailsFullBleedSkeletonModule = require(script.Parent.EventDetailsFullBleedSkeleton)
local EventDetailsActionBarSkeletonModule = require(script.Parent.EventDetailsActionBarSkeleton)
local _ = require(Parent.Navigation)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRouteNameFunction = require(Parent.Navigation).useRouteName
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiPageEntryPoint = SduiSharedUtilitiesModule.SduiPageEntryPoint
local SduiFeatureEntryPoint = SduiSharedUtilitiesModule.SduiFeatureEntryPoint
local SduiLoadTimer = SduiSharedUtilitiesModule.SduiLoadTimer
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local AppPage = RobloxAppEnumsModule.AppPage
local DeviceType = RobloxAppEnumsModule.DeviceType
local FFlagLuaAppSduiEventDetailsLogExposure = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure
local FFlagLuaAppSduiEventDetailsCenterSheet = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsCenterSheet
local FFlagLuaAppSduiEventDetailsLoadingSlot = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsLoadingSlot
local FFlagLuaAppSduiEventDetailsActionBarInFeed = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsActionBarInFeed
local FStringLuaAppSduiEventDetailsIxpLayer = require(Parent.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer
local FFlagSduiPageEntryUseSharedHooks = require(Parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks

local function _(p1, p2) --[[ Line: 48 | Named "getFromPropsOrNavigationParams" ]]
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	
	return p1[p2] or ExtraPropsParam and ExtraPropsParam[p2]
end

local _ = function(Text, Text1): string --[[ Line: 58 ]]
	return Text .. "_" .. Text1
end

return ReactModule.memo(function(p1) --[[ Line: 65 | Named "SduiEventDetailsPage" ]]
	-- upvalues: UseTokensFunction (copy), GetEventDetailsPageKeyModule (copy), ReactModule (copy), SduiLoadTimer (copy), AppPage (copy), UseNavigationFunction (copy), UseRouteNameFunction (copy), UseNavigationFocusFunction (copy), FFlagLuaAppSduiEventDetailsCenterSheet (copy), UseDeviceTypeFunction (copy), DeviceType (copy), FetchEventDetailsPageModule (copy), FFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), FStringLuaAppSduiEventDetailsIxpLayer (copy), FireEventDetailsPageVisitModule (copy), FoundationModule (copy), SduiFeatureEntryPoint (copy), FFlagLuaAppSduiEventDetailsLoadingSlot (copy), EventDetailsFullBleedSkeletonModule (copy), SduiPageEntryPoint (copy), FFlagSduiPageEntryUseSharedHooks (copy), EventDetailsFeedSkeletonModule (copy), FFlagLuaAppSduiEventDetailsActionBarInFeed (copy), EventDetailsActionBarSkeletonModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
	local EventId = (if p1.eventId then p1.eventId else ExtraPropsParam and ExtraPropsParam.eventId) or p1.navigation and p1.navigation.getParam("detail")
	local ExtraPropsParam1 = p1.navigation and p1.navigation.getParam("extraProps")
	local UniverseId = p1.universeId or ExtraPropsParam1 and ExtraPropsParam1.universeId
	local ExtraPropsParam2 = p1.navigation and p1.navigation.getParam("extraProps")
	local ReferralSource = p1.referralSource or ExtraPropsParam2 and ExtraPropsParam2.referralSource
	local EventDetailsPageKeyModule = GetEventDetailsPageKeyModule(EventId)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 75 ]]
		-- upvalues: p1 (copy), SduiLoadTimer (upval), AppPage (upval)
		local ExtraPropsParam = p1.navigation and p1.navigation.getParam("extraProps")
		
		return (if p1.pageTimer then p1.pageTimer else ExtraPropsParam and ExtraPropsParam.pageTimer) or SduiLoadTimer.createLoadTimer(AppPage.EventDetails)
	end, {})
	local UseNavigationResult = UseNavigationFunction()
	local UseRouteNameResult = UseRouteNameFunction()
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local IsDesktopMatch: boolean? = nil
	
	if FFlagLuaAppSduiEventDetailsCenterSheet then
		local UseDeviceTypeResult = UseDeviceTypeFunction()
		IsDesktopMatch = UseDeviceTypeResult == DeviceType.Desktop or UseDeviceTypeResult == DeviceType.Tablet
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 88 ]]
		-- upvalues: UseRouteNameResult (copy), AppPage (upval), UseNavigationFocusResult (copy), UseNavigationResult (copy)
		if UseRouteNameResult == AppPage.EventDetails and UseNavigationFocusResult then
			UseNavigationResult.goBack()
		end
	end, {
		UseNavigationResult,
		UseRouteNameResult,
		UseNavigationFocusResult
	})
	ReactModule.useEffect(function() --[[ Line: 94 ]]
		-- upvalues: EventId (copy), FetchEventDetailsPageModule (upval), UseMemoResult (copy)
		if EventId then
			FetchEventDetailsPageModule(EventId, UseMemoResult)
		end
	end, { EventId, UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: EventId (copy), FFlagLuaAppSduiEventDetailsLogExposure (upval), IXPService (upval), FStringLuaAppSduiEventDetailsIxpLayer (upval)
		if EventId and FFlagLuaAppSduiEventDetailsLogExposure then
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppSduiEventDetailsIxpLayer)
		end
	end, { EventId })
	ReactModule.useEffect(function() --[[ Line: 106 ]]
		-- upvalues: EventId (copy), FireEventDetailsPageVisitModule (upval), UniverseId (copy), ReferralSource (copy)
		if EventId then
			FireEventDetailsPageVisitModule({
				virtualEventId = EventId,
				universeId = tostring(UniverseId or ""),
				channel = ReferralSource or "link"
			})
		end
	end, { EventId })
	local UseRefResult = ReactModule.useRef(nil)
	
	return if EventId == nil then nil else ReactModule.createElement(FoundationModule.Sheet.Root, {
		isOpen = UseNavigationFocusResult,
		snapPoints = { 1 },
		displaySize = FoundationModule.Enums.DialogSize.Large,
		preferCenterSheet = IsDesktopMatch,
		centerSheetHeight = if FFlagLuaAppSduiEventDetailsCenterSheet then 1 else nil,
		onClose = UseResult
	}, {
		FullBleed = ReactModule.createElement(FoundationModule.Sheet.FullBleed, { aspectRatio = 1.7777777777777777 }, {
			FullBleedContent = ReactModule.createElement(SduiFeatureEntryPoint, {
				identifier = "event_details_sheet_full_bleed",
				shouldDisplayError = false,
				appPage = AppPage.EventDetails,
				configKey = EventDetailsPageKeyModule,
				shouldDisplayLoading = FFlagLuaAppSduiEventDetailsLoadingSlot,
				loadingSlot = if FFlagLuaAppSduiEventDetailsLoadingSlot then ReactModule.createElement(EventDetailsFullBleedSkeletonModule) else nil,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = ReactModule.createElement(FoundationModule.Sheet.Content, { scrollingFrameRef = UseRefResult }, ReactModule.createElement(SduiPageEntryPoint, {
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			appPage = AppPage.EventDetails,
			configKey = EventDetailsPageKeyModule,
			identifier = if FFlagSduiPageEntryUseSharedHooks then "event_details_feed" else EventDetailsPageKeyModule .. "_" .. "event_details_feed",
			pageTimer = UseMemoResult,
			backgroundStyle = UseTokensResult.Color.None,
			scrollingFrameRef = UseRefResult,
			loadingSlot = if FFlagLuaAppSduiEventDetailsLoadingSlot then ReactModule.createElement(EventDetailsFeedSkeletonModule) else nil
		})),
		Actions = if FFlagLuaAppSduiEventDetailsActionBarInFeed then nil else ReactModule.createElement(FoundationModule.Sheet.Actions, nil, ReactModule.createElement(SduiFeatureEntryPoint, {
			identifier = "event_details_action_bar",
			shouldDisplayError = false,
			appPage = AppPage.EventDetails,
			configKey = EventDetailsPageKeyModule,
			shouldDisplayLoading = FFlagLuaAppSduiEventDetailsLoadingSlot,
			loadingSlot = if FFlagLuaAppSduiEventDetailsLoadingSlot then ReactModule.createElement(EventDetailsActionBarSkeletonModule) else nil
		}))
	})
end)