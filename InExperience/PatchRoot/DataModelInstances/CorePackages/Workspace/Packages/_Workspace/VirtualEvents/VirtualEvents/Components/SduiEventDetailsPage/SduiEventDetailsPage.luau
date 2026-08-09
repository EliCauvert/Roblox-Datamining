local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local parent = virtualEvents.Parent
local IXPService = game:GetService("IXPService")
local fireEventDetailsPageVisitModule = require(virtualEvents.Analytics.fireEventDetailsPageVisit)
local fetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)
local getEventDetailsPageKeyModule = require(script.Parent.getEventDetailsPageKey)
local _ = require(parent.Navigation)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useRouteName = require(parent.Navigation).useRouteName
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local sduiPageEntryPoint = sduiSharedUtilitiesModule.SduiPageEntryPoint
local sduiFeatureEntryPoint = sduiSharedUtilitiesModule.SduiFeatureEntryPoint
local sduiLoadTimer = sduiSharedUtilitiesModule.SduiLoadTimer
local appPage = require(parent.RobloxAppEnums).AppPage
local fFlagLuaAppSduiEventDetailsLogExposure = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsLogExposure
local fStringLuaAppSduiEventDetailsIxpLayer = require(parent.SharedFlags).FStringLuaAppSduiEventDetailsIxpLayer
local fFlagSduiPageEntryUseSharedHooks = require(parent.SharedFlags).FFlagSduiPageEntryUseSharedHooks
local foundationSheetFullBleed = foundationModule.Utility.Flags.FoundationSheetFullBleed

local function _(p0, p1) --[[ line: 39 | named "getFromPropsOrNavigationParams" ]]
	local extraProps = p0.navigation and p0.navigation.getParam("extraProps")
	
	return p0[p1] or extraProps and extraProps[p1]
end

local _ = function(p2, p3) --[[ line: 49 ]]
	return p2 .. "_" .. p3
end

return reactModule.memo(function(p4) --[[ line: 56 | named "SduiEventDetailsPage" ]]
	-- upvalues: useTokens (ref), getEventDetailsPageKeyModule (ref), reactModule (ref), sduiLoadTimer (ref), appPage (ref), useNavigation (ref), useRouteName (ref), useNavigationFocus (ref), fetchEventDetailsPageModule (ref), fFlagLuaAppSduiEventDetailsLogExposure (ref), IXPService (ref), fStringLuaAppSduiEventDetailsIxpLayer (ref), fireEventDetailsPageVisitModule (ref), foundationModule (ref), foundationSheetFullBleed (ref), sduiFeatureEntryPoint (ref), sduiPageEntryPoint (ref), fFlagSduiPageEntryUseSharedHooks (ref)
	local var9 = useTokens()
	local extraProps = p4.navigation and p4.navigation.getParam("extraProps")
	local eventId = p4.eventId or extraProps and extraProps.eventId or p4.navigation and p4.navigation.getParam("detail")
	local extraProps_1 = p4.navigation and p4.navigation.getParam("extraProps")
	local universeId = p4.universeId or extraProps_1 and extraProps_1.universeId
	local extraProps_2 = p4.navigation and p4.navigation.getParam("extraProps")
	local referralSource = p4.referralSource or extraProps_2 and extraProps_2.referralSource
	local var16 = getEventDetailsPageKeyModule(eventId)
	local var17 = reactModule.useMemo(function() --[[ line: 66 ]]
		-- upvalues: p4 (ref), sduiLoadTimer (copy), appPage (copy)
		local var23 = p4
		local extraProps = var23.navigation and var23.navigation.getParam("extraProps")
		
		return var23.pageTimer or extraProps and extraProps.pageTimer or sduiLoadTimer.createLoadTimer(appPage.EventDetails)
	end, {})
	local var18 = useNavigation()
	local var19 = useRouteName()
	local var20 = useNavigationFocus()
	local var21 = reactModule.useCallback(function() --[[ line: 74 ]]
		-- upvalues: var19 (ref), appPage (copy), var20 (ref), var18 (ref)
		if var19 == appPage.EventDetails and var20 then
			var18.goBack()
		end
	end, { var18, var19, var20 })
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: eventId (ref), fetchEventDetailsPageModule (copy), var17 (ref)
		if eventId then
			fetchEventDetailsPageModule(eventId, var17)
		end
	end, { eventId, var17 })
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: eventId (ref), fFlagLuaAppSduiEventDetailsLogExposure (copy), IXPService (copy), fStringLuaAppSduiEventDetailsIxpLayer (copy)
		if eventId and fFlagLuaAppSduiEventDetailsLogExposure then
			IXPService:LogFlagLinkedUserLayerExposure(fStringLuaAppSduiEventDetailsIxpLayer)
		end
	end, { eventId })
	reactModule.useEffect(function() --[[ line: 92 ]]
		-- upvalues: eventId (ref), fireEventDetailsPageVisitModule (copy), universeId (ref), referralSource (ref)
		if eventId then
			fireEventDetailsPageVisitModule({
				virtualEventId = eventId,
				universeId = tostring(universeId or ""),
				channel = referralSource or "link"
			})
		end
	end, { eventId })
	local var22 = reactModule.useRef(nil)
	
	return if eventId == nil then nil else reactModule.createElement(foundationModule.Sheet.Root, {
		isOpen = var20,
		snapPoints = { 1 },
		displaySize = foundationModule.Enums.DialogSize.Large,
		onClose = var21
	}, {
		FullBleed = if foundationSheetFullBleed then reactModule.createElement(foundationModule.Sheet.FullBleed, { aspectRatio = 1.777777777778 }, {
			FullBleedContent = reactModule.createElement(sduiFeatureEntryPoint, {
				identifier = "event_details_sheet_full_bleed",
				shouldDisplayLoading = false,
				shouldDisplayError = false,
				appPage = appPage.EventDetails,
				configKey = var16,
				Size = UDim2.fromScale(1, 1),
				AutomaticSize = Enum.AutomaticSize.None
			})
		}) else nil,
		Content = reactModule.createElement(foundationModule.Sheet.Content, { scrollingFrameRef = var22 }, reactModule.createElement(sduiPageEntryPoint, {
			includeNavigationHeaderBar = false,
			disableRootPadding = true,
			snackbarPortalLayoutOrder = 2147483647,
			appPage = appPage.EventDetails,
			configKey = var16,
			identifier = if fFlagSduiPageEntryUseSharedHooks then "event_details_feed" else var16 .. "_" .. "event_details_feed",
			pageTimer = var17,
			backgroundStyle = var9.Color.None,
			scrollingFrameRef = var22
		})),
		Actions = reactModule.createElement(foundationModule.Sheet.Actions, nil, reactModule.createElement(sduiFeatureEntryPoint, {
			identifier = "event_details_action_bar",
			shouldDisplayLoading = false,
			shouldDisplayError = false,
			appPage = appPage.EventDetails,
			configKey = var16
		}))
	})
end)