local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local parent = virtualEvents.Parent
local IXPService = game:GetService("IXPService")
local fireEventDetailsPageVisitModule = require(virtualEvents.Analytics.fireEventDetailsPageVisit)
local fetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)
local getEventDetailsPageKeyModule = require(script.Parent.getEventDetailsPageKey)
local eventDetailsFeedSkeletonModule = require(script.Parent.EventDetailsFeedSkeleton)
local eventDetailsFullBleedSkeletonModule = require(script.Parent.EventDetailsFullBleedSkeleton)
local eventDetailsActionBarSkeletonModule = require(script.Parent.EventDetailsActionBarSkeleton)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useRouteName = require(parent.Navigation).useRouteName
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local useDeviceType = require(parent.RobloxAppHooks).useDeviceType
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local appPage = robloxAppEnumsModule.AppPage
local deviceType = robloxAppEnumsModule.DeviceType
local fFlagLuaAppSduiEventDetailsLogExposure = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure
local fFlagLuaAppSduiEventDetailsCenterSheet = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsCenterSheet
local fFlagLuaAppSduiEventDetailsLoadingSlot = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsLoadingSlot
local fFlagLuaAppSduiEventDetailsActionBarInFeed = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsActionBarInFeed
local fStringLuaAppSduiEventDetailsIxpLayer = require(parent.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks

local function _(p0, p1)
	local extraProps = p0.navigation and p0.navigation.getParam("extraProps")
	
	return p0[p1] or extraProps and extraProps[p1]
end

local _ = function(p2, p3)
	return p2 .. "_" .. p3
end

return reactModule.memo(function(p4)
	-- upvalues: useTokens (ref), getEventDetailsPageKeyModule (ref), reactModule (ref), sduiLoadTimer (ref), appPage (ref), useNavigation (ref), useRouteName (ref), useNavigationFocus (ref), fFlagLuaAppSduiEventDetailsCenterSheet (ref), useDeviceType (ref), deviceType (ref), fetchEventDetailsPageModule (ref), fFlagLuaAppSduiEventDetailsLogExposure (ref), IXPService (ref), fStringLuaAppSduiEventDetailsIxpLayer (ref), fireEventDetailsPageVisitModule (ref), foundationModule (ref), sduiFeatureEntryPoint (ref), fFlagLuaAppSduiEventDetailsLoadingSlot (ref), eventDetailsFullBleedSkeletonModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), eventDetailsFeedSkeletonModule (ref), fFlagLuaAppSduiEventDetailsActionBarInFeed (ref), eventDetailsActionBarSkeletonModule (ref)
	local var13 = useTokens()
	local extraProps = p4.navigation and p4.navigation.getParam("extraProps")
	local eventId = p4.eventId or extraProps and extraProps.eventId or p4.navigation and p4.navigation.getParam("detail")
	local extraProps_1 = p4.navigation and p4.navigation.getParam("extraProps")
	local universeId = p4.universeId or extraProps_1 and extraProps_1.universeId
	local extraProps_2 = p4.navigation and p4.navigation.getParam("extraProps")
	local referralSource = p4.referralSource or extraProps_2 and extraProps_2.referralSource
	local var20 = getEventDetailsPageKeyModule(eventId)
	local var21 = reactModule.useMemo(function()
		-- upvalues: p4 (ref), sduiLoadTimer (copy), appPage (copy)
		local var29 = p4
		local extraProps = var29.navigation and var29.navigation.getParam("extraProps")
		
		return var29.pageTimer or extraProps and extraProps.pageTimer or sduiLoadTimer.createLoadTimer(appPage.EventDetails)
	end, {})
	local var22 = useNavigation()
	local var23 = useRouteName()
	local var24 = useNavigationFocus()
	local var25 = nil
	
	if fFlagLuaAppSduiEventDetailsCenterSheet then
		local var26 = useDeviceType()
		var25 = if var26 ~= deviceType.Desktop then var26 == deviceType.Tablet else true
	end
	local var27 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), appPage (copy), var24 (ref), var22 (ref)
		if var23 == appPage.EventDetails and var24 then
			var22.goBack()
		end
	end, { var22, var23, var24 })
	reactModule.useEffect(function()
		-- upvalues: eventId (ref), fetchEventDetailsPageModule (copy), var21 (ref)
		if eventId then
			fetchEventDetailsPageModule(eventId, var21)
		end
	end, { eventId, var21 })
	reactModule.useEffect(function()
		-- upvalues: eventId (ref), fFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), fStringLuaAppSduiEventDetailsIxpLayer (copy)
		if eventId and fFlagLuaAppSduiEventDetailsLogExposure then
			IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppSduiEventDetailsIxpLayer)
		end
	end, { eventId })
	reactModule.useEffect(function()
		-- upvalues: eventId (ref), fireEventDetailsPageVisitModule (copy), universeId (ref), referralSource (ref)
		if eventId then
			fireEventDetailsPageVisitModule({
				virtualEventId = eventId,
				universeId = tostring(universeId or ""),
				channel = referralSource or "link"
			})
		end
	end, { eventId })
	local var28 = reactModule.useRef(nil)
	
	return if eventId == nil then nil else reactModule.createElement(foundationModule.Sheet.Root, {
		isOpen = var24,
		snapPoints = { 1 },
		displaySize = foundationModule.Enums.DialogSize.Large,
		preferCenterSheet = var25,
		centerSheetHeight = if fFlagLuaAppSduiEventDetailsCenterSheet then 1 else nil,
		onClose = var27
	}, {
		FullBleed = reactModule.createElement(foundationModule.Sheet.FullBleed, { aspectRatio = 1.777777777778 }, {
			FullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
				identifier = "event_details_sheet_full_bleed",
				shouldDisplayError = false,
				appPage = appPage.EventDetails,
				configKey = var20,
				shouldDisplayLoading = fFlagLuaAppSduiEventDetailsLoadingSlot,
				loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsFullBleedSkeletonModule) else nil,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(foundationModule.Sheet.Content, { scrollingFrameRef = var28 }, reactModule.createElement(sduiPageEntryPoint, {
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			appPage = appPage.EventDetails,
			configKey = var20,
			identifier = if fFlagSduiPageEntryUseSharedHooks then "event_details_feed" else var20 .. "_" .. "event_details_feed",
			pageTimer = var21,
			backgroundStyle = var13.Color.None,
			scrollingFrameRef = var28,
			loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsFeedSkeletonModule) else nil
		})),
		Actions = if fFlagLuaAppSduiEventDetailsActionBarInFeed then nil else reactModule.createElement(foundationModule.Sheet.Actions, nil, reactModule.createElement(sduiFeatureEntryPoint, {
			identifier = "event_details_action_bar",
			shouldDisplayError = false,
			appPage = appPage.EventDetails,
			configKey = var20,
			shouldDisplayLoading = fFlagLuaAppSduiEventDetailsLoadingSlot,
			loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsActionBarSkeletonModule) else nil
		}))
	})
end)