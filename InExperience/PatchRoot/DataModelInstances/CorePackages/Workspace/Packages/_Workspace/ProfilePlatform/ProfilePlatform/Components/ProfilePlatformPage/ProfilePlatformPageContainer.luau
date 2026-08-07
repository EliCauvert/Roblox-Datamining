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
local avatarModelPrefetch = require(parent.EditProfileBackground).AvatarModelPrefetch
local profilePlatformPageModule = require(script.Parent.ProfilePlatformPage)
local getProfilePlatformModule = require(profilePlatform.Networking.getProfilePlatform)

return function() --[[ line: 67 ]]
	-- upvalues: reactModule (ref), useProfileWrapperContextModule (ref), useProfileAnalyticsContextModule (ref), fFlagAXEnableProfileTab (ref), useIsMeTabModule (ref), useLocalUserId (ref), useDispatch (ref), fFlagProfilePlatformTrustedConnectionsMVP (ref), navigationModule (ref), useProfileJsonModule (ref), useAvailableComponentsModule (ref), fFlagProfilePlatformRefreshActionsRespectPoliciesModule (ref), useActionsComponentRequestModule (ref), socialStopwatchModule (ref), eventNamesModule (ref), loadingStages (ref), getProfilePlatformModule (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (ref), fFlagProfilePlatformEnableVRModule (ref), getDeepValueModule (ref), enumsModule (ref), getFriendStatusFromProfileResponseModule (ref), getIsTrustedConnectionsStatusFromProfileResponseModule (ref), checkQrSessionModule (ref), robloxAppEnumsModule (ref), refreshProfilePlatformActionInfoModule (ref), loadingStagesExtensionModule (ref), useEffectOnMount (ref), avatarModelPrefetch (ref), profilePlatformEnableRefreshSignal (ref), useSignalState (ref), profileRefreshSignal (ref), enableSocialProfilePeekViewExposureEvents (ref), IXPService (ref), socialProfilePeekViewLayer (ref), socialProfilePeekViewSecondaryLayer (ref), socialSelfProfileViewLayer (ref), profilePlatformEnableSessionization (ref), var36 (ref), var37 (ref), fFlagProfilePlatformEnableMomentsModule (ref), cryoModule (ref), parseComponentsFromJsonModule (ref), profilePlatformEventReceiverModule (ref), profilePlatformPageModule (ref)
	local var40, var41 = reactModule.useState(true)
	local var42 = useProfileWrapperContextModule()
	local var43 = useProfileAnalyticsContextModule()
	local profileId = var42.profileId
	local profileType = var42.profileType
	local var44 = if fFlagAXEnableProfileTab then useIsMeTabModule() else nil
	local var45 = tostring(profileId) == tostring(useLocalUserId())
	local var46 = useDispatch()
	local var47 = if fFlagProfilePlatformTrustedConnectionsMVP then navigationModule.useNavigation() else nil
	local var48 = useProfileJsonModule()
	local var49 = useAvailableComponentsModule()
	local var50 = if fFlagProfilePlatformRefreshActionsRespectPoliciesModule then useActionsComponentRequestModule() else nil
	local var51 = reactModule.useRef(0)
	
	local var52 = function(p0) --[[ line: 92 ]]
		-- upvalues: socialStopwatchModule (copy), var43 (ref), eventNamesModule (copy), loadingStages (copy), var46 (ref), getProfilePlatformModule (copy), profileId (ref), profileType (ref), var49 (ref), fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var41 (ref), fFlagProfilePlatformEnableVRModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var42 (ref), checkQrSessionModule (copy), var47 (ref), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var50 (ref), loadingStagesExtensionModule (copy)
		local var56 = socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.ProfileOpened)
		var43.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
			isProfilePlatform = true,
			statValue = if var56 then var56.timeElapsed else nil,
			status = loadingStages.Fetching
		})
		var46(getProfilePlatformModule.API({
			includeComponentOrdering = true,
			profileId = profileId,
			profileType = profileType,
			components = var49,
			onlyEssentialComponents = if fFlagProfilePlatformEnableLazyLoadingComponentsModule then true else nil
		})):andThen(function(p1) --[[ line: 108 ]]
			-- upvalues: fFlagProfilePlatformEnableLazyLoadingComponentsModule (copy), var41 (copy), fFlagProfilePlatformEnableVRModule (copy), p0 (ref), var43 (copy), eventNamesModule (copy), getDeepValueModule (copy), enumsModule (copy), fFlagProfilePlatformTrustedConnectionsMVP (copy), getFriendStatusFromProfileResponseModule (copy), getIsTrustedConnectionsStatusFromProfileResponseModule (copy), var42 (copy), var46 (copy), checkQrSessionModule (copy), profileId (copy), var47 (copy), robloxAppEnumsModule (copy), refreshProfilePlatformActionInfoModule (copy), var50 (copy)
			if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
				var41(false)
			end
			if fFlagProfilePlatformEnableVRModule and p0 > 1 then
				var43.fireAnalyticsEvent(eventNamesModule.ProfilePlatformPageReloaded, { reloadCount = p0 })
				
				return
			end
			local var57 = getDeepValueModule(p1, `responseBody.components.{enumsModule.Components.Actions}.buttons`)
			local var58 = if var57 and var57[1] then var57[1].type else nil
			
			if fFlagProfilePlatformTrustedConnectionsMVP and getFriendStatusFromProfileResponseModule(p1) == enumsModule.FriendStatus.Friends and (not getIsTrustedConnectionsStatusFromProfileResponseModule(p1) and var42.sourceInfo.source == enumsModule.Sources.QrCode) then
				var46(checkQrSessionModule.API(profileId)):andThen(function(p2) --[[ line: 130 ]]
					-- upvalues: var47 (copy), robloxAppEnumsModule (copy), profileId (copy), var46 (copy), refreshProfilePlatformActionInfoModule (copy), var50 (copy)
					if p2.responseBody == true then
						var47.push(robloxAppEnumsModule.AppPage.TrustedContactsModal, {
							props = {
								sentFromQrCode = true,
								userId = profileId,
								onRequestSent = function() --[[ line: 136 ]]
									-- upvalues: var46 (copy), refreshProfilePlatformActionInfoModule (copy), profileId (copy), var50 (copy)
									return var46(refreshProfilePlatformActionInfoModule(profileId, var50))
								end
							}
						})
					end
				end)
			end
			var43.fireAnalyticsEvent(eventNamesModule.ProfilePageLoadedWithData, {
				friendStatus = getFriendStatusFromProfileResponseModule(p1),
				absolutePosition = var42.sourceInfo.homepageCarouselAbsolutePosition,
				isHomePageCarousel = var42.sourceInfo.source == enumsModule.Sources.HomepageFriendsCarousel,
				source = var42.sourceInfo.source,
				isRecommendation = var42.sourceInfo.isRecommendation,
				var42.sourceInfo.recommendationContextType,
				recommendationRank = var42.sourceInfo.recommendationRank,
				recommendationSessionId = var42.sourceInfo.recommendationSessionId,
				shareLinkId = var42.sourceInfo.shareLinkId,
				primaryAction = var58
			})
		end):catch(function(_) --[[ line: 162 ]]
			-- upvalues: var43 (copy), eventNamesModule (copy), var56 (ref), loadingStages (copy)
			var43.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
				isProfilePlatform = true,
				statValue = if var56 then var56.timeElapsed else nil,
				status = loadingStages.Failed
			})
		end)
		
		if fFlagProfilePlatformEnableLazyLoadingComponentsModule then
			var46(getProfilePlatformModule.API({
				includeComponentOrdering = true,
				onlyEssentialComponents = false,
				profileId = profileId,
				profileType = profileType,
				components = var49
			})):andThen(function(_) --[[ line: 178 ]]
				-- upvalues: var43 (copy), eventNamesModule (copy), var56 (ref), loadingStagesExtensionModule (copy)
				var43.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var56 then var56.timeElapsed else nil,
					status = loadingStagesExtensionModule.LazyLoaded
				})
			end):catch(function(_) --[[ line: 185 ]]
				-- upvalues: var43 (copy), eventNamesModule (copy), var56 (ref), loadingStages (copy)
				var43.fireAnalyticsEvent(eventNamesModule.ProfileLoadingStage, {
					isProfilePlatform = true,
					statValue = if var56 then var56.timeElapsed else nil,
					status = loadingStages.Failed
				})
			end)
		end
	end
	
	useEffectOnMount(function() --[[ line: 194 ]]
		-- upvalues: profileType (ref), enumsModule (copy), profileId (ref), avatarModelPrefetch (copy)
		if profileType ~= enumsModule.ProfileTypes.User then return end
		local var59 = tonumber(profileId)
		
		if var59 then
			avatarModelPrefetch.prefetch(var59)
		end
	end)
	
	if profilePlatformEnableRefreshSignal then
		local var53 = useSignalState(profileRefreshSignal.getProfileRefreshSignal)
		local var54 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 208 ]]
			-- upvalues: var45 (ref), var53 (ref), var54 (ref), var52 (ref)
			if var45 and var54.current < var53 then
				var54.current = var53
				var52()
			end
		end, { var53, var45, profileId, var52 })
	end
	if fFlagProfilePlatformEnableVRModule then
		reactModule.useEffect(function() --[[ line: 217 ]]
			-- upvalues: var51 (ref), var52 (ref)
			local var60 = var51.current + 1
			var51.current = var60
			var52(var60)
		end, { var49 })
	else
		useEffectOnMount(function() --[[ line: 223 ]]
			-- upvalues: var52 (ref)
			var52()
		end)
	end
	reactModule.useEffect(function() --[[ line: 228 ]]
		-- upvalues: socialStopwatchModule (copy), var43 (ref), eventNamesModule (copy)
		return function() --[[ line: 229 ]]
			-- upvalues: socialStopwatchModule (copy), var43 (copy), eventNamesModule (copy)
			socialStopwatchModule.Stopwatch.stop(socialStopwatchModule.Events.ProfileOpened)
			var43.fireAnalyticsEvent(eventNamesModule.ProfileClosed)
		end
	end, {})
	
	if enableSocialProfilePeekViewExposureEvents then
		useEffectOnMount(function() --[[ line: 237 ]]
			-- upvalues: IXPService (copy), socialProfilePeekViewLayer (copy), socialProfilePeekViewSecondaryLayer (copy), var45 (ref), socialSelfProfileViewLayer (copy)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewLayer)
			IXPService:LogFlagLinkedUserLayerExposure(socialProfilePeekViewSecondaryLayer)
			
			if var45 then
				IXPService:LogFlagLinkedUserLayerExposure(socialSelfProfileViewLayer)
			end
		end)
	end
	if profilePlatformEnableSessionization then
		reactModule.useEffect(function() --[[ line: 247 ]]
			-- upvalues: var36 (copy), var37 (copy), var42 (ref)
			local profilePlatformPageMetadata = nil
			
			if var36:SessionExists(var37.StructuralIdentifier.ProfilePlatformPage) then
				profilePlatformPageMetadata = var36:GetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId)
			else
				var36:SetSession(var37.StructuralIdentifier.Level2a, var37.StructuralIdentifier.ProfilePlatformPage, var37.StructuralIdentifier.ProfilePlatformPage)
			end
			var36:SetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId, var42.profileSessionId)
			
			return function() --[[ line: 267 ]]
				-- upvalues: profilePlatformPageMetadata (write), var36 (copy), var37 (copy)
				if profilePlatformPageMetadata == nil then
					var36:RemoveSession(var37.StructuralIdentifier.ProfilePlatformPage)
					
					return
				end
				var36:SetMetadata(var37.StructuralIdentifier.ProfilePlatformPage, var37.Metadata.ProfilePlatformPage.ProfileSessionId, profilePlatformPageMetadata)
			end
		end, {})
	end
	local var55 = if fFlagProfilePlatformEnableMomentsModule then var42.sourceInfo.source else nil
	
	return reactModule.createElement(profilePlatformPageModule, {
		children = if fFlagProfilePlatformEnableLazyLoadingComponentsModule and var40 then {} else reactModule.useMemo(function() --[[ line: 283 ]]
			-- upvalues: cryoModule (copy), parseComponentsFromJsonModule (copy), var48 (ref), profileType (ref), var55 (ref), fFlagAXEnableProfileTab (copy), var44 (ref), reactModule (copy), profilePlatformEventReceiverModule (copy)
			return cryoModule.Dictionary.union(parseComponentsFromJsonModule(var48.components, var48.componentOrdering, profileType, var55, if fFlagAXEnableProfileTab then var44 else nil), {
				ProfilePlatformEventReceiver = reactModule.createElement(profilePlatformEventReceiverModule)
			})
		end, {
			var48.components,
			var48.componentOrdering,
			var55,
			if fFlagAXEnableProfileTab then var44 else nil,
			profileType
		})
	})
end