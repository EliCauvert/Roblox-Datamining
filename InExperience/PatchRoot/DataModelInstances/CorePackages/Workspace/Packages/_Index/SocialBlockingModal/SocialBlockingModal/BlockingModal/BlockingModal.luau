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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
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
	-- upvalues: useNavigation (ref), fFlagDisableBlockAndReport (ref), useLocalUserId (ref), useDispatch (ref), useScreenSize (ref), useLayerCollector (ref), reactModule (ref), useSocialBlockingModalAnalytics (ref), eventNames (ref), useShowToastOnErrorModule (ref), myUserBlockingNetworkingModule (ref), fFlagEnableAbuseReportRevampFlow (ref), openDynamicAbuseReportModule (ref), abuseVectorModule (ref), closeCentralOverlay (ref), appPage (ref), url (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), userProfilesModule (ref), useLocalization (ref), fFlagConnectionsToFriendsRename (ref), buttonType (ref), socialBlockingModalFocusNavSupport (ref), interactiveAlert (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2 = useNavigation()
	local navProps = var2.getParam("navProps")
	local userId = navProps.userId
	local onBlockSuccess = navProps.onBlockSuccess
	local openReportUser = navProps.openReportUser
	local var3 = if fFlagDisableBlockAndReport then navProps.disableReportOption else nil
	local var4 = useLocalUserId()
	local var5 = useDispatch()
	local var6 = useScreenSize()
	local var7 = useLayerCollector()
	
	if not var6 and var7 and var7.absoluteSize then
		var6 = var7.absoluteSize
	end
	local var8 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2.pop()
	end, { var2 })
	local fireAnalyticsEvent = useSocialBlockingModalAnalytics({ userId = userId }).fireAnalyticsEvent
	reactModule.useEffect(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy)
		fireAnalyticsEvent(eventNames.SocialBlockingModalSeen)
	end, { userId })
	local var9 = useShowToastOnErrorModule()
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), myUserBlockingNetworkingModule (copy), userId (ref), var4 (ref), onBlockSuccess (ref), var9 (ref), var8 (ref)
		var5(myUserBlockingNetworkingModule.BlockUserById.API({ userId = userId, currentUserId = var4 })):andThen(function()
			-- upvalues: onBlockSuccess (copy)
			if onBlockSuccess then
				onBlockSuccess()
			end
		end):catch(function(p1)
			-- upvalues: var9 (copy)
			var9(p1)
		end)
		var8()
	end, {
		onBlockSuccess, var8, userId, var4, var5, var9
	})
	local var11 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var10 (ref)
		fireAnalyticsEvent(eventNames.SocialBlockingModalBlockPressed)
		var10()
	end, { var10, userId, fireAnalyticsEvent })
	local var12 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var10 (ref), openReportUser (ref), fFlagEnableAbuseReportRevampFlow (copy), var5 (ref), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), userId (ref), closeCentralOverlay (copy), appPage (copy), url (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
		fireAnalyticsEvent(eventNames.SocialBlockingModalBlockAndReportPressed)
		var10()
		
		if openReportUser then
			openReportUser()
			
			return
		elseif fFlagEnableAbuseReportRevampFlow then
			var5(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.UserProfile,
				targetId = userId,
				onClose = function()
					-- upvalues: var5 (copy), closeCentralOverlay (copy)
					var5(closeCentralOverlay())
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
			var1.down(var1.fromLegacyPage(t))
			
			return
		end
		var5(navigateDown(t))
	end, {
		var10,
		var5,
		userId,
		fireAnalyticsEvent,
		openReportUser
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: fireAnalyticsEvent (ref), eventNames (copy), var8 (ref)
		fireAnalyticsEvent(eventNames.SocialBlockingModalCancelPressed)
		var8()
	end, { var8, fireAnalyticsEvent })
	local var14 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { userId },
		query = userProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local var15 = useLocalization({
		cancelBtnText = "Feature.BlockingModal.Action.Cancel",
		blockBtnText = "Feature.BlockingModal.Action.Block",
		blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport",
		title = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = if var14.data then userProfilesModule.Selectors.getCombinedNameFromId(var14.data, userId) else nil
		},
		bodyText = if fFlagConnectionsToFriendsRename then "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename" else "Feature.BlockingModal.Message.BlockConfirmation"
	})
	local var16 = reactModule.useMemo(function()
		-- upvalues: buttonType (copy), var15 (ref), var13 (ref), fFlagDisableBlockAndReport (copy), var3 (ref), var12 (ref), var11 (ref)
		local t = {}
		table.insert(t, {
			buttonType = buttonType.Secondary,
			props = { text = var15.cancelBtnText, onActivated = var13 }
		})
		
		if not fFlagDisableBlockAndReport or not var3 then
			table.insert(t, {
				buttonType = buttonType.Alert,
				props = { text = var15.blockAndReportBtnText, onActivated = var12 }
			})
		end
		table.insert(t, {
			buttonType = buttonType.Alert,
			props = { text = var15.blockBtnText, onActivated = var11 }
		})
		
		return t
	end, {
		var15,
		var13,
		var12,
		var3,
		var11
	})
	
	return if socialBlockingModalFocusNavSupport then reactModule.createElement(focusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		BlockingModalScreen = reactModule.createElement(interactiveAlert, {
			richText = true,
			isRoactGamepadEnabled = false,
			screenSize = var6,
			title = var15.title,
			bodyText = var15.bodyText,
			buttonStackInfo = { buttons = var16 or {} }
		})
	}) else reactModule.createElement(interactiveAlert, {
		richText = true,
		screenSize = var6,
		title = var15.title,
		bodyText = var15.bodyText,
		buttonStackInfo = { buttons = var16 or {} }
	})
end