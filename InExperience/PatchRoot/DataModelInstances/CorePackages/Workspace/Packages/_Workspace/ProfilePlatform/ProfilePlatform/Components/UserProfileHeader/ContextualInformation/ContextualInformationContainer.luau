local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local HorizontalPageMargin = require(Parent.UIBlox).App.Container.HorizontalPageMargin
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local ContextualGenericModule = require(script.Parent.ContextualGeneric)
local ContextualPresenceModule = require(script.Parent.ContextualPresence)
local ContextualMutualFriendsModule = require(script.Parent.ContextualMutualFriends)
local ContextualPlayedTogetherModule = require(script.Parent.ContextualPlayedTogether)
local FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule = require(ProfilePlatform.Flags.FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceName)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseProfileJsonComponentModule (copy), EnumsModule (copy), FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule (copy), UseDispatchFunction (copy), UseEffectOnMountFunction (copy), NetworkingGamesModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ReactModule (copy), ContextualPresenceModule (copy), ContextualMutualFriendsModule (copy), ContextualPlayedTogetherModule (copy), ContextualGenericModule (copy), HorizontalPageMargin (copy)
	local SourceInfo = UseProfileWrapperContextModule().sourceInfo
	local ContextualInformation = (UseProfileJsonComponentModule(EnumsModule.Components.UserProfileHeader) or {}).contextualInformation
	local Context = ContextualInformation.context
	local ContextDetails = ContextualInformation.contextDetails
	local SourceUniverseId = if Context == EnumsModule.ContextualTypes.SentFromExperience then ContextDetails[Context].sourceUniverseId elseif FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and Context == EnumsModule.ContextualTypes.PlayedTogether then ContextDetails[Context].mostFrequentUniverseId else nil
	local UseDispatchResult = UseDispatchFunction()
	UseEffectOnMountFunction(function()
		-- upvalues: Context (copy), EnumsModule (upval), FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule (upval), UseDispatchResult (copy), NetworkingGamesModule (upval), SourceUniverseId (copy)
		if Context == EnumsModule.ContextualTypes.SentFromExperience or FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and Context == EnumsModule.ContextualTypes.PlayedTogether then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ SourceUniverseId })):catch(function(_) end)
		end
	end)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), SourceUniverseId (copy)
		return GetDeepValueFunction(p2, `ProfilePlatform.Games.byGameId.{tostring(SourceUniverseId)}.name`) or ""
	end)
	local ContextualOverrideIcon = GetDeepValueFunction(SourceInfo, "contextualOverride.icon")
	local ContextualOverrideText = GetDeepValueFunction(SourceInfo, "contextualOverride.text")
	local Element = nil
	
	if Context == EnumsModule.ContextualTypes.Presence then
		Element = ReactModule.createElement(ContextualPresenceModule)
	elseif Context == EnumsModule.ContextualTypes.MutualFriends then
		local ContextDetail = ContextDetails[Context]
		Element = ReactModule.createElement(ContextualMutualFriendsModule, {
			mutualFriends = ContextDetail.mutualFriends,
			mutualFriendsCount = ContextDetail.mutualFriendsCount
		})
	else
		Element = if FFlagProfilePlatformEnablePlayedTogetherContextFrequentExperienceNameModule and Context == EnumsModule.ContextualTypes.PlayedTogether then ReactModule.createElement(ContextualPlayedTogetherModule, { experienceName = UseSelectorResult }) else ReactModule.createElement(ContextualGenericModule, {
			contextualType = Context,
			experienceName = UseSelectorResult,
			iconOverride = ContextualOverrideIcon,
			textOverride = ContextualOverrideText
		})
	end
	return ReactModule.createElement(HorizontalPageMargin, {
		useAutomaticSizing = true,
		backgroundTransparency = 1,
		size = p1.size,
		layoutOrder = p1.layoutOrder
	}, { contextualInformation = Element })
end