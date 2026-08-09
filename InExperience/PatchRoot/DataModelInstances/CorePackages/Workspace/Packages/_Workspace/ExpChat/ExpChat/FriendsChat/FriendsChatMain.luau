local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.RobloxAppLocales).Localization
local configModule = require(expChat.Config)
local conversationListModule = require(script.Parent.ConversationList)
local friendsChatConversationWindowModule = require(script.Parent.ConversationWindow.FriendsChatConversationWindow)
local getFriendsChatRealtimeStoreModule = require(script.Parent.Stores.GetFriendsChatRealtimeStore)
local t = {
	BackgroundColor3 = configModule.ChatWindowBackgroundColor3,
	BackgroundTransparency = configModule.ChatWindowBackgroundTransparency
}

return function(p0) --[[ line: 27 | named "FriendsChatMain" ]]
	-- upvalues: getFriendsChatRealtimeStoreModule (ref), reactModule (ref), t (ref), playersService (ref), localization (ref), localizationService (ref), conversationListModule (ref), friendsChatConversationWindowModule (ref), localizationProvider (ref), foundationModule (ref)
	local var10 = getFriendsChatRealtimeStoreModule(false)
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var10 (ref)
		var10.markFriendsTabEntered()
	end, { var10 })
	local var11, var12 = reactModule.useState(nil)
	local chatWindowSettings = p0.chatWindowSettings or t
	local parentLayoutOrder = p0.parentLayoutOrder or 1
	local localPlayer = playersService.LocalPlayer
	local var15 = if localPlayer then tostring(localPlayer.UserId) else nil
	local var16 = reactModule.useMemo(function() --[[ line: 44 ]]
		-- upvalues: localization (copy), localizationService (copy)
		return localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var10 (ref), var11 (ref)
		var10.setActiveConversationId(var11)
		
		return function() --[[ line: 50 ]]
			-- upvalues: var10 (copy)
			var10.setActiveConversationId(nil)
		end
	end, { var10, var11 })
	
	return reactModule.createElement(localizationProvider, { localization = var16 }, {
		Content = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
			Content = if var11 == nil then reactModule.createElement(conversationListModule, {
				LayoutOrder = parentLayoutOrder,
				size = UDim2.fromScale(1, 1),
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				textTransparency = p0.textTransparency,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
				onConversationActivated = reactModule.useCallback(function(p2) --[[ line: 55 ]]
					-- upvalues: var12 (ref)
					var12(p2)
				end, {}),
				localUserId = var15
			}) else reactModule.createElement(friendsChatConversationWindowModule, {
				conversationId = var11,
				parentLayoutOrder = parentLayoutOrder,
				chatWindowSettings = chatWindowSettings,
				transparencyValue = p0.transparencyValue,
				textTransparency = p0.textTransparency,
				mutedUserIds = p0.mutedUserIds,
				verifiedUserIds = p0.verifiedUserIds,
				showTranslationButton = p0.showTranslationButton,
				isSpatialUIEnabled = p0.isSpatialUIEnabled,
				isChannelBarVisible = p0.isChannelBarVisible,
				onHovered = p0.onHovered,
				onUnhovered = p0.onUnhovered,
				onAbsoluteSizeChanged = p0.onAbsoluteSizeChanged,
				onAbsolutePositionChanged = p0.onAbsolutePositionChanged,
				onBack = reactModule.useCallback(function() --[[ line: 59 ]]
					-- upvalues: var12 (ref)
					var12(nil)
				end, {}),
				onFriendPlaceholderConversationCreated = reactModule.useCallback(function(p1) --[[ line: 63 ]]
					-- upvalues: var12 (ref)
					var12(p1)
				end, {})
			})
		})
	})
end