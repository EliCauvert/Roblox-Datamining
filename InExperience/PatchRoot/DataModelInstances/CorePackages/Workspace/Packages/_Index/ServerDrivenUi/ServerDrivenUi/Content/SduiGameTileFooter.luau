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

return reactModule.memo(function(p0)
	-- upvalues: sduiInGameFriendsDataModule (ref), fFlagLuaAppFixInlineSignalsReactPattern (ref), reactModule (ref), signalsReactModule (ref), sduiTileFooterModule (ref), sduiGameTileActiveFriendsFooterModule (ref), images (ref), abbreviateCount (ref)
	local _ = nil
	local getInGameFriendsByGame = sduiInGameFriendsDataModule.getInGameFriendsByGame
	local var6 = if fFlagLuaAppFixInlineSignalsReactPattern then signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getInGameFriendsByGame (ref), p0 (ref)
		local universeId = getInGameFriendsByGame(p2)[p0.universeId]
		
		if universeId then
			for i in universeId do
				return true
			end
		end
		return false
	end, { getInGameFriendsByGame, p0.universeId })) else signalsReactModule.useSignalState(function(p1)
		-- upvalues: getInGameFriendsByGame (ref), p0 (ref)
		local universeId = getInGameFriendsByGame(p1)[p0.universeId]
		
		if universeId then
			for i in universeId do
				return true
			end
		end
		return false
	end)
	
	if (p0.isSelected or p0.isHovered) and (p0.ageRatingText and p0.ageRatingText ~= "") then
		return reactModule.createElement(sduiTileFooterModule, {
			testId = "--sdui-game-tile-footer-age-rating",
			leftText = p0.ageRatingText,
			analyticsContext = p0.analyticsContext
		})
	elseif var6 then
		return reactModule.createElement(sduiGameTileActiveFriendsFooterModule, {
			testId = "--sdui-game-tile-footer-active-friends",
			hideBorder = true,
			placeId = p0.placeId,
			universeId = p0.universeId,
			sduiContext = p0.sduiContext,
			analyticsContext = p0.analyticsContext
		})
	elseif not p0.ratingText or p0.ratingText == "" then
		return p0.footerComponent
	end
	local sduiContext = p0.sduiContext
	local ratingText = p0.ratingText
	local var7 = if p0.ratingText then images["icons/status/games/rating_small"] else nil
	local var8 = nil
	local var9 = nil
	
	if p0.playerCount ~= nil then
		var9 = if p0.playerCount == -1 then "--" else abbreviateCount(p0.playerCount, sduiContext.dependencies.localization:GetLocale())
		var8 = images["icons/status/games/people-playing_small"]
	end
	return reactModule.createElement(sduiTileFooterModule, {
		testId = "--sdui-game-tile-footer-rating",
		sduiContext = p0.sduiContext,
		leftText = ratingText,
		leftIcon = var7,
		rightText = var9,
		rightIcon = var8
	})
end)