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
local var36 = if profilePlatformEnableSessionization then game:GetService("SessionService") else nil
local var37 = if profilePlatformEnableSessionization then require(parent.RobloxAppSessionization).SessionType else nil
local fFlagPPVBackgroundPrefetchAvatar = sharedFlagsModule.FFlagPPVBackgroundPrefetchAvatar
local var38 = if fFlagPPVBackgroundPrefetchAvatar then require(parent.EditProfileBackground).AvatarModelPrefetch else nil
local profilePlatformPageModule = require(script.Parent.ProfilePlatformPage)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

return function() --[[ line: 71 ]]
	-- upvalues: reactModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useLocalUserId (ref), useDispatch (ref), fFlagProfilePlatformTrustedConnectionsMVP (ref), navigationModule (ref), useProfileJsonModule (ref), useAvailableComponentsModule (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStages (ref), getProfilePlatformModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), getDeepValueModule (ref), enumsModule (ref), getFriendStatusFromProfileResponseModule (ref), getIsTrustedConnectionsStatusFromProfileResponseModule (ref), checkQrSessionModule (ref), robloxAppEnumsModule (ref), refreshProfilePlatformActionInfoModule (ref), loadingStagesExtensionModule (ref), fFlagPPVBackgroundPrefetchAvatar (ref), useEffectOnMount (ref), var38 (ref), profilePlatformEnableRefreshSignal (ref), useSignalState (ref), profileRefreshSignal (ref), enableSocialProfilePeekViewExposureEvents (ref), IXPService (ref), socialProfilePeekViewLayer (ref), socialProfilePeekViewSecondaryLayer (ref), socialSelfProfileViewLayer (ref), profilePlatformEnableSessionization (ref), var36 (ref), var37 (ref), fFlagProfilePlatformEnableMomentsModule (ref), cryoModule (ref), parseComponentsFromJsonModule (ref), profilePlatformEventReceiverModule (ref), profilePlatformPageModule (ref)
	local var41, var42 = reactModule.useState(true)
	local var43 = useProfileWrapperContextModule()
	local var44 = useProfileAnalyticsContextModule()
	local profileId = var43.profileId
	local profileType = var43.profileType
	local var45 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var46 = tostring(profileId) == tostring(useLocalUserId())
	local var47 = useDispatch()
	local var48 = if fFlagProfilePlatformTrustedConnectionsMVP then navigationModule.useNavigation() else nil
	local var49 = useProfileJsonModule()
	local var50 = useAvailableComponentsModule()
	local var51 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var52 = reactModule.useRef(0)
	
	local var53 = function(p0) --[[ line: 96 ]]
		-- upvalues: socialStopwatchModule (copy), var44 (ref), eventNamesModule (copy), loadingStages (copy), var47 (ref), getProfilePlatformModule (copy), profileId (ref), profileType (ref), var50 (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var42 (ref), fFlagProfilePlatformEnableVRModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var43 (ref), checkQrSessionModule (copy), var48 (ref), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var51 (ref), loadingStagesExtensionModule (copy)
		local var57 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var44.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var57 then var57.timeElapsed else nil,
			status = loadingStages.Fetching
		})
		var47(getProfilePlatformModule.API({
			includeComponentOrdering = true,
			profileId = profileId,
			profileType = profileType,
			components = var50,
			onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then true else nil
		})):andThen(function(p1) --[[ line: 112 ]]
			-- upvalues: fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var42 (copy), fFlagProfilePlatformEnableVRModule (copy), p0 (ref), var44 (copy), eventNamesModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var43 (copy), var47 (copy), checkQrSessionModule (copy), profileId (copy), var48 (copy), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var51 (copy)
			if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
				var42(false)
			end
			if fFlagProfilePlatformEnableVRModule and p0 > 1 then
				var44.fireAnalyticsEvent(eventNamesModule.ProfilePlatformPageReloaded, { reloadCount = p0 })
				
				return
			end
			local var58 = getDeepValueModule(p1, `responseBody.components.{enumsModule.Components.Actions}.buttons`)
			local var59 = if var58 and var58[1] then var58[1].type else nil
			
			if fFlagProfilePlatformTrustedConnectionsMVP and getFriendStatusFromProfileResponseModule(p1) == enumsModule.FriendStatus.Friends and (not getIsTrustedConnectionsStatusFromProfileResponseModule(p1) and var43.sourceInfo.source == enumsModule.Sources.QrCode) then
				var47(checkQrSessionModule.API(profileId)):andThen(function(p2) --[[ line: 134 ]]
					-- upvalues: var48 (copy), robloxAppEnumsModule (copy), profileId (copy), var47 (copy), refreshProfilePlatformActionInfoModule (copy), var51 (copy)
					if p2.responseBody == true then
						var48.push(robloxAppEnumsModule.AppPage.TrustedContactsModal, {
							props = {
								sentFromQrCode = true,
								userId = profileId,
								onRequestSent = function() --[[ line: 140 ]]
									-- upvalues: var47 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var51 (copy)
									return var47(refreshProfilePlatformActionInfoModule(profileId, var51))
								end
							}
						})
					end
				end)
			end
			var44.fireAnalyticsEvent(eventNamesModule.ProfilePageLoadedWithData, {
				friendStatus = getFriendStatusFromProfileResponseModule(p1),
				absolutePosition = var43.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = var43.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
				source = var43.sourceInfo.source,
				isRecommendation = var43.sourceInfo.isRecommendation,
				var43.sourceInfo.recommendationContextType,
				recommendationRank = var43.sourceInfo.recommendationRank,
				recommendationSessionId = var43.sourceInfo.recommendationSessionId,
				shareLinkId = var43.sourceInfo.shareLinkId,
				primaryAction = var59
			})
		end):catch(function(_) --[[ line: 166 ]]
			-- upvalues: var44 (copy), eventNamesModule (copy), var57 (ref), loadingStages (copy)
			var44.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if var57 then var57.timeElapsed else nil,
				status = loadingStages.Failed
			})
		end)
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			var47(getProfilePlatformModule.API({
				includeComponentOrdering = true,
				onlyEssentialComponents = false,
				profileId = profileId,
				profileType = profileType,
				components = var50
			})):andThen(function(_) --[[ line: 182 ]]
				-- upvalues: var44 (copy), eventNamesModule (copy), var57 (ref), loadingStagesExtensionModule (copy)
				var44.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var57 then var57.timeElapsed else nil,
					status = loadingStagesExtensionModule.LazyLoaded
				})
			end):catch(function(_) --[[ line: 189 ]]
				-- upvalues: var44 (copy), eventNamesModule (copy), var57 (ref), loadingStages (copy)
				var44.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var57 then var57.timeElapsed else nil,
					status = loadingStages.Failed
				})
			end)
		end
	end
	
	if fFlagPPVBackgroundPrefetchAvatar then
		useEffectOnMount(function() --[[ line: 200 ]]
			-- upvalues: profileType (ref), enumsModule (copy), profileId (ref), var38 (copy)
			if profileType ~= enumsModule.ProfileTypes.User then return end
			local var60 = tonumber(profileId)
			
			if var60 then
				var38.prefetch(var60)
			end
		end)
	end
	if profilePlatformEnableRefreshSignal then
		local var54 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
		local var55 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 215 ]]
			-- upvalues: var46 (ref), var54 (ref), var55 (ref), var53 (ref)
			if var46 and var55.current < var54 then
				var55.current = var54
				var53()
			end
		end, { var54, var46, profileId, var53 })
	end
	if fFlagProfilePlatformEnableVRModule then
		reactModule.useEffect(function() --[[ line: 224 ]]
			-- upvalues: var52 (ref), var53 (ref)
			local var61 = var52.current + 1
			var52.current = var61
			var53(var61)
		end, { var50 })
	else
		useEffectOnMount(function() --[[ line: 230 ]]
			-- upvalues: var53 (ref)
			var53()
		end)
	end
	reactModule.useEffect(function() --[[ line: 235 ]]
		-- upvalues: socialStopwatchModule (copy), var44 (ref), eventNamesModule (copy)
		return function() --[[ line: 236 ]]
			-- upvalues: socialStopwatchModule (copy), var44 (copy), eventNamesModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.ProfileOpened)
			var44.fireAnalyticsEvent(eventNamesModule.ProfileClosed)
		end
	end, {})
	
	if enableSocialProfilePeekViewExposureEvents then
		useEffectOnMount(function() --[[ line: 244 ]]
			-- upvalues: IXPService (copy), socialProfilePeekViewLayer (copy), socialProfilePeekViewSecondaryLayer (copy), var46 (ref), socialSelfProfileViewLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewLayer)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewSecondaryLayer)
			
			if var46 then
				IXPService:LogFlagLinkedUserLayerExposure(socialSelfProfileViewLayer)
			end
		end)
	end
	if profilePlatformEnableSessionization then
		reactModule.useEffect(function() --[[ line: 254 ]]
			-- upvalues: var36 (copy), var37 (copy), var43 (ref)
			local profilePlatformPageMetadata = nil
			
			if var36:SessionExists(var37.StructuralIdentifier.ProfilePlatformPage) then
				profilePlatformPageMetadata = var36:GetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				var36:SetSession(var37.StructuralIdentifier.Level2a, var37.StructuralIdentifier.ProfilePlatformPage, var37.StructuralIdentifier.ProfilePlatformPage)
			end
			var36:SetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId, var43.profileSessionId)
			
			return function() --[[ line: 274 ]]
				-- upvalues: profilePlatformPageMetadata (write), var36 (copy), var37 (copy)
				if profilePlatformPageMetadata == nil then
					var36:RemoveSession(var37.StructuralIdentifier.ProfilePlatformPage)
					
					return
				end
				var36:SetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId, profilePlatformPageMetadata)
			end
		end, {})
	end
	local var56 = if fFlagProfilePlatformEnableMomentsModule then var43.sourceInfo.source else nil
	
	return reactModule.createElement(profilePlatformPageModule, {
		children = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and var41 then {} else reactModule.useMemo(function() --[[ line: 290 ]]
			-- upvalues: cryoModule (copy), parseComponentsFromJsonModule (copy), var49 (ref), profileType (ref), var56 (ref), fFlagAXEnableProfileTab (copy), var45 (ref), reactModule (copy), profilePlatformEventReceiverModule (copy)
			return cryoModule.Dictionary.union(parseComponentsFromJsonModule(var49.components, var49.componentOrdering, profileType, var56, if fFlagAXEnableProfileTab then var45 else nil), {
				ProfilePlatformEventReceiver = reactModule.createElement(profilePlatformEventReceiverModule)
			})
		end, {
			var49.components,
			var49.componentOrdering,
			var56,
			if fFlagAXEnableProfileTab then var45 else nil,
			profileType
		})
	})
end