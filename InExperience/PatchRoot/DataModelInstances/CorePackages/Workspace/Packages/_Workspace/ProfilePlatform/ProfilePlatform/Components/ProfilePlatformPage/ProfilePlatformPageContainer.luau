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
local fFlagJoinUserCTAsIxpEnabled = sharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local fStringJoinUserCTAsIxpLayer = sharedFlagsModule.FStringJoinUserCTAsIxpLayer
local var1 = if fFlagJoinUserCTAsIxpEnabled then require(parent.IXPServiceWrapper).IXPServiceWrapper else nil
local socialProfilePeekViewLayer = game:DefineFastString("SocialProfilePeekViewLayer", "Social.ProfilePeekView")
local socialProfilePeekViewSecondaryLayer = game:DefineFastString("SocialProfilePeekViewSecondaryLayer", "Social.ProfilePeekView.Secondary")
local socialSelfProfileViewLayer = game:DefineFastString("SocialSelfProfileViewLayer", "Social.SelfProfileView")
local IXPService = game:GetService("IXPService")
local enableSocialProfilePeekViewExposureEvents = game:DefineFastFlag("EnableSocialProfilePeekViewExposureEvents", false)
local profilePlatformEnableRefreshSignal = game:DefineFastFlag("ProfilePlatformEnableRefreshSignal", false)
local profilePlatformEnableSessionization = game:DefineFastFlag("ProfilePlatformEnableSessionization", false)
local var2 = if profilePlatformEnableSessionization then game:GetService("SessionService") else nil
local var3 = if profilePlatformEnableSessionization then require(parent.RobloxAppSessionization).SessionType else nil
local avatarModelPrefetch = require(parent.EditProfileBackground).AvatarModelPrefetch
local profilePlatformPageModule = require(script.Parent.ProfilePlatformPage)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

return function()
	-- upvalues: reactModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useLocalUserId (ref), useDispatch (ref), fFlagProfilePlatformTrustedConnectionsMVP (ref), navigationModule (ref), useProfileJsonModule (ref), useAvailableComponentsModule (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStages (ref), getProfilePlatformModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), getDeepValueModule (ref), enumsModule (ref), getFriendStatusFromProfileResponseModule (ref), getIsTrustedConnectionsStatusFromProfileResponseModule (ref), checkQrSessionModule (ref), robloxAppEnumsModule (ref), refreshProfilePlatformActionInfoModule (ref), loadingStagesExtensionModule (ref), useEffectOnMount (ref), avatarModelPrefetch (ref), profilePlatformEnableRefreshSignal (ref), useSignalState (ref), profileRefreshSignal (ref), enableSocialProfilePeekViewExposureEvents (ref), IXPService (ref), socialProfilePeekViewLayer (ref), socialProfilePeekViewSecondaryLayer (ref), socialSelfProfileViewLayer (ref), fFlagJoinUserCTAsIxpEnabled (ref), var1 (ref), fStringJoinUserCTAsIxpLayer (ref), profilePlatformEnableSessionization (ref), var2 (ref), var3 (ref), fFlagProfilePlatformEnableMomentsModule (ref), cryoModule (ref), parseComponentsFromJsonModule (ref), profilePlatformEventReceiverModule (ref), profilePlatformPageModule (ref)
	local var4, var5 = reactModule.useState(true)
	local var6 = useProfileWrapperContextModule()
	local var7 = useProfileAnalyticsContextModule()
	local profileId = var6.profileId
	local profileType = var6.profileType
	local var8 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var9 = tostring(profileId) == tostring(useLocalUserId())
	local var10 = useDispatch()
	local var11 = if fFlagProfilePlatformTrustedConnectionsMVP then navigationModule.useNavigation() else nil
	local var12 = useProfileJsonModule()
	local var13 = useAvailableComponentsModule()
	local var14 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var15 = reactModule.useRef(0)
	
	local var16 = function(p1)
		-- upvalues: socialStopwatchModule (copy), var7 (ref), eventNamesModule (copy), loadingStages (copy), var10 (ref), getProfilePlatformModule (copy), profileId (ref), profileType (ref), var13 (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var5 (ref), fFlagProfilePlatformEnableVRModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var6 (ref), checkQrSessionModule (copy), var11 (ref), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var14 (ref), loadingStagesExtensionModule (copy)
		local var17 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var7.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var17 then var17.timeElapsed else nil,
			status = loadingStages.Fetching
		})
		var10(getProfilePlatformModule.API({
			includeComponentOrdering = true,
			profileId = profileId,
			profileType = profileType,
			components = var13,
			onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then true else nil
		})):andThen(function(p2)
			-- upvalues: fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var5 (copy), fFlagProfilePlatformEnableVRModule (copy), p1 (ref), var7 (copy), eventNamesModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var6 (copy), var10 (copy), checkQrSessionModule (copy), profileId (copy), var11 (copy), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var14 (copy)
			if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
				var5(false)
			end
			if fFlagProfilePlatformEnableVRModule and p1 > 1 then
				var7.fireAnalyticsEvent(eventNamesModule.ProfilePlatformPageReloaded, { reloadCount = p1 })
				
				return
			end
			local var18 = getDeepValueModule(p2, `responseBody.components.{enumsModule.Components.Actions}.buttons`)
			local var19 = if var18 and var18[1] then var18[1].type else nil
			
			if fFlagProfilePlatformTrustedConnectionsMVP and getFriendStatusFromProfileResponseModule(p2) == enumsModule.FriendStatus.Friends and (not getIsTrustedConnectionsStatusFromProfileResponseModule(p2) and var6.sourceInfo.source == enumsModule.Sources.QrCode) then
				var10(checkQrSessionModule.API(profileId)):andThen(function(p3)
					-- upvalues: var11 (copy), robloxAppEnumsModule (copy), profileId (copy), var10 (copy), refreshProfilePlatformActionInfoModule (copy), var14 (copy)
					if p3.responseBody == true then
						var11.push(robloxAppEnumsModule.AppPage.TrustedContactsModal, {
							props = {
								sentFromQrCode = true,
								userId = profileId,
								onRequestSent = function()
									-- upvalues: var10 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var14 (copy)
									return var10(refreshProfilePlatformActionInfoModule(profileId, var14))
								end
							}
						})
					end
				end)
			end
			var7.fireAnalyticsEvent(eventNamesModule.ProfilePageLoadedWithData, {
				friendStatus = getFriendStatusFromProfileResponseModule(p2),
				absolutePosition = var6.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = var6.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
				source = var6.sourceInfo.source,
				isRecommendation = var6.sourceInfo.isRecommendation,
				var6.sourceInfo.recommendationContextType,
				recommendationRank = var6.sourceInfo.recommendationRank,
				recommendationSessionId = var6.sourceInfo.recommendationSessionId,
				shareLinkId = var6.sourceInfo.shareLinkId,
				primaryAction = var19
			})
		end):catch(function(_)
			-- upvalues: var7 (copy), eventNamesModule (copy), var17 (ref), loadingStages (copy)
			var7.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if var17 then var17.timeElapsed else nil,
				status = loadingStages.Failed
			})
		end)
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			var10(getProfilePlatformModule.API({
				includeComponentOrdering = true,
				onlyEssentialComponents = false,
				profileId = profileId,
				profileType = profileType,
				components = var13
			})):andThen(function(_)
				-- upvalues: var7 (copy), eventNamesModule (copy), var17 (ref), loadingStagesExtensionModule (copy)
				var7.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var17 then var17.timeElapsed else nil,
					status = loadingStagesExtensionModule.LazyLoaded
				})
			end):catch(function(_)
				-- upvalues: var7 (copy), eventNamesModule (copy), var17 (ref), loadingStages (copy)
				var7.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var17 then var17.timeElapsed else nil,
					status = loadingStages.Failed
				})
			end)
		end
	end
	
	useEffectOnMount(function()
		-- upvalues: profileType (ref), enumsModule (copy), profileId (ref), avatarModelPrefetch (copy)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		local var17 = tonumber(profileId)
		
		if var17 then
			avatarModelPrefetch.prefetch(var17)
		end
	end)
	
	if profilePlatformEnableRefreshSignal then
		local var17 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
		local var18 = reactModule.useRef(0)
		reactModule.useEffect(function()
			-- upvalues: var9 (ref), var17 (ref), var18 (ref), var16 (ref)
			if var9 and var18.current < var17 then
				var18.current = var17
				var16()
			end
		end, { var17, var9, profileId, var16 })
	end
	if fFlagProfilePlatformEnableVRModule then
		reactModule.useEffect(function()
			-- upvalues: var15 (ref), var16 (ref)
			local var19 = var15.current + 1
			var15.current = var19
			var16(var19)
		end, { var13 })
	else
		useEffectOnMount(function()
			-- upvalues: var16 (ref)
			var16()
		end)
	end
	reactModule.useEffect(function()
		-- upvalues: socialStopwatchModule (copy), var7 (ref), eventNamesModule (copy)
		return function()
			-- upvalues: socialStopwatchModule (copy), var7 (copy), eventNamesModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.ProfileOpened)
			var7.fireAnalyticsEvent(eventNamesModule.ProfileClosed)
		end
	end, {})
	
	if enableSocialProfilePeekViewExposureEvents then
		useEffectOnMount(function()
			-- upvalues: IXPService (copy), socialProfilePeekViewLayer (copy), socialProfilePeekViewSecondaryLayer (copy), var9 (ref), socialSelfProfileViewLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewLayer)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewSecondaryLayer)
			
			if var9 then
				IXPService:LogFlagLinkedUserLayerExposure(socialSelfProfileViewLayer)
			end
		end)
	end
	if fFlagJoinUserCTAsIxpEnabled then
		useEffectOnMount(function()
			-- upvalues: profileType (ref), enumsModule (copy), var9 (ref), var1 (copy), fStringJoinUserCTAsIxpLayer (copy)
			if profileType == enumsModule.ProfileTypes.User and not var9 then
				var1:LogFlagLinkedUserLayerExposure(fStringJoinUserCTAsIxpLayer)
			end
		end)
	end
	if profilePlatformEnableSessionization then
		reactModule.useEffect(function()
			-- upvalues: var2 (copy), var3 (copy), var6 (ref)
			local profilePlatformPageMetadata = nil
			
			if var2:SessionExists(var3.StructuralIdentifier.ProfilePlatformPage) then
				profilePlatformPageMetadata = var2:GetMetadata(var3.StructuralIdentifier.ProfilePlatformPage, var3.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				var2:SetSession(var3.StructuralIdentifier.Level2a, var3.StructuralIdentifier.ProfilePlatformPage, var3.StructuralIdentifier.ProfilePlatformPage)
			end
			var2:SetMetadata(var3.StructuralIdentifier.ProfilePlatformPage, var3.Metadata.ProfilePlatformPage.ProfileSessionId, var6.profileSessionId)
			
			return function()
				-- upvalues: profilePlatformPageMetadata (write), var2 (copy), var3 (copy)
				if profilePlatformPageMetadata == nil then
					var2:RemoveSession(var3.StructuralIdentifier.ProfilePlatformPage)
					
					return
				end
				var2:SetMetadata(var3.StructuralIdentifier.ProfilePlatformPage, var3.Metadata.ProfilePlatformPage.ProfileSessionId, profilePlatformPageMetadata)
			end
		end, {})
	end
	local var19 = if fFlagProfilePlatformEnableMomentsModule then var6.sourceInfo.source else nil
	
	return reactModule.createElement(profilePlatformPageModule, {
		children = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and var4 then {} else reactModule.useMemo(function()
			-- upvalues: cryoModule (copy), parseComponentsFromJsonModule (copy), var12 (ref), profileType (ref), var19 (ref), fFlagAXEnableProfileTab (copy), var8 (ref), reactModule (copy), profilePlatformEventReceiverModule (copy)
			return cryoModule.Dictionary.union(parseComponentsFromJsonModule(var12.components, var12.componentOrdering, profileType, var19, if fFlagAXEnableProfileTab then var8 else nil), {
				ProfilePlatformEventReceiver = reactModule.createElement(profilePlatformEventReceiverModule)
			})
		end, {
			var12.components,
			var12.componentOrdering,
			var19,
			if fFlagAXEnableProfileTab then var8 else nil,
			profileType
		})
	})
end