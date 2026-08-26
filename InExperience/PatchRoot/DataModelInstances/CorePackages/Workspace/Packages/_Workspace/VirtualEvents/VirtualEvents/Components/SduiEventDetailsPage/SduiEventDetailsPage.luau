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

local function _(p1, p2)
	local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
	
	return p1[p2] or extraProps and extraProps[p2]
end

local _ = function(p1, p2)
	return p1 .. "_" .. p3
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), getEventDetailsPageKeyModule (ref), reactModule (ref), sduiLoadTimer (ref), appPage (ref), useNavigation (ref), useRouteName (ref), useNavigationFocus (ref), fFlagLuaAppSduiEventDetailsCenterSheet (ref), useDeviceType (ref), deviceType (ref), fetchEventDetailsPageModule (ref), fFlagLuaAppSduiEventDetailsLogExposure (ref), IXPService (ref), fStringLuaAppSduiEventDetailsIxpLayer (ref), fireEventDetailsPageVisitModule (ref), foundationModule (ref), sduiFeatureEntryPoint (ref), fFlagLuaAppSduiEventDetailsLoadingSlot (ref), eventDetailsFullBleedSkeletonModule (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref), eventDetailsFeedSkeletonModule (ref), fFlagLuaAppSduiEventDetailsActionBarInFeed (ref), eventDetailsActionBarSkeletonModule (ref)
	local var1 = useTokens()
	local extraProps = p1.navigation and p1.navigation.getParam("extraProps")
	local eventId = p1.eventId or extraProps and extraProps.eventId or p1.navigation and p1.navigation.getParam("detail")
	local extraProps_1 = p1.navigation and p1.navigation.getParam("extraProps")
	local universeId = p1.universeId or extraProps_1 and extraProps_1.universeId
	local extraProps_2 = p1.navigation and p1.navigation.getParam("extraProps")
	local referralSource = p1.referralSource or extraProps_2 and extraProps_2.referralSource
	local var2 = getEventDetailsPageKeyModule(eventId)
	local var3 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), sduiLoadTimer (copy), appPage (copy)
		local var4 = p1
		local extraProps = var4.navigation and var4.navigation.getParam("extraProps")
		
		return var4.pageTimer or extraProps and extraProps.pageTimer or sduiLoadTimer.createLoadTimer(appPage.EventDetails)
	end, {})
	local var4 = useNavigation()
	local var5 = useRouteName()
	local var6 = useNavigationFocus()
	local var7 = nil
	
	if fFlagLuaAppSduiEventDetailsCenterSheet then
		local var8 = useDeviceType()
		var7 = if var8 ~= deviceType.Desktop then var8 == deviceType.Tablet else true
	end
	local var9 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), appPage (copy), var6 (ref), var4 (ref)
		if var5 == appPage.EventDetails and var6 then
			var4.goBack()
		end
	end, { var4, var5, var6 })
	reactModule.useEffect(function()
		-- upvalues: eventId (ref), fetchEventDetailsPageModule (copy), var3 (ref)
		if eventId then
			fetchEventDetailsPageModule(eventId, var3)
		end
	end, { eventId, var3 })
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
	local var10 = reactModule.useRef(nil)
	
	return if eventId == nil then nil else reactModule.createElement(foundationModule.Sheet.Root, {
		isOpen = var6,
		snapPoints = { 1 },
		displaySize = foundationModule.Enums.DialogSize.Large,
		preferCenterSheet = var7,
		centerSheetHeight = if fFlagLuaAppSduiEventDetailsCenterSheet then 1 else nil,
		onClose = var9
	}, {
		FullBleed = reactModule.createElement(foundationModule.Sheet.FullBleed, { aspectRatio = 1.777777777778 }, {
			FullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
				identifier = "event_details_sheet_full_bleed",
				shouldDisplayError = false,
				appPage = appPage.EventDetails,
				configKey = var2,
				shouldDisplayLoading = fFlagLuaAppSduiEventDetailsLoadingSlot,
				loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsFullBleedSkeletonModule) else nil,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}),
		Content = reactModule.createElement(foundationModule.Sheet.Content, { scrollingFrameRef = var10 }, reactModule.createElement(sduiPageEntryPoint, {
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			appPage = appPage.EventDetails,
			configKey = var2,
			identifier = if fFlagSduiPageEntryUseSharedHooks then "event_details_feed" else var2 .. "_" .. "event_details_feed",
			pageTimer = var3,
			backgroundStyle = var1.Color.None,
			scrollingFrameRef = var10,
			loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsFeedSkeletonModule) else nil
		})),
		Actions = if fFlagLuaAppSduiEventDetailsActionBarInFeed then nil else reactModule.createElement(foundationModule.Sheet.Actions, nil, reactModule.createElement(sduiFeatureEntryPoint, {
			identifier = "event_details_action_bar",
			shouldDisplayError = false,
			appPage = appPage.EventDetails,
			configKey = var2,
			shouldDisplayLoading = fFlagLuaAppSduiEventDetailsLoadingSlot,
			loadingSlot = if fFlagLuaAppSduiEventDetailsLoadingSlot then reactModule.createElement(eventDetailsActionBarSkeletonModule) else nil
		}))
	})
end)