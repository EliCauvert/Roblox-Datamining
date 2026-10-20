local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local config = {
	friends = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		cta = "Feature.SettingsHub.Label.NoFriendsScreen",
		copy = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.MakeFriendsToParty" else "Feature.Chat.Message.MakeConnectionsToChat"
	},
	regional = {
		icon = "icons/status/oof_xlarge",
		cta = nil,
		copy = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.PartyUnavailableRegion" else "Feature.Chat.Message.ChatUnavailableRegion"
	},
	privacy = {
		icon = "rbxasset://textures/ui/LuaChat/icons/ic-friends.png",
		cta = "Feature.Chat.Label.PrivacySettings",
		copy = if GetFFlagIsSquadEnabledFunction() then "Feature.Chat.Message.EnableParty.FriendsRename" else "Feature.Chat.Message.EnableChat.FriendsRename"
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

local function _(p1): string
	return if p1.chatEnabled then "friends" elseif p1.globalRulesEnabled then if p1.privacySettingsEnabled then if p1.thirdPartyPrivacySettingsEnabled then "fallback" else "thirdParty" else "privacy" else "regional"
end

return function(p1)
	-- upvalues: config (copy), UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy)
	local Friends: string = if p1.chatEnabled then "friends" elseif p1.globalRulesEnabled then if p1.privacySettingsEnabled then if p1.thirdPartyPrivacySettingsEnabled then "fallback" else "thirdParty" else "privacy" else "regional"
	local Entry = config[Friends]
	local HasCta: boolean = (Friends ~= "friends" or p1.canNavigateToAddFriends) and ((Friends ~= "privacy" or p1.canNavigateToPrivacySettings) and Entry.cta ~= nil)
	local UseLocalizationResult = UseLocalizationFunction({
		callToAction = Entry.cta or "Feature.Chat.Label.PrivacySettings",
		copy = Entry.copy
	})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Friends (copy)
		if p1.fireRenderEvent then
			p1.fireRenderEvent(Friends)
		end
	end, { p1.fireRenderEvent, Friends })
	
	return ReactModule.createElement(FoundationModule.Empty, {
		icon = { size = "XLarge", name = Entry.icon },
		text = UseLocalizationResult.copy,
		button = if HasCta then {
			icon = "icons/navigation/externallink_medium",
			text = UseLocalizationResult.callToAction,
			onActivated = function()
				-- upvalues: p1 (copy), Friends (copy)
				p1.onCallToAction(Friends)
			end
		} else nil
	})
end