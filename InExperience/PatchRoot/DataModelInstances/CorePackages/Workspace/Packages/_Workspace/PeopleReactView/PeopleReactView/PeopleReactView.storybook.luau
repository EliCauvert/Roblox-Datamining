local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local signal = require(parent.AppCommonLib).Signal
local localizationProvider = require(parent.Localization).LocalizationProvider
local foundationProvider = foundationModule.FoundationProvider
local useStyleSheet = foundationModule.Hooks.useStyleSheet
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
	["CoreScripts.InGameMenu.GameSettings.Volume"] = "Volume",
	["Feature.SettingsHub.Label.VoiceChat"] = "Voice chat",
	["CoreScripts.InGameMenu.VoiceChatVolumeLower"] = "Voice chat volume",
	["Feature.SettingsHub.Prompt.BuyWhatTheyreWearing"] = "Buy what they\226\128\153re wearing\t",
	["Feature.SettingsHub.Description.SelectAvatarToCheckoutItems"] = "Select an avatar to check out their items.",
	["Feature.SettingsHub.Description.SelectUsernameToViewProfile"] = "View profiles by selecting a username.",
	["Feature.SettingsHub.Action.Ok"] = "Ok"
}
local t_2 = {
	Format = function(_, p0) --[[ line: 40 ]]
		-- upvalues: t_1 (ref)
		return t_1[p0] or p0
	end,
	changed = signal.new(),
	GetLocale = function() --[[ line: 44 ]]
		return "en-us"
	end
}

local function StyleLinkPortal(p1) --[[ line: 49 ]]
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	return reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() }), p1.overlay)
end

return {
	name = peopleReactView.Name,
	storyRoot = peopleReactView,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p2) --[[ line: 60 ]]
		-- upvalues: reactModule (ref), localizationProvider (ref), t_2 (ref), foundationProvider (ref), foundationModule (ref), t (ref), StyleLinkPortal (ref)
		return function(p3) --[[ line: 61 ]]
			-- upvalues: reactModule (copy), localizationProvider (copy), t_2 (copy), foundationProvider (copy), foundationModule (copy), t (copy), p2 (ref), StyleLinkPortal (copy)
			local var8 = reactModule.useRef(Instance.new("Frame"))
			
			if var8.current.Parent ~= p3.focus then
				var8.current.Parent = p3.focus
			end
			reactModule.useLayoutEffect(function() --[[ line: 67 ]]
				-- upvalues: var8 (ref)
				var8.current.Size = UDim2.fromScale(1, 1)
				var8.current.BackgroundTransparency = 1
			end, {})
			
			return reactModule.createElement(localizationProvider, { localization = t_2 }, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					theme = foundationModule.Enums.Theme.Dark,
					device = if p3 then t[p3.platform] else t.Default,
					overlayGui = var8.current
				}, {
					Child = reactModule.createElement(p2, p3),
					StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var8.current })
				})
			})
		end
	end
}