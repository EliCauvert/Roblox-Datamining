local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename
local t = {
	friends = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		copy = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.MakeFriendsToParty" else "Feature.Chat.Message.MakeConnectionsToParty" else "Feature.Chat.Message.MakeConnectionsToChat",
		cta = if fFlagConnectionsToFriendsRename then "Feature.SettingsHub.Label.NoFriendsScreen" else "Feature.SettingsHub.Label.NoConnectionsScreen"
	},
	regional = {
		icon = "icons/status/oof_xlarge",
		cta = nil,
		copy = if getFFlagIsSquadEnabled() then "Feature.Chat.Message.PartyUnavailableRegion" else "Feature.Chat.Message.ChatUnavailableRegion"
	},
	privacy = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		cta = "Feature.Chat.Label.PrivacySettings",
		copy = if getFFlagIsSquadEnabled() then if fFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableParty.FriendsRename" else "Feature.Chat.Message.EnableParty" elseif fFlagConnectionsToFriendsRename then "Feature.Chat.Message.EnableChat.FriendsRename" else "Feature.Chat.Message.EnableChat"
	},
	thirdParty = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		copy = "Feature.Chat.Message.ChatIsDisabledByPrivacySetting",
		cta = nil
	},
	fallback = {
		icon = "icons/status/oof_xlarge",
		copy = "CommonUI.Messages.Response.PageError",
		cta = nil
	}
}

local function _(p0) --[[ line: 72 | named "getEmptyStateFromProps" ]]
	return if p0.chatEnabled then "friends" elseif p0.globalRulesEnabled then if p0.privacySettingsEnabled then if p0.thirdPartyPrivacySettingsEnabled then "fallback" else "thirdParty" else "privacy" else "regional"
end

return function(p1) --[[ line: 87 | named "NoConversationsLanding" ]]
	-- upvalues: t (ref), useLocalization (ref), reactModule (ref), foundationModule (ref)
	local var3 = if p1.chatEnabled then "friends" elseif not p1.globalRulesEnabled then "regional" elseif not p1.privacySettingsEnabled then "privacy" elseif not p1.thirdPartyPrivacySettingsEnabled then "thirdParty" else "fallback"
	local var4 = t[var3]
	local var5 = var4.cta ~= nil
	
	if var3 == "friends" and not p1.canNavigateToAddFriends then
		var5 = false
	elseif var3 == "privacy" and not p1.canNavigateToPrivacySettings then
		var5 = false
	end
	local var6 = useLocalization({
		callToAction = var4.cta or "Feature.Chat.Label.PrivacySettings",
		copy = var4.copy
	})
	reactModule.useEffect(function() --[[ line: 102 ]]
		-- upvalues: p1 (ref), var3 (ref)
		if p1.fireRenderEvent then
			p1.fireRenderEvent(var3)
		end
	end, { p1.fireRenderEvent, var3 })
	
	return reactModule.createElement(foundationModule.Empty, {
		icon = { size = "XLarge", name = var4.icon },
		text = var6.copy,
		button = if var5 then {
			icon = "icons/navigation/externallink_medium",
			text = var6.callToAction,
			onActivated = function() --[[ line: 118 ]]
				-- upvalues: p1 (ref), var3 (ref)
				p1.onCallToAction(var3)
			end
		} else nil
	})
end