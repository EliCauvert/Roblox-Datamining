local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local abbreviateCount = require(parent.Localization).abbreviateCount
local images = require(parent.FoundationImages).Images
local _ = require(parent.SduiCoreSystem)
local sduiGameTileActiveFriendsFooterModule = require(serverDrivenUi.Content.SduiGameTileActiveFriendsFooter)
local sduiTileFooterModule = require(serverDrivenUi.Content.SduiTileFooter)
local sduiInGameFriendsDataModule = require(serverDrivenUi.DataStore.SduiInGameFriendsData)
local fFlagLuaAppFixInlineSignalsReactPattern = require(parent.SharedFlags).FFlagLuaAppFixInlineSignalsReactPattern

return reactModule.memo(function(p1)
	-- upvalues: sduiInGameFriendsDataModule (ref), fFlagLuaAppFixInlineSignalsReactPattern (ref), reactModule (ref), signalsReactModule (ref), sduiTileFooterModule (ref), sduiGameTileActiveFriendsFooterModule (ref), images (ref), abbreviateCount (ref)
	local _ = nil
	local getInGameFriendsByGame = sduiInGameFriendsDataModule.getInGameFriendsByGame
	local var1 = if fFlagLuaAppFixInlineSignalsReactPattern then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getInGameFriendsByGame (ref), p1 (ref)
		local universeId = getInGameFriendsByGame(p2)[p1.universeId]
		
		if universeId then
			for i in universeId do
				return true
			end
		end
		return false
	end, { getInGameFriendsByGame, p1.universeId })) else signalsReactModule.useSignalState(function(p3)
		-- upvalues: getInGameFriendsByGame (ref), p1 (ref)
		local universeId = getInGameFriendsByGame(p3)[p1.universeId]
		
		if universeId then
			for i in universeId do
				return true
			end
		end
		return false
	end)
	
	if (p1.isSelected or p1.isHovered) and (p1.ageRatingText and p1.ageRatingText ~= "") then
		return reactModule.createElement(sduiTileFooterModule, {
			testId = "--sdui-game-tile-footer-age-rating",
			leftText = p1.ageRatingText,
			analyticsContext = p1.analyticsContext
		})
	elseif var1 then
		return reactModule.createElement(sduiGameTileActiveFriendsFooterModule, {
			testId = "--sdui-game-tile-footer-active-friends",
			hideBorder = true,
			placeId = p1.placeId,
			universeId = p1.universeId,
			sduiContext = p1.sduiContext,
			analyticsContext = p1.analyticsContext
		})
	elseif not p1.ratingText or p1.ratingText == "" then
		return p1.footerComponent
	end
	local sduiContext = p1.sduiContext
	local ratingText = p1.ratingText
	local var2 = if p1.ratingText then images["icons/status/games/rating_small"] else nil
	local var3 = nil
	local var4 = nil
	
	if p1.playerCount ~= nil then
		var4 = if p1.playerCount == -1 then "--" else abbreviateCount(p1.playerCount, sduiContext.dependencies.localization:GetLocale())
		var3 = images["icons/status/games/people-playing_small"]
	end
	return reactModule.createElement(sduiTileFooterModule, {
		testId = "--sdui-game-tile-footer-rating",
		sduiContext = p1.sduiContext,
		leftText = ratingText,
		leftIcon = var2,
		rightText = var4,
		rightIcon = var3
	})
end)