local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local FoundationProvider = FoundationModule.FoundationProvider
local UseStyleSheetFunction = FoundationModule.Hooks.useStyleSheet
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
	["CoreScripts.InGameMenu.GameSettings.Volume"] = "Volume",
	["Feature.SettingsHub.Label.VoiceChat"] = "Voice chat",
	["CoreScripts.InGameMenu.VoiceChatVolumeLower"] = "Voice chat volume",
	["Feature.SettingsHub.Prompt.BuyWhatTheyreWearing"] = "Buy what they’re wearing\t",
	["Feature.SettingsHub.Description.SelectAvatarToCheckoutItems"] = "Select an avatar to check out their items.",
	["Feature.SettingsHub.Description.SelectUsernameToViewProfile"] = "View profiles by selecting a username.",
	["Feature.SettingsHub.Action.Ok"] = "Ok"
}
local Localization = {
	Format = function(_, p1) --[[ Line: 40 ]]
		-- upvalues: config1 (copy)
		return config1[p1] or p1
	end,
	changed = require(Parent.AppCommonLib).Signal.new(),
	GetLocale = function(): string --[[ Line: 44 ]]
		return "en-us"
	end
}

local function StyleLinkPortal(p1) --[[ Line: 49 ]]
	-- upvalues: UseStyleSheetFunction (copy), ReactRobloxModule (copy), ReactModule (copy)
	return ReactRobloxModule.createPortal(ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetFunction() }), p1.overlay)
end

return {
	name = PeopleReactView.Name,
	storyRoot = PeopleReactView,
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1) --[[ Line: 60 ]]
		-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), FoundationProvider (copy), FoundationModule (copy), config (copy), StyleLinkPortal (copy)
		return function(p2) --[[ Line: 61 ]]
			-- upvalues: ReactModule (upval), LocalizationProvider (upval), Localization (upval), FoundationProvider (upval), FoundationModule (upval), config (upval), p1 (copy), StyleLinkPortal (upval)
			local UseRefResult = ReactModule.useRef(Instance.new("Frame"))
			
			if UseRefResult.current.Parent ~= p2.focus then
				UseRefResult.current.Parent = p2.focus
			end
			ReactModule.useLayoutEffect(function() --[[ Line: 67 ]]
				-- upvalues: UseRefResult (copy)
				UseRefResult.current.Size = UDim2.fromScale(1, 1)
				UseRefResult.current.BackgroundTransparency = 1
			end, {})
			
			return ReactModule.createElement(LocalizationProvider, { localization = Localization }, {
				FoundationProvider = ReactModule.createElement(FoundationProvider, {
					colorMode = FoundationModule.Enums.ColorMode.Dark,
					device = p2 and config[p2.platform] or "Desktop",
					overlayGui = UseRefResult.current
				}, {
					Child = ReactModule.createElement(p1, p2),
					StyleLink = ReactModule.createElement(StyleLinkPortal, { overlay = UseRefResult.current })
				})
			})
		end
	end
}