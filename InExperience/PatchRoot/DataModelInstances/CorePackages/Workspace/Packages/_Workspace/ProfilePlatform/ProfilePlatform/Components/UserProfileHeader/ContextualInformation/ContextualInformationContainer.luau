local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useEffectOnMount = roactUtilsModule.Hooks.useEffectOnMount
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local enumsModule = require(profilePlatform.Common.Enums)
local horizontalPageMargin = require(parent.UIBlox).App.Container.HorizontalPageMargin
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local IXPService = game:GetService("IXPService")
local contextualGenericModule = require(script.Parent.ContextualGeneric)
local contextualPresenceModule = require(script.Parent.ContextualPresence)
local contextualMutualFriendsModule = require(script.Parent.ContextualMutualFriends)
local contextualPlayedTogetherModule = require(script.Parent.ContextualPlayedTogether)
local fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule = require(profilePlatform.Flags.FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceName)
local fStringSocialProfileCurrentlyPlayingLayerModule = require(profilePlatform.Flags.FStringSocialProfileCurrentlyPlayingLayer)
local fFlagProfileCurrentlyPlayingIXPEnabledModule = require(profilePlatform.Flags.FFlagProfileCurrentlyPlayingIXPEnabled)

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useProfileJsonComponentModule (ref), enumsModule (ref), fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule (ref), useDispatch (ref), useEffectOnMount (ref), networkingGamesModule (ref), reactModule (ref), fFlagProfileCurrentlyPlayingIXPEnabledModule (ref), IXPService (ref), fStringSocialProfileCurrentlyPlayingLayerModule (ref), useSelector (ref), getDeepValue (ref), contextualPresenceModule (ref), contextualMutualFriendsModule (ref), contextualPlayedTogetherModule (ref), contextualGenericModule (ref), horizontalPageMargin (ref)
	local var20
	local sourceInfo = useProfileWrapperContextModule().sourceInfo
	local contextualInformation = (useProfileJsonComponentModule(enumsModule.Components.UserProfileHeader) or {}).contextualInformation
	local context = contextualInformation.context
	local contextDetails = contextualInformation.contextDetails
	local var15 = if context == enumsModule.ContextualTypes.SentFromExperience then contextDetails[context].sourceUniverseId elseif fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and context == enumsModule.ContextualTypes.PlayedTogether then contextDetails[context].mostFrequentUniverseId else nil
	local var16 = useDispatch()
	useEffectOnMount(function()
		-- upvalues: context (ref), enumsModule (copy), fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule (copy), var16 (ref), networkingGamesModule (copy), var15 (ref)
		if context == enumsModule.ContextualTypes.SentFromExperience or fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and context == enumsModule.ContextualTypes.PlayedTogether then
			var16(networkingGamesModule.GetExperiencesDetails.API({ var15 })):catch(function(_) end)
		end
	end)
	reactModule.useEffect(function()
		-- upvalues: fFlagProfileCurrentlyPlayingIXPEnabledModule (copy), context (ref), enumsModule (copy), IXPService (copy), fStringSocialProfileCurrentlyPlayingLayerModule (copy)
		if fFlagProfileCurrentlyPlayingIXPEnabledModule and context == enumsModule.ContextualTypes.Presence then
			IXPService:LogFlagLinkedUserLayerExposure(fStringSocialProfileCurrentlyPlayingLayerModule)
		end
	end, { context })
	local var17 = useSelector(function(p1)
		-- upvalues: getDeepValue (copy), var15 (ref)
		return getDeepValue(p1, `ProfilePlatform.Games.byGameId.{tostring(var15)}.name`) or ""
	end)
	local var18 = getDeepValue(sourceInfo, "contextualOverride.icon")
	local var19 = getDeepValue(sourceInfo, "contextualOverride.text")
	local _ = nil
	
	if context == enumsModule.ContextualTypes.Presence then
		var20 = reactModule.createElement(contextualPresenceModule)
	elseif context == enumsModule.ContextualTypes.MutualFriends then
		local var21 = contextDetails[context]
		var20 = reactModule.createElement(contextualMutualFriendsModule, {
			mutualFriends = var21.mutualFriends,
			mutualFriendsCount = var21.mutualFriendsCount
		})
	var20 = if fFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and context == enumsModule.ContextualTypes.PlayedTogether then reactModule.createElement(contextualPlayedTogetherModule, { experienceName = var17 }) else reactModule.createElement(contextualGenericModule, {
		contextualType = context,
		experienceName = var17,
		iconOverride = var18,
		textOverride = var19
	})
	return reactModule.createElement(horizontalPageMargin, {
		useAutomaticSizing = true,
		backgroundTransparency = 1,
		size = p0.size,
		layoutOrder = p0.layoutOrder
	}, { contextualInformation = var20 })
end