local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local Parent = script:FindFirstAncestor("InExperienceOverlay").Parent
local CoreGuiCommonModule = require(Parent.CoreGuiCommon)
local FoundationModule = require(Parent.Foundation)
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SongbirdModule = require(Parent.Songbird)
local Components = CoreGuiCommonModule.Components
local View = FoundationModule.View
local FFlagEnableUISelector = CoreGuiCommonModule.Flags.FFlagEnableUISelector

return function()
	-- upvalues: CoreGui (copy), ReactModule (copy), FoundationModule (copy), LocalizationModule (copy), Localization (copy), LocalizationService (copy), View (copy), Components (copy), FFlagEnableUISelector (copy), SongbirdModule (copy), ReactRobloxModule (copy)
	local InExperienceOverlay = Instance.new("ScreenGui")
	InExperienceOverlay.Name = "InExperienceOverlay"
	InExperienceOverlay.DisplayOrder = 6
	InExperienceOverlay.IgnoreGuiInset = true
	InExperienceOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	InExperienceOverlay.ClipToDeviceSafeArea = false
	InExperienceOverlay.ScreenInsets = Enum.ScreenInsets.None
	InExperienceOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	InExperienceOverlay.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(InExperienceOverlay)
	Root:render((ReactModule.createElement(FoundationModule.FoundationProvider, { colorMode = FoundationModule.Enums.ColorMode.Dark }, {
		LocalizationProvider = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
			localization = Localization.new(LocalizationService.RobloxLocaleId)
		}, {
			Popups = ReactModule.createElement(View, { tag = "size-full" }, {
				HeadsetDisconnectDialog = ReactModule.createElement(Components.HeadsetDisconnectDialog),
				HurtOverlay = ReactModule.createElement(Components.HurtOverlay),
				InExperienceUiSelector = if FFlagEnableUISelector then ReactModule.createElement(Components.InExperienceUiSelector) else nil
			}),
			Binders = ReactModule.createElement(ReactModule.Fragment, {}, {
				SongbirdDebugAudio = ReactModule.createElement(SongbirdModule.DebugAudioEmitters)
			})
		})
	})))
	
	return Root
end