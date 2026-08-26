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
	Format = function(_, p1)
		-- upvalues: t_1 (ref)
		return t_1[p1] or p1
	end,
	changed = signal.new(),
	GetLocale = function()
		return "en-us"
	end
}

local function StyleLinkPortal(p1)
	-- upvalues: useStyleSheet (ref), reactRobloxModule (ref), reactModule (ref)
	return reactRobloxModule.createPortal(reactModule.createElement("StyleLink", { StyleSheet = useStyleSheet() }), p1.overlay)
end

return {
	name = peopleReactView.Name,
	storyRoot = peopleReactView,
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: reactModule (ref), localizationProvider (ref), t_2 (ref), foundationProvider (ref), foundationModule (ref), t (ref), StyleLinkPortal (ref)
		return function(p2)
			-- upvalues: reactModule (copy), localizationProvider (copy), t_2 (copy), foundationProvider (copy), foundationModule (copy), t (copy), p1 (ref), StyleLinkPortal (copy)
			local var1 = reactModule.useRef(Instance.new("Frame"))
			
			if var1.current.Parent ~= p2.focus then
				var1.current.Parent = p2.focus
			end
			reactModule.useLayoutEffect(function()
				-- upvalues: var1 (ref)
				var1.current.Size = UDim2.fromScale(1, 1)
				var1.current.BackgroundTransparency = 1
			end, {})
			
			return reactModule.createElement(localizationProvider, { localization = t_2 }, {
				FoundationProvider = reactModule.createElement(foundationProvider, {
					colorMode = foundationModule.Enums.ColorMode.Dark,
					device = if p2 then t[p2.platform] else "Desktop",
					overlayGui = var1.current
				}, {
					Child = reactModule.createElement(p1, p2),
					StyleLink = reactModule.createElement(StyleLinkPortal, { overlay = var1.current })
				})
			})
		end
	end
}