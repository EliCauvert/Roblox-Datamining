local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signal = require(parent.AppCommonLib).Signal
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationProvider = foundationModule.FoundationProvider
local t = {
	Default = "Desktop",
	Desktop = "Desktop",
	Console = "Console"
}
local t_1 = {
	["Feature.SettingsHub.Action.Block"] = "Block",
	["Feature.SettingsHub.Action.Unblock"] = "Unblock",
	["Feature.SettingsHub.Label.Mute"] = "Mute",
	["Feature.SettingsHub.Label.Unmute"] = "Unmute",
	["CoreScripts.InGameMenu.QuickActions.Report"] = "Report",
	["Feature.SettingsHub.Prompt.BuyWhatTheyreWearing"] = "Buy what they\226\128\153re wearing\t",
	["Feature.SettingsHub.Description.SelectAvatarToCheckoutItems"] = "Select an avatar to check out their items.",
	["Feature.SettingsHub.Description.SelectUsernameToViewProfile"] = "View profiles by selecting a username.",
	["Feature.SettingsHub.Action.Ok"] = "Ok"
}
local t_2 = {
	Format = function(_, p0) --[[ line: 36 ]]
		-- upvalues: t_1 (ref)
		return t_1[p0] or p0
	end,
	changed = signal.new(),
	GetLocale = function() --[[ line: 40 ]]
		return "en-us"
	end
}

return {
	name = peopleReactView.Name,
	storyRoot = peopleReactView,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1) --[[ line: 46 ]]
		-- upvalues: reactModule (ref), localizationProvider (ref), t_2 (ref), foundationProvider (ref), foundationModule (ref), t (ref)
		return function(p2) --[[ line: 47 ]]
			-- upvalues: reactModule (copy), localizationProvider (copy), t_2 (copy), foundationProvider (copy), foundationModule (copy), t (copy), p1 (ref)
			return reactModule.createElement(localizationProvider, { localization = t_2 }, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					theme = foundationModule.Enums.Theme.Dark,
					device = if p2 then t[p2.platform] else "Desktop"
				}, { Child = reactModule.createElement(p1, p2) })
			})
		end
	end
}