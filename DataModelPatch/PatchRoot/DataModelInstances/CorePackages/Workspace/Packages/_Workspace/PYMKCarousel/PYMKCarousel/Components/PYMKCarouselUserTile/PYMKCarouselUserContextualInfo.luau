local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local SocialCommonModule = require(Parent1.SocialCommon)
local Roact = DependenciesModule.Roact
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local RoduxFriends = DependenciesModule.RoduxFriends
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local TextKeysModule = require(Parent.Common.TextKeys)
local CarouselUserContextualInfo = SocialCommonModule.Components.CarouselUserTile.CarouselUserContextualInfo
local UseRecommendationContextualInfoDisplayFunction = SocialCommonModule.Hooks.useRecommendationContextualInfoDisplay
local RecommendationContextType = RoduxFriends.Enums.RecommendationContextType
local FFlagConnectionsToFriendsRename = require(Parent1.SharedFlags).FFlagConnectionsToFriendsRename

local function v11(p1)
	-- upvalues: UseLocalizationFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({ contextualText = p1.textKey })
	local ContextualText = if p1.textKey then UseLocalizationResult.contextualText else p1.text
	
	return if p1.formatter then p1.formatter(ContextualText) else ContextualText
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), RoduxFriends (copy), GetDeepValueFunction (copy), UseRecommendationContextualInfoDisplayFunction (copy), FFlagConnectionsToFriendsRename (copy), TextKeysModule (copy), RecommendationContextType (copy), React (copy), v11 (copy), Roact (copy), CarouselUserContextualInfo (copy)
	local Text = tostring(p1.userId)
	local UseSelectorResult = UseSelectorFunction(function(p2): string
		return (tostring(p2.LocalUserId))
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: RoduxFriends (upval), UseSelectorResult (copy), Text (copy)
		return RoduxFriends.Selectors.selectRecommendationsForUserId(p2)(UseSelectorResult)[Text] or {}
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), Text (copy)
		return GetDeepValueFunction(p2, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", Text)) or false
	end)
	local Config = if UseSelectorResult2 then if p1.contextType == RecommendationContextType.Contacts then { textKey = TextKeysModule.FromContacts } else {
		textKey = if FFlagConnectionsToFriendsRename then TextKeysModule.FriendRequestContext else TextKeysModule.ConnectionRequestContext
	} elseif p1.contextType == RecommendationContextType.Contacts then { textKey = TextKeysModule.FromContacts } else {
		text = UseRecommendationContextualInfoDisplayFunction(UseSelectorResult1).text
	}
	
	return Roact.createElement(CarouselUserContextualInfo, {
		label = {
			text = React.useCallback(v11(Config), { Config }),
			font = Config.font,
			colorStyle = Config.colorStyle
		},
		lineWidth = p1.lineWidth
	})
end