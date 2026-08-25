local socialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local parent = socialBlockingModal.Parent
local reactModule = require(parent.React)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local useScreenSize = robloxAppHooksModule.useScreenSize
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local navigateDown = require(parent.NavigationRodux).Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var3 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appPage = require(parent.RobloxAppEnums).AppPage
local url = require(parent.Http).Url
local UIBloxModule = require(parent.UIBlox)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local userProfilesModule = require(parent.UserProfiles)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local myUserBlockingNetworkingModule = require(socialBlockingModal.Networking.myUserBlockingNetworking)
local useShowToastOnErrorModule = require(script.Parent.useShowToastOnError)
local analyticsModule = require(script.Parent.Parent.Analytics)
local useSocialBlockingModalAnalytics = analyticsModule.useSocialBlockingModalAnalytics
local eventNames = analyticsModule.EventNames
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local fFlagEnableAbuseReportRevampFlow = require(parent.SharedFlags).FFlagEnableAbuseReportRevampFlow
local fFlagDisableBlockAndReport = require(parent.SharedFlags).FFlagDisableBlockAndReport
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local socialBlockingModalFocusNavSupport = game:DefineFastFlag("SocialBlockingModalFocusNavSupport", false)

return function()
	-- upvalues: useNavigation (ref), fFlagDisableBlockAndReport (ref), useLocalUserId (ref), useDispatch (ref), useScreenSize (ref), useLayerCollector (ref), reactModule (ref), useSocialBlockingModalAnalytics (ref), eventNames (ref), useShowToastOnErrorModule (ref), myUserBlockingNetworkingModule (ref), fFlagEnableAbuseReportRevampFlow (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var3 (ref), navigateDown (ref), userProfilesModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), buttonType (ref), socialBlockingModalFocusNavSupport (ref), interactiveAlert (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var13 = useNavigation()
	local navProps = var13.getParam("navProps")
	local userId = navProps.userId
	local onBlockSuccess = navProps.onBlockSuccess
	local openReportUser = navProps.openReportUser
	local var15 = if fFlagDisableBlockAndReport then navProps.disableReportOption else nil
	local var16 = useLocalUserId()
	local var17 = useDispatch()
	local var18 = useScreenSize()
	local var19 = useLayerCollector()
	
	if not var18 and var19 and var19.absoluteSize then
		var18 = var19.absoluteSize
	end
	local var20 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13.pop()
	end, { var13 })
	local fireAnalyticsEvent = useSocialBlockingModalAnalytics({ userId = userId }).fireAnalyticsEvent
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy)
		fireAnalyticsEvent(eventNames.SocialBlockingModalSeen)
	end, { userId })
	local var21 = useShowToastOnErrorModule()
	local var22 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), myUserBlockingNetworkingModule (copy), userId (ref), var16 (ref), onBlockSuccess (ref), var21 (ref), var20 (ref)
		var17(myUserBlockingNetworkingModule.BlockUserById.API({ userId = userId, currentUserId = var16 })):andThen(function()
			-- upvalues: onBlockSuccess (copy)
			if onBlockSuccess then
				onBlockSuccess()
			end
		end):catch(function(p0)
			-- upvalues: var21 (copy)
			var21(p0)
		end)
		var20()
	end, {
		onBlockSuccess, var20, userId, var16, var17, var21
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var22 (ref)
		fireAnalyticsEvent(eventNames.SocialBlockingModalBlockPressed)
		var22()
	end, { var22, userId, fireAnalyticsEvent })
	local var24 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var22 (ref), openReportUser (ref), fFlagEnableAbuseReportRevampFlow (copy), var17 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), userId (ref), closeCentralOverlay (copy), appPage (copy), url (copy), fFlagSignalsNavP3Dispatch (copy), var3 (copy), navigateDown (copy)
		fireAnalyticsEvent(eventNames.SocialBlockingModalBlockAndReportPressed)
		var22()
		
		if openReportUser then
			openReportUser()
			
			return
		elseif fFlagEnableAbuseReportRevampFlow then
			var17(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.UserProfile,
				targetId = userId,
				onClose = function()
					-- upvalues: var17 (copy), closeCentralOverlay (copy)
					var17(closeCentralOverlay())
				end
			}))
			
			return
		end
		local t = {
			name = appPage.GenericWebPage,
			detail = `{url.BASE_URL}abusereport/userprofile?id={userId}`,
			extraProps = { title = "" }
		}
		
		if fFlagSignalsNavP3Dispatch then
			var3.down(var3.fromLegacyPage(t))
			
			return
		end
		var17(navigateDown(t))
	end, {
		var22,
		var17,
		userId,
		fireAnalyticsEvent,
		openReportUser
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var20 (ref)
		fireAnalyticsEvent(eventNames.SocialBlockingModalCancelPressed)
		var20()
	end, { var20, fireAnalyticsEvent })
	local var26 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var27 = useLocalization({
		cancelBtnText = "Feature.BlockingModal.Action.Cancel",
		blockBtnText = "Feature.BlockingModal.Action.Block",
		blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport",
		title = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = if var26.data then userProfilesModule.Selectors.getCombinedNameFromId(var26.data, userId) else nil
		},
		bodyText = if fFlagConnectionsToFriendsRename then "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename" else "Feature.BlockingModal.Message.BlockConfirmation"
	})
	local var28 = reactModule.useMemo(function()
		-- upvalues: buttonType (copy), var27 (ref), var25 (ref), fFlagDisableBlockAndReport (copy), var15 (ref), var24 (ref), var23 (ref)
		local t = {}
		table.insert(t, {
			buttonType = buttonType.Secondary,
			props = { text = var27.cancelBtnText, onActivated = var25 }
		})
		
		if not fFlagDisableBlockAndReport or not var15 then
			table.insert(t, {
				buttonType = buttonType.Alert,
				props = { text = var27.blockAndReportBtnText, onActivated = var24 }
			})
		end
		table.insert(t, {
			buttonType = buttonType.Alert,
			props = { text = var27.blockBtnText, onActivated = var23 }
		})
		
		return t
	end, {
		var27,
		var25,
		var24,
		var15,
		var23
	})
	
	return if socialBlockingModalFocusNavSupport then reactModule.createElement(focusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		BlockingModalScreen = reactModule.createElement(interactiveAlert, {
			richText = true,
			isRoactGamepadEnabled = false,
			screenSize = var18,
			title = var27.title,
			bodyText = var27.bodyText,
			buttonStackInfo = { buttons = var28 or {} }
		})
	}) else reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var18,
		title = var27.title,
		bodyText = var27.bodyText,
		buttonStackInfo = { buttons = var28 or {} }
	})
end