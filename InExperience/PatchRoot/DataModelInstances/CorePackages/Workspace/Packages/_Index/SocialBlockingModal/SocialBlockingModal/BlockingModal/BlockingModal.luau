local SocialBlockingModal = script:FindFirstAncestor("SocialBlockingModal")
local Parent = SocialBlockingModal.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseOverlayFunction = FoundationModule.Hooks.useOverlay
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local UseScreenSizeFunction = RobloxAppHooksModule.useScreenSize
local UseLocalUserIdFunction = RobloxAppHooksModule.useLocalUserId
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppPage = require(Parent.RobloxAppEnums).AppPage
local Url = require(Parent.Http).Url
local UIBloxModule = require(Parent.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local UserProfilesModule = require(Parent.UserProfiles)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local OpenDynamicAbuseReportModule = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local MyUserBlockingNetworkingModule = require(SocialBlockingModal.Networking.myUserBlockingNetworking)
local UseShowToastOnErrorModule = require(script.Parent.useShowToastOnError)
local AnalyticsModule = require(script.Parent.Parent.Analytics)
local UseSocialBlockingModalAnalyticsFunction = AnalyticsModule.useSocialBlockingModalAnalytics
local EventNames = AnalyticsModule.EventNames
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FFlagEnableAbuseReportRevampFlow = require(Parent.SharedFlags).FFlagEnableAbuseReportRevampFlow
local FFlagDisableBlockAndReport = require(Parent.SharedFlags).FFlagDisableBlockAndReport
local FFlagEnableMomentsCommentBlocking = require(Parent.SharedFlags).FFlagEnableMomentsCommentBlocking
local FFlagMomentsBlockingModalInOverlay = require(Parent.SharedFlags).FFlagMomentsBlockingModalInOverlay

return function()
	-- upvalues: UseNavigationFunction (copy), FFlagDisableBlockAndReport (copy), UseLocalUserIdFunction (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), UseLayerCollectorFunction (copy), ReactModule (copy), UseSocialBlockingModalAnalyticsFunction (copy), EventNames (copy), UseShowToastOnErrorModule (copy), FFlagEnableMomentsCommentBlocking (copy), MyUserBlockingNetworkingModule (copy), FFlagEnableAbuseReportRevampFlow (copy), OpenDynamicAbuseReportModule (copy), AbuseVectorModule (copy), CloseCentralOverlayFunction (copy), AppPage (copy), Url (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), ButtonType (copy), InteractiveAlert (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FFlagMomentsBlockingModalInOverlay (copy), UseOverlayFunction (copy), UseTokensFunction (copy), ReactRobloxModule (copy), View (copy), StateLayerAffordance (copy)
	local UseNavigationResult = UseNavigationFunction()
	local NavPropsParam = UseNavigationResult.getParam("navProps")
	local UserId = NavPropsParam.userId
	local OnBlockSuccessFunction = NavPropsParam.onBlockSuccess
	local OpenReportUserFunction = NavPropsParam.openReportUser
	local DisableReportOption = if FFlagDisableBlockAndReport then NavPropsParam.disableReportOption else nil
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	
	if not UseScreenSizeResult and UseLayerCollectorResult and UseLayerCollectorResult.absoluteSize then
		UseScreenSizeResult = UseLayerCollectorResult.absoluteSize
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.pop()
	end, { UseNavigationResult })
	local FireAnalyticsEventFunction = UseSocialBlockingModalAnalyticsFunction({ userId = UserId }).fireAnalyticsEvent
	ReactModule.useEffect(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval)
		FireAnalyticsEventFunction(EventNames.SocialBlockingModalSeen)
	end, { UserId })
	local UseShowToastOnErrorModuleResult = UseShowToastOnErrorModule()
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableMomentsCommentBlocking (upval), NavPropsParam (copy), UseDispatchResult (copy), MyUserBlockingNetworkingModule (upval), UserId (copy), UseLocalUserIdResult (copy), OnBlockSuccessFunction (copy), UseShowToastOnErrorModuleResult (copy), UseResult (copy)
		if FFlagEnableMomentsCommentBlocking and NavPropsParam.onBlockConfirmed then
			NavPropsParam.onBlockConfirmed()
		end
		UseDispatchResult(MyUserBlockingNetworkingModule.BlockUserById.API({ userId = UserId, currentUserId = UseLocalUserIdResult })):andThen(function()
			-- upvalues: OnBlockSuccessFunction (upval)
			if OnBlockSuccessFunction then
				OnBlockSuccessFunction()
			end
		end):catch(function(Err)
			-- upvalues: UseShowToastOnErrorModuleResult (upval), FFlagEnableMomentsCommentBlocking (upval), NavPropsParam (upval)
			UseShowToastOnErrorModuleResult(Err)
			
			if FFlagEnableMomentsCommentBlocking and NavPropsParam.onBlockFailed then
				NavPropsParam.onBlockFailed()
			end
		end)
		UseResult()
	end, {
		OnBlockSuccessFunction, NavPropsParam, UseResult, UserId, UseLocalUserIdResult,
		UseDispatchResult, UseShowToastOnErrorModuleResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseResult1 (copy)
		FireAnalyticsEventFunction(EventNames.SocialBlockingModalBlockPressed)
		UseResult1()
	end, { UseResult1, UserId, FireAnalyticsEventFunction })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseResult1 (copy), OpenReportUserFunction (copy), FFlagEnableAbuseReportRevampFlow (upval), UseDispatchResult (copy), OpenDynamicAbuseReportModule (upval), AbuseVectorModule (upval), UserId (copy), CloseCentralOverlayFunction (upval), AppPage (upval), Url (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
		FireAnalyticsEventFunction(EventNames.SocialBlockingModalBlockAndReportPressed)
		UseResult1()
		
		if OpenReportUserFunction then
			OpenReportUserFunction()
			
			return
		end
		if FFlagEnableAbuseReportRevampFlow then
			UseDispatchResult(OpenDynamicAbuseReportModule({
				abuseVector = AbuseVectorModule.UserProfile,
				targetId = UserId,
				onClose = function()
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
			
			return
		end
		local config = {
			name = AppPage.GenericWebPage,
			detail = `{Url.BASE_URL}abusereport/userprofile?id={UserId}`,
			extraProps = { title = "" }
		}
		
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
			
			return
		else
			UseDispatchResult(NavigateDownFunction(config))
		end
	end, {
		UseResult1,
		UseDispatchResult,
		UserId,
		FireAnalyticsEventFunction,
		OpenReportUserFunction
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: FireAnalyticsEventFunction (copy), EventNames (upval), UseResult (copy)
		FireAnalyticsEventFunction(EventNames.SocialBlockingModalCancelPressed)
		UseResult()
	end, { UseResult, FireAnalyticsEventFunction })
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UserId },
		query = UserProfilesModule.Queries.userProfilesCombinedNameByUserIds
	})
	local UseLocalizationResult = UseLocalizationFunction({
		bodyText = "Feature.BlockingModal.Message.BlockConfirmation.FriendsRename",
		cancelBtnText = "Feature.BlockingModal.Action.Cancel",
		blockBtnText = "Feature.BlockingModal.Action.Block",
		blockAndReportBtnText = "Feature.BlockingModal.Action.BlockAndReport",
		title = {
			"Feature.BlockingModal.Heading.BlockUser",
			DisplayName = if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UserId) else nil
		}
	})
	local Element = ReactModule.createElement(FocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	}, {
		BlockingModalScreen = ReactModule.createElement(InteractiveAlert, {
			richText = true,
			isRoactGamepadEnabled = false,
			screenSize = UseScreenSizeResult,
			title = UseLocalizationResult.title,
			bodyText = UseLocalizationResult.bodyText,
			buttonStackInfo = {
				buttons = ReactModule.useMemo(function()
					-- upvalues: ButtonType (upval), UseLocalizationResult (copy), UseResult4 (copy), FFlagDisableBlockAndReport (upval), DisableReportOption (copy), UseResult3 (copy), UseResult2 (copy)
					local List = {}
					table.insert(List, {
						buttonType = ButtonType.Secondary,
						props = {
							text = UseLocalizationResult.cancelBtnText,
							onActivated = UseResult4
						}
					})
					
					if not FFlagDisableBlockAndReport or not DisableReportOption then
						table.insert(List, {
							buttonType = ButtonType.Alert,
							props = {
								text = UseLocalizationResult.blockAndReportBtnText,
								onActivated = UseResult3
							}
						})
					end
					table.insert(List, {
						buttonType = ButtonType.Alert,
						props = {
							text = UseLocalizationResult.blockBtnText,
							onActivated = UseResult2
						}
					})
					
					return List
				end, {
					UseLocalizationResult,
					UseResult4,
					UseResult3,
					DisableReportOption,
					UseResult2
				}) or {}
			}
		})
	})
	
	if FFlagMomentsBlockingModalInOverlay and NavPropsParam.presentInOverlay then
		local UseOverlayResult = UseOverlayFunction()
		local UseTokensResult = UseTokensFunction()
		
		if UseOverlayResult ~= nil then
			return ReactRobloxModule.createPortal(ReactModule.createElement(View, {
				tag = "size-full",
				ZIndex = 300,
				backgroundStyle = UseTokensResult.Color.Common.Backdrop,
				stateLayer = { affordance = StateLayerAffordance.None },
				onActivated = function() end
			}, { BlockingModal = Element }), UseOverlayResult)
		end
	end
	return Element
end