local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = FoundationModule.FoundationProvider
local config = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}
local config1 = {
	["Feature.SettingsHub.Action.Block"] = "Block",
	["Feature.SettingsHub.Action.Unblock"] = "Unblock",
	["Feature.SettingsHub.Label.Mute"] = "Mute",
	["Feature.SettingsHub.Label.Unmute"] = "Unmute",
	["CoreScripts.InGameMenu.QuickActions.Report"] = "Report",
	["Feature.SettingsHub.Prompt.BuyWhatTheyreWearing"] = "Buy what they’re wearing\t",
	["Feature.SettingsHub.Description.SelectAvatarToCheckoutItems"] = "Select an avatar to check out their items.",
	["Feature.SettingsHub.Description.SelectUsernameToViewProfile"] = "View profiles by selecting a username.",
	["Feature.SettingsHub.Action.Ok"] = "Ok"
}
local Localization = {
	Format = function(_, p1)
		-- upvalues: config1 (copy)
		return config1[p1] or p1
	end,
	changed = require(Parent.AppCommonLib).Signal.new(),
	GetLocale = function(): string
		return "en-us"
	end
}

return {
	name = PeopleReactView.Name,
	storyRoot = PeopleReactView,
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), FoundationProvider (copy), FoundationModule (copy), config (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (upval), FoundationProvider (upval), FoundationModule (upval), config (upval), p1 (copy)
			return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					theme = FoundationModule.Enums.Theme.Dark,
					device = p2 and config[p2.platform] or "Desktop"
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}