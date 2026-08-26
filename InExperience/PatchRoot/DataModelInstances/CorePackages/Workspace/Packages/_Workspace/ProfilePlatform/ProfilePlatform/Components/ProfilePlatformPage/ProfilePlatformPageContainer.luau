local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local getDeepValueModule = require(profilePlatform.Utils.getDeepValue)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local sharedFlagsModule = require(parent.SharedFlags)
local socialLuaAnalyticsModule = require(parent.SocialLuaAnalytics)
local socialStopwatchModule = require(parent.SocialStopwatch)
local cryoModule = require(parent.Cryo)
local checkQrSessionModule = require(profilePlatform.Networking.checkQrSession)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSignalState = require(parent.SignalsReact).useSignalState
local profileRefreshSignal = require(parent.ProfilePlatformCommon).Signals.ProfileRefreshSignal
local parseComponentsFromJsonModule = require(profilePlatform.Components.ProfilePlatformPage.parseComponentsFromJson)
local useAvailableComponentsModule = require(profilePlatform.Hooks.useAvailableComponents)
local useProfileJsonModule = require(profilePlatform.Hooks.useProfileJson)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useIsMeTabModule = require(profilePlatform.Hooks.useIsMeTab)
local profilePlatformEventReceiverModule = require(script.Parent.ProfilePlatformEventReceiver)
local useProfileAnalyticsContextModule = require(profilePlatform.Contexts.useProfileAnalyticsContext)
local eventNamesModule = require(profilePlatform.Analytics.EventNames)
local enumsModule = require(profilePlatform.Common.Enums)
local getFriendStatusFromProfileResponseModule = require(script.Parent.getFriendStatusFromProfileResponse)
local getIsTrustedConnectionsStatusFromProfileResponseModule = require(script.Parent.getIsTrustedConnectionsStatusFromProfileResponse)
local refreshProfilePlatformActionInfoModule = require(profilePlatform.Networking.refreshProfilePlatformActionInfo)
local useActionsComponentRequestModule = require(profilePlatform.Hooks.useActionsComponentRequest)
local loadingStages = socialLuaAnalyticsModule.Analytics.Enums.LoadingStages
local loadingStagesExtensionModule = require(profilePlatform.Analytics.LoadingStagesExtension)
local fFlagProfilePlatformEnableVRModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableVR)
local fFlagProfilePlatformEnableLazyLoadingComponentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableLazyLoadingComponents)
local fFlagProfilePlatformRefreshActionsRespectPoliciesModule = require(profilePlatform.Flags.FFlagProfilePlatformRefreshActionsRespectPolicies)
local fFlagProfilePlatformEnableMomentsModule = require(profilePlatform.Flags.FFlagProfilePlatformEnableMoments)
local fFlagProfilePlatformTrustedConnectionsMVP = sharedFlagsModule.FFlagProfilePlatformTrustedConnectionsMVP
local fFlagAXEnableProfileTab = sharedFlagsModule.FFlagAXEnableProfileTab
local socialProfilePeekViewLayer = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView")
local socialProfilePeekViewSecondaryLayer = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary")
local socialSelfProfileViewLayer = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView")
local IXPService = game:GetService("IXPService")
local enableSocialProfilePeekViewExposureEvents = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false)
local profilePlatformEnableRefreshSignal = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false)
local profilePlatformEnableSessionization = game:DefineFastFlag("ProfilePlatformEnableSessionization", false)
local var1 = if profilePlatformEnableSessionization then game:GetService("SessionService") else nil
local var2 = if profilePlatformEnableSessionization then require(parent.RobloxAppSessionization).SessionType else nil
local avatarModelPrefetch = require(parent.EditProfileBackground).AvatarModelPrefetch
local profilePlatformPageModule = require(script.Parent.ProfilePlatformPage)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

return function()
	-- upvalues: reactModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useLocalUserId (ref), useDispatch (ref), fFlagProfilePlatformTrustedConnectionsMVP (ref), navigationModule (ref), useProfileJsonModule (ref), useAvailableComponentsModule (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStages (ref), getProfilePlatformModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), getDeepValueModule (ref), enumsModule (ref), getFriendStatusFromProfileResponseModule (ref), getIsTrustedConnectionsStatusFromProfileResponseModule (ref), checkQrSessionModule (ref), robloxAppEnumsModule (ref), refreshProfilePlatformActionInfoModule (ref), loadingStagesExtensionModule (ref), useEffectOnMount (ref), avatarModelPrefetch (ref), profilePlatformEnableRefreshSignal (ref), useSignalState (ref), profileRefreshSignal (ref), enableSocialProfilePeekViewExposureEvents (ref), IXPService (ref), socialProfilePeekViewLayer (ref), socialProfilePeekViewSecondaryLayer (ref), socialSelfProfileViewLayer (ref), profilePlatformEnableSessionization (ref), var1 (ref), var2 (ref), fFlagProfilePlatformEnableMomentsModule (ref), cryoModule (ref), parseComponentsFromJsonModule (ref), profilePlatformEventReceiverModule (ref), profilePlatformPageModule (ref)
	local var3, var4 = reactModule.useState(true)
	local var5 = useProfileWrapperContextModule()
	local var6 = useProfileAnalyticsContextModule()
	local profileId = var5.profileId
	local profileType = var5.profileType
	local var7 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var8 = tostring(profileId) == tostring(useLocalUserId())
	local var9 = useDispatch()
	local var10 = if fFlagProfilePlatformTrustedConnectionsMVP then navigationModule.useNavigation() else nil
	local var11 = useProfileJsonModule()
	local var12 = useAvailableComponentsModule()
	local var13 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var14 = reactModule.useRef(0)
	
	local var15 = function(p1)
		-- upvalues: socialStopwatchModule (copy), var6 (ref), eventNamesModule (copy), loadingStages (copy), var9 (ref), getProfilePlatformModule (copy), profileId (ref), profileType (ref), var12 (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var4 (ref), fFlagProfilePlatformEnableVRModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var5 (ref), checkQrSessionModule (copy), var10 (ref), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var13 (ref), loadingStagesExtensionModule (copy)
		local var16 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var6.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var16 then var16.timeElapsed else nil,
			status = loadingStages.Fetching
		})
		var9(getProfilePlatformModule.API({
			includeComponentOrdering = true,
			profileId = profileId,
			profileType = profileType,
			components = var12,
			onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then true else nil
		})):andThen(function(p2)
			-- upvalues: fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var4 (copy), fFlagProfilePlatformEnableVRModule (copy), p1 (ref), var6 (copy), eventNamesModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var5 (copy), var9 (copy), checkQrSessionModule (copy), profileId (copy), var10 (copy), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var13 (copy)
			if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
				var4(false)
			end
			if fFlagProfilePlatformEnableVRModule and p1 > 1 then
				var6.fireAnalyticsEvent(eventNamesModule.ProfilePlatformPageReloaded, { reloadCount = p1 })
				
				return
			end
			local var17 = getDeepValueModule(p2, `responseBody.components.{enumsModule.Components.Actions}.buttons`)
			local var18 = if var17 and var17[1] then var17[1].type else nil
			
			if fFlagProfilePlatformTrustedConnectionsMVP and getFriendStatusFromProfileResponseModule(p2) == enumsModule.FriendStatus.Friends and (not getIsTrustedConnectionsStatusFromProfileResponseModule(p2) and var5.sourceInfo.source == enumsModule.Sources.QrCode) then
				var9(checkQrSessionModule.API(profileId)):andThen(function(p3)
					-- upvalues: var10 (copy), robloxAppEnumsModule (copy), profileId (copy), var9 (copy), refreshProfilePlatformActionInfoModule (copy), var13 (copy)
					if p3.responseBody == true then
						var10.push(robloxAppEnumsModule.AppPage.TrustedContactsModal, {
							props = {
								sentFromQrCode = true,
								userId = profileId,
								onRequestSent = function()
									-- upvalues: var9 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var13 (copy)
									return var9(refreshProfilePlatformActionInfoModule(profileId, var13))
								end
							}
						})
					end
				end)
			end
			var6.fireAnalyticsEvent(eventNamesModule.ProfilePageLoadedWithData, {
				friendStatus = getFriendStatusFromProfileResponseModule(p2),
				absolutePosition = var5.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = var5.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
				source = var5.sourceInfo.source,
				isRecommendation = var5.sourceInfo.isRecommendation,
				var5.sourceInfo.recommendationContextType,
				recommendationRank = var5.sourceInfo.recommendationRank,
				recommendationSessionId = var5.sourceInfo.recommendationSessionId,
				shareLinkId = var5.sourceInfo.shareLinkId,
				primaryAction = var18
			})
		end):catch(function(_)
			-- upvalues: var6 (copy), eventNamesModule (copy), var16 (ref), loadingStages (copy)
			var6.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if var16 then var16.timeElapsed else nil,
				status = loadingStages.Failed
			})
		end)
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			var9(getProfilePlatformModule.API({
				includeComponentOrdering = true,
				onlyEssentialComponents = false,
				profileId = profileId,
				profileType = profileType,
				components = var12
			})):andThen(function(_)
				-- upvalues: var6 (copy), eventNamesModule (copy), var16 (ref), loadingStagesExtensionModule (copy)
				var6.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var16 then var16.timeElapsed else nil,
					status = loadingStagesExtensionModule.LazyLoaded
				})
			end):catch(function(_)
				-- upvalues: var6 (copy), eventNamesModule (copy), var16 (ref), loadingStages (copy)
				var6.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var16 then var16.timeElapsed else nil,
					status = loadingStages.Failed
				})
			end)
		end
	end
	
	useEffectOnMount(function()
		-- upvalues: profileType (ref), enumsModule (copy), profileId (ref), avatarModelPrefetch (copy)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		local var16 = tonumber(profileId)
		
		if var16 then
			avatarModelPrefetch.prefetch(var16)
		end
	end)
	
	if profilePlatformEnableRefreshSignal then
		local var16 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
		local var17 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: var8 (ref), var16 (ref), var17 (ref), var15 (ref)
			if var8 and var17.current < var16 then
				var17.current = var16
				var15()
			end
		end, { var16, var8, profileId, var15 })
	end
	if fFlagProfilePlatformEnableVRModule then
		reactModule.useEffect(function()
			-- upvalues: var14 (ref), var15 (ref)
			local var18 = var14.current + 1
			var14.current = var18
			var15(var18)
		end, { var12 })
	else
		useEffectOnMount(function()
			-- upvalues: var15 (ref)
			var15()
		end)
	end
	reactModule.useEffect(function()
		-- upvalues: socialStopwatchModule (copy), var6 (ref), eventNamesModule (copy)
		return function()
			-- upvalues: socialStopwatchModule (copy), var6 (copy), eventNamesModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.ProfileOpened)
			var6.fireAnalyticsEvent(eventNamesModule.ProfileClosed)
		end
	end, {})
	
	if enableSocialProfilePeekViewExposureEvents then
		useEffectOnMount(function()
			-- upvalues: IXPService (copy), socialProfilePeekViewLayer (copy), socialProfilePeekViewSecondaryLayer (copy), var8 (ref), socialSelfProfileViewLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewLayer)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewSecondaryLayer)
			
			if var8 then
				IXPService:LogFlagLinkedUserLayerExposure(socialSelfProfileViewLayer)
			end
		end)
	end
	if profilePlatformEnableSessionization then
		reactModule.useEffect(function()
			-- upvalues: var1 (copy), var2 (copy), var5 (ref)
			local profilePlatformPageMetadata = nil
			
			if var1:SessionExists(var2.StructuralIdentifier.ProfilePlatformPage) then
				profilePlatformPageMetadata = var1:GetMetadata(var2.StructuralIdentifier.ProfilePlatformPage, var2.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				var1:SetSession(var2.StructuralIdentifier.Level2a, var2.StructuralIdentifier.ProfilePlatformPage, var2.StructuralIdentifier.ProfilePlatformPage)
			end
			var1:SetMetadata(var2.StructuralIdentifier.ProfilePlatformPage, var2.Metadata.ProfilePlatformPage.ProfileSessionId, var5.profileSessionId)
			
			return function()
				-- upvalues: profilePlatformPageMetadata (write), var1 (copy), var2 (copy)
				if profilePlatformPageMetadata == nil then
					var1:RemoveSession(var2.StructuralIdentifier.ProfilePlatformPage)
					
					return
				end
				var1:SetMetadata(var2.StructuralIdentifier.ProfilePlatformPage, var2.Metadata.ProfilePlatformPage.ProfileSessionId, profilePlatformPageMetadata)
			end
		end, {})
	end
	local var18 = if fFlagProfilePlatformEnableMomentsModule then var5.sourceInfo.source else nil
	
	return reactModule.createElement(profilePlatformPageModule, {
		children = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and var3 then {} else reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), parseComponentsFromJsonModule (copy), var11 (ref), profileType (ref), var18 (ref), fFlagAXEnableProfileTab (copy), var7 (ref), reactModule (copy), profilePlatformEventReceiverModule (copy)
			return cryoModule.Dictionary.union(parseComponentsFromJsonModule(var11.components, var11.componentOrdering, profileType, var18, if fFlagAXEnableProfileTab then var7 else nil), {
				ProfilePlatformEventReceiver = reactModule.createElement(profilePlatformEventReceiverModule)
			})
		end, {
			var11.components,
			var11.componentOrdering,
			var18,
			if fFlagAXEnableProfileTab then var7 else nil,
			profileType
		})
	})
end