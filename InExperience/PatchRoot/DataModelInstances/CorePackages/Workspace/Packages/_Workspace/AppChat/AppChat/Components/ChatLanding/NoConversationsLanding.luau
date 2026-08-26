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

local function _(p1)
	return if p1.chatEnabled then "friends" elseif p1.globalRulesEnabled then if p1.privacySettingsEnabled then if p1.thirdPartyPrivacySettingsEnabled then "fallback" else "thirdParty" else "privacy" else "regional"
end

return function(p1)
	-- upvalues: t (ref), useLocalization (ref), reactModule (ref), foundationModule (ref)
	local var1 = if p1.chatEnabled then "friends" elseif not p1.globalRulesEnabled then "regional" elseif not p1.privacySettingsEnabled then "privacy" elseif not p1.thirdPartyPrivacySettingsEnabled then "thirdParty" else "fallback"
	local var2 = t[var1]
	local var3 = var2.cta ~= nil
	
	if var1 == "friends" and not p1.canNavigateToAddFriends then
		var3 = false
	elseif var1 == "privacy" and not p1.canNavigateToPrivacySettings then
		var3 = false
	end
	local var4 = useLocalization({
		callToAction = var2.cta or "Feature.Chat.Label.PrivacySettings",
		copy = var2.copy
	})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.fireRenderEvent then
			p1.fireRenderEvent(var1)
		end
	end, { p1.fireRenderEvent, var1 })
	
	return reactModule.createElement(foundationModule.Empty, {
		icon = { size = "XLarge", name = var2.icon },
		text = var4.copy,
		button = if var3 then {
			icon = "icons/navigation/externallink_medium",
			text = var4.callToAction,
			onActivated = function()
				-- upvalues: p1 (ref), var1 (ref)
				p1.onCallToAction(var1)
			end
		} else nil
	})
end