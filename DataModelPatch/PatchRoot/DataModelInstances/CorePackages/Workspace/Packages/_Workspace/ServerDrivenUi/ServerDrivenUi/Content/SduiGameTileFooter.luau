local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local AbbreviateCountFunction = require(Parent.Localization).abbreviateCount
local Images = require(Parent.FoundationImages).Images
local _ = require(Parent.SduiCoreSystem)
local SduiGameTileActiveFriendsFooterModule = require(ServerDrivenUi.Content.SduiGameTileActiveFriendsFooter)
local SduiTileFooterModule = require(ServerDrivenUi.Content.SduiTileFooter)
local SduiInGameFriendsDataModule = require(ServerDrivenUi.DataStore.SduiInGameFriendsData)
local FFlagLuaAppFixInlineSignalsReactPattern = require(Parent.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern

return ReactModule.memo(function(p1)
	-- upvalues: SduiInGameFriendsDataModule (copy), FFlagLuaAppFixInlineSignalsReactPattern (copy), ReactModule (copy), SignalsReactModule (copy), SduiTileFooterModule (copy), SduiGameTileActiveFriendsFooterModule (copy), Images (copy), AbbreviateCountFunction (copy)
	local GetInGameFriendsByGameFunction = SduiInGameFriendsDataModule.getInGameFriendsByGame
	local UseSignalStateResult = if FFlagLuaAppFixInlineSignalsReactPattern then SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2): boolean
		-- upvalues: GetInGameFriendsByGameFunction (copy), p1 (copy)
		local InGameFriendsByGameEntry = GetInGameFriendsByGameFunction(p2)[p1.universeId]
		
		if InGameFriendsByGameEntry then
			for _ in InGameFriendsByGameEntry do
				return true
			end
		end
		return false
	end, { GetInGameFriendsByGameFunction, p1.universeId }))) else SignalsReactModule.useSignalState(function(p3): boolean
		-- upvalues: GetInGameFriendsByGameFunction (copy), p1 (copy)
		local InGameFriendsByGameEntry = GetInGameFriendsByGameFunction(p3)[p1.universeId]
		
		if InGameFriendsByGameEntry then
			for _ in InGameFriendsByGameEntry do
				return true
			end
		end
		return false
	end)
	
	if (p1.isSelected or p1.isHovered) and (p1.ageRatingText and p1.ageRatingText ~= "") then
		return ReactModule.createElement(SduiTileFooterModule, {
			testId = "--sdui-game-tile-footer-age-rating",
			leftText = p1.ageRatingText,
			analyticsContext = p1.analyticsContext
		})
	end
	if UseSignalStateResult then
		return ReactModule.createElement(SduiGameTileActiveFriendsFooterModule, {
			testId = "--sdui-game-tile-footer-active-friends",
			hideBorder = true,
			placeId = p1.placeId,
			universeId = p1.universeId,
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext
		})
	end
	if not p1.ratingText or p1.ratingText == "" then
		return p1.footerComponent
	end
	local SduiContext = p1.sduiContext
	local RatingText = p1.ratingText
	local IconsStatusGamesRatingSmall = if p1.ratingText then Images["icons/status/games/rating_small"] else nil
	local IconsStatusGamesPeoplePlayingSmall = nil
	local RightText = nil
	
	if p1.playerCount ~= nil then
		RightText = if p1.playerCount == -1 then "--" else AbbreviateCountFunction(p1.playerCount, SduiContext.dependencies.localization:GetLocale())
		IconsStatusGamesPeoplePlayingSmall = Images["icons/status/games/people-playing_small"]
	end
	return ReactModule.createElement(SduiTileFooterModule, {
		testId = "--sdui-game-tile-footer-rating",
		sduiContext = p1.sduiContext,
		leftText = RatingText,
		leftIcon = IconsStatusGamesRatingSmall,
		rightText = RightText,
		rightIcon = IconsStatusGamesPeoplePlayingSmall
	})
end)