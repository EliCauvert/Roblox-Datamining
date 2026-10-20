local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local GetDeepValueModule = require(ProfilePlatform.Utils.getDeepValue)
local NavigationModule = require(Parent.Navigation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local SharedFlagsModule = require(Parent.SharedFlags)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local CryoModule = require(Parent.Cryo)
local CheckQrSessionModule = require(ProfilePlatform.Networking.checkQrSession)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local ProfileRefreshSignal = require(Parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local ParseComponentsFromJsonModule = require(ProfilePlatform.Components.ProfilePlatformPage.parseComponentsFromJson)
local UseAvailableComponentsModule = require(ProfilePlatform.Hooks.useAvailableComponents)
local UseProfileJsonModule = require(ProfilePlatform.Hooks.useProfileJson)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UseIsMeTabModule = require(ProfilePlatform.Hooks.useIsMeTab)
local ProfilePlatformEventReceiverModule = require(script.Parent.ProfilePlatformEventReceiver)
local UseProfileAnalyticsContextModule = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local EventNamesModule = require(ProfilePlatform.Analytics.EventNames)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local GetFriendStatusFromProfileResponseModule = require(script.Parent.getFriendStatusFromProfileResponse)
local GetIsTrustedConnectionsStatusFromProfileResponseModule = require(script.Parent.getIsTrustedConnectionsStatusFromProfileResponse)
local RefreshProfilePlatformActionInfoModule = require(ProfilePlatform.Networking.refreshProfilePlatformActionInfo)
local UseActionsComponentRequestModule = require(ProfilePlatform.Hooks.useActionsComponentRequest)
local LoadingStages = require(Parent.SocialLuaAnalytics).Analytics.Enums.LoadingStages
local LoadingStagesExtensionModule = require(ProfilePlatform.Analytics.LoadingStagesExtension)
local FFlagProfilePlatformEnableVRModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableVR)
local FFlagProfilePlatformEnableLazyLoadingComponentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local FFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(ProfilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local FFlagProfilePlatformEnableMomentsModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local FFlagProfilePlatformTrustedConnectionsMVP = SharedFlagsModule.FFlagProfilePlatformTrustedConnectionsMVP
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab
local FFlagJoinUserCTAsIxpEnabled = SharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local FStringJoinUserCTAsIxpLayer = SharedFlagsModule.FStringJoinUserCTAsIxpLayer
local IXPServiceWrapper = if FFlagJoinUserCTAsIxpEnabled then require(Parent.IXPServiceWrapper).IXPServiceWrapper else nil
local SocialProfilePeekViewLayer = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView")
local SocialProfilePeekViewSecondaryLayer = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary")
local SocialSelfProfileViewLayer = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView")
local IXPService = game:GetService("IXPService")
local EnableSocialProfilePeekViewExposureEvents = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false)
local ProfilePlatformEnableRefreshSignal = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false)
local ProfilePlatformEnableSessionization = game:DefineFastFlag("ProfilePlatformEnableSessionization", false)
local SessionService = if ProfilePlatformEnableSessionization then game:GetService("SessionService") else nil
local SessionType = if ProfilePlatformEnableSessionization then require(Parent.RobloxAppSessionization).SessionType else nil
local AvatarModelPrefetch = require(Parent.EditProfileBackground).AvatarModelPrefetch
local ProfilePlatformPageModule = require(script.Parent.ProfilePlatformPage)
local GetProfilePlatformModule = require(ProfilePlatform.Networking.getProfilePlatform)

return function()
	-- upvalues: ReactModule (copy), UseProfileWrapperContextModule (copy), UseProfileAnalyticsContextModule (copy), FFlagAXEnableProfileTab (copy), UseIsMeTabModule (copy), UseLocalUserIdFunction (copy), UseDispatchFunction (copy), FFlagProfilePlatformTrustedConnectionsMVP (copy), NavigationModule (copy), UseProfileJsonModule (copy), UseAvailableComponentsModule (copy), FFlagProfilePlatformRefreshActionsRespectPoliciesModule (copy), UseActionsComponentRequestModule (copy), SocialStopwatchModule (copy), EventNamesModule (copy), LoadingStages (copy), GetProfilePlatformModule (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), FFlagProfilePlatformEnableVRModule (copy), GetDeepValueModule (copy), EnumsModule (copy), GetFriendStatusFromProfileResponseModule (copy), GetIsTrustedConnectionsStatusFromProfileResponseModule (copy), CheckQrSessionModule (copy), RobloxAppEnumsModule (copy), RefreshProfilePlatformActionInfoModule (copy), LoadingStagesExtensionModule (copy), UseEffectOnMountFunction (copy), AvatarModelPrefetch (copy), ProfilePlatformEnableRefreshSignal (copy), UseSignalStateFunction (copy), ProfileRefreshSignal (copy), EnableSocialProfilePeekViewExposureEvents (copy), IXPService (copy), SocialProfilePeekViewLayer (copy), SocialProfilePeekViewSecondaryLayer (copy), SocialSelfProfileViewLayer (copy), FFlagJoinUserCTAsIxpEnabled (copy), IXPServiceWrapper (copy), FStringJoinUserCTAsIxpLayer (copy), ProfilePlatformEnableSessionization (copy), SessionService (copy), SessionType (copy), FFlagProfilePlatformEnableMomentsModule (copy), CryoModule (copy), ParseComponentsFromJsonModule (copy), ProfilePlatformEventReceiverModule (copy), ProfilePlatformPageModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseProfileAnalyticsContextModuleResult = UseProfileAnalyticsContextModule()
	local ProfileId = UseProfileWrapperContextModuleResult.profileId
	local ProfileType = UseProfileWrapperContextModuleResult.profileType
	local UseIsMeTabModuleResult = if FFlagAXEnableProfileTab then UseIsMeTabModule() else nil
	local IsTextMatch = tostring(ProfileId) == tostring((UseLocalUserIdFunction()))
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = if FFlagProfilePlatformTrustedConnectionsMVP then NavigationModule.useNavigation() else nil
	local UseProfileJsonModuleResult = UseProfileJsonModule()
	local UseAvailableComponentsModuleResult = UseAvailableComponentsModule()
	local UseActionsComponentRequestModuleResult = if FFlagProfilePlatformRefreshActionsRespectPoliciesModule then UseActionsComponentRequestModule() else nil
	local UseRefResult = ReactModule.useRef(0)
	
	local function v62(ReloadCount)
		-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval), LoadingStages (upval), UseDispatchResult (copy), GetProfilePlatformModule (upval), ProfileId (copy), ProfileType (copy), UseAvailableComponentsModuleResult (copy), FFlagProfilePlatformEnableLazyLoadingComponentsModule (upval), UseStateResult2 (copy), FFlagProfilePlatformEnableVRModule (upval), GetDeepValueModule (upval), EnumsModule (upval), FFlagProfilePlatformTrustedConnectionsMVP (upval), GetFriendStatusFromProfileResponseModule (upval), GetIsTrustedConnectionsStatusFromProfileResponseModule (upval), UseProfileWrapperContextModuleResult (copy), CheckQrSessionModule (upval), UseNavigationResult (copy), RobloxAppEnumsModule (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (copy), LoadingStagesExtensionModule (upval)
		local GetResult = SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.ProfileOpened)
		UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if GetResult then GetResult.timeElapsed else nil,
			status = LoadingStages.Fetching
		})
		UseDispatchResult(GetProfilePlatformModule.API({
			includeComponentOrdering = true,
			profileId = ProfileId,
			profileType = ProfileType,
			components = UseAvailableComponentsModuleResult,
			onlyEssentialComponents = if FFlagProfilePlatformEnableLazyLoadingComponentsModule then true else nil
		})):andThen(function(Result)
			-- upvalues: FFlagProfilePlatformEnableLazyLoadingComponentsModule (upval), UseStateResult2 (upval), FFlagProfilePlatformEnableVRModule (upval), ReloadCount (copy), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), GetDeepValueModule (upval), EnumsModule (upval), FFlagProfilePlatformTrustedConnectionsMVP (upval), GetFriendStatusFromProfileResponseModule (upval), GetIsTrustedConnectionsStatusFromProfileResponseModule (upval), UseProfileWrapperContextModuleResult (upval), UseDispatchResult (upval), CheckQrSessionModule (upval), ProfileId (upval), UseNavigationResult (upval), RobloxAppEnumsModule (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
			if FFlagProfilePlatformEnableLazyLoadingComponentsModule then
				UseStateResult2(false)
			end
			if FFlagProfilePlatformEnableVRModule and ReloadCount > 1 then
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfilePlatformPageReloaded, { reloadCount = ReloadCount })
				
				return
			end
			local DeepValueModule = GetDeepValueModule(Result, `responseBody.components.{EnumsModule.Components.Actions}.buttons`)
			local Type = if DeepValueModule and DeepValueModule[1] then DeepValueModule[1].type else nil
			
			if FFlagProfilePlatformTrustedConnectionsMVP and GetFriendStatusFromProfileResponseModule(Result) == EnumsModule.FriendStatus.Friends and not GetIsTrustedConnectionsStatusFromProfileResponseModule(Result) and UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.QrCode then
				UseDispatchResult(CheckQrSessionModule.API(ProfileId)):andThen(function(Result)
					-- upvalues: UseNavigationResult (upval), RobloxAppEnumsModule (upval), ProfileId (upval), UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), UseActionsComponentRequestModuleResult (upval)
					if Result.responseBody == true then
						UseNavigationResult.push(RobloxAppEnumsModule.AppPage.TrustedContactsModal, {
							props = {
								sentFromQrCode = true,
								userId = ProfileId,
								onRequestSent = function()
									-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformActionInfoModule (upval), ProfileId (upval), UseActionsComponentRequestModuleResult (upval)
									return UseDispatchResult(RefreshProfilePlatformActionInfoModule(ProfileId, UseActionsComponentRequestModuleResult))
								end
							}
						})
					end
				end)
			end
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfilePageLoadedWithData, {
				friendStatus = GetFriendStatusFromProfileResponseModule(Result),
				absolutePosition = UseProfileWrapperContextModuleResult.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = UseProfileWrapperContextModuleResult.sourceInfo.source == EnumsModule.Sources.HomepageFriendsCarousel,
				source = UseProfileWrapperContextModuleResult.sourceInfo.source,
				isRecommendation = UseProfileWrapperContextModuleResult.sourceInfo.isRecommendation,
				UseProfileWrapperContextModuleResult.sourceInfo.recommendationContextType,
				recommendationRank = UseProfileWrapperContextModuleResult.sourceInfo.recommendationRank,
				recommendationSessionId = UseProfileWrapperContextModuleResult.sourceInfo.recommendationSessionId,
				shareLinkId = UseProfileWrapperContextModuleResult.sourceInfo.shareLinkId,
				primaryAction = Type
			})
		end):catch(function(_)
			-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), GetResult (copy), LoadingStages (upval)
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if GetResult then GetResult.timeElapsed else nil,
				status = LoadingStages.Failed
			})
		end)
		
		if FFlagProfilePlatformEnableLazyLoadingComponentsModule then
			UseDispatchResult(GetProfilePlatformModule.API({
				includeComponentOrdering = true,
				onlyEssentialComponents = false,
				profileId = ProfileId,
				profileType = ProfileType,
				components = UseAvailableComponentsModuleResult
			})):andThen(function(_)
				-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), GetResult (copy), LoadingStagesExtensionModule (upval)
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if GetResult then GetResult.timeElapsed else nil,
					status = LoadingStagesExtensionModule.LazyLoaded
				})
			end):catch(function(_)
				-- upvalues: UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval), GetResult (copy), LoadingStages (upval)
				UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if GetResult then GetResult.timeElapsed else nil,
					status = LoadingStages.Failed
				})
			end)
		end
	end
	
	UseEffectOnMountFunction(function()
		-- upvalues: ProfileType (copy), EnumsModule (upval), ProfileId (copy), AvatarModelPrefetch (upval)
		if ProfileType ~= EnumsModule.ProfileTypes.User then return end
		local Number: number? = tonumber(ProfileId)
		
		if Number then
			AvatarModelPrefetch.prefetch(Number)
		end
	end)
	
	if ProfilePlatformEnableRefreshSignal then
		local UseSignalStateResult = UseSignalStateFunction(ProfileRefreshSignal.getProfileRefreshSignal)
		local UseRefResult1 = ReactModule.useRef(0)
		ReactModule.useEffect(function()
			-- upvalues: IsTextMatch (copy), UseSignalStateResult (copy), UseRefResult1 (copy), v62 (copy)
			if IsTextMatch and UseRefResult1.current < UseSignalStateResult then
				UseRefResult1.current = UseSignalStateResult
				v62()
			end
		end, { UseSignalStateResult, IsTextMatch, ProfileId, v62 })
	end
	if FFlagProfilePlatformEnableVRModule then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), v62 (copy)
			local NewCurrent = UseRefResult.current + 1
			UseRefResult.current = NewCurrent
			v62(NewCurrent)
		end, { UseAvailableComponentsModuleResult })
	else
		UseEffectOnMountFunction(function()
			-- upvalues: v62 (copy)
			v62()
		end)
	end
	ReactModule.useEffect(function()
		-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (copy), EventNamesModule (upval)
		return function()
			-- upvalues: SocialStopwatchModule (upval), UseProfileAnalyticsContextModuleResult (upval), EventNamesModule (upval)
			SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.ProfileOpened)
			UseProfileAnalyticsContextModuleResult.fireAnalyticsEvent(EventNamesModule.ProfileClosed)
		end
	end, {})
	
	if EnableSocialProfilePeekViewExposureEvents then
		UseEffectOnMountFunction(function()
			-- upvalues: IXPService (upval), SocialProfilePeekViewLayer (upval), SocialProfilePeekViewSecondaryLayer (upval), IsTextMatch (copy), SocialSelfProfileViewLayer (upval)
			IXPService:LogFlagLinkedUserLayerExposure(SocialProfilePeekViewLayer)
			IXPService:LogFlagLinkedUserLayerExposure(SocialProfilePeekViewSecondaryLayer)
			
			if IsTextMatch then
				IXPService:LogFlagLinkedUserLayerExposure(SocialSelfProfileViewLayer)
			end
		end)
	end
	if FFlagJoinUserCTAsIxpEnabled then
		UseEffectOnMountFunction(function()
			-- upvalues: ProfileType (copy), EnumsModule (upval), IsTextMatch (copy), IXPServiceWrapper (upval), FStringJoinUserCTAsIxpLayer (upval)
			if ProfileType == EnumsModule.ProfileTypes.User and not IsTextMatch then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringJoinUserCTAsIxpLayer)
			end
		end)
	end
	if ProfilePlatformEnableSessionization then
		ReactModule.useEffect(function()
			-- upvalues: SessionService (upval), SessionType (upval), UseProfileWrapperContextModuleResult (copy)
			local Metadata = nil
			
			if SessionService:SessionExists(SessionType.StructuralIdentifier.ProfilePlatformPage) then
				Metadata = SessionService:GetMetadata(SessionType.StructuralIdentifier.ProfilePlatformPage, SessionType.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, SessionType.StructuralIdentifier.ProfilePlatformPage, SessionType.StructuralIdentifier.ProfilePlatformPage)
			end
			SessionService:SetMetadata(SessionType.StructuralIdentifier.ProfilePlatformPage, SessionType.Metadata.ProfilePlatformPage.ProfileSessionId, UseProfileWrapperContextModuleResult.profileSessionId)
			
			return function()
				-- upvalues: Metadata (ref), SessionService (upval), SessionType (upval)
				if Metadata == nil then
					SessionService:RemoveSession(SessionType.StructuralIdentifier.ProfilePlatformPage)
					
					return
				else
					SessionService:SetMetadata(SessionType.StructuralIdentifier.ProfilePlatformPage, SessionType.Metadata.ProfilePlatformPage.ProfileSessionId, Metadata)
				end
			end
		end, {})
	end
	local Source = if FFlagProfilePlatformEnableMomentsModule then UseProfileWrapperContextModuleResult.sourceInfo.source else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), ParseComponentsFromJsonModule (upval), UseProfileJsonModuleResult (copy), ProfileType (copy), Source (copy), FFlagAXEnableProfileTab (upval), UseIsMeTabModuleResult (copy), ReactModule (upval), ProfilePlatformEventReceiverModule (upval)
		return CryoModule.Dictionary.union(ParseComponentsFromJsonModule(UseProfileJsonModuleResult.components, UseProfileJsonModuleResult.componentOrdering, ProfileType, Source, if FFlagAXEnableProfileTab then UseIsMeTabModuleResult else nil), {
			ProfilePlatformEventReceiver = ReactModule.createElement(ProfilePlatformEventReceiverModule)
		})
	end, {
		UseProfileJsonModuleResult.components,
		UseProfileJsonModuleResult.componentOrdering,
		Source,
		if FFlagAXEnableProfileTab then UseIsMeTabModuleResult else nil,
		ProfileType
	})
	
	return ReactModule.createElement(ProfilePlatformPageModule, {
		children = if FFlagProfilePlatformEnableLazyLoadingComponentsModule and UseStateResult then {} else UseMemoResult
	})
end