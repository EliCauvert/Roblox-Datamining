local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("InExperienceOverlay").Parent
local coreGuiCommonModule = require(parent.CoreGuiCommon)
local foundationModule = require(parent.Foundation)
local localization = require(parent.InExperienceLocales).Localization
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local songbirdModule = require(parent.Songbird)
local components = coreGuiCommonModule.Components
local view = foundationModule.View
local fFlagEnableUISelector = coreGuiCommonModule.Flags.FFlagEnableUISelector

return function()
	-- upvalues: coreGuiService (ref), reactModule (ref), foundationModule (ref), localizationModule (ref), localization (ref), localizationService (ref), view (ref), components (ref), fFlagEnableUISelector (ref), songbirdModule (ref), reactRobloxModule (ref)
	local inExperienceOverlay = Instance.new("ScreenGui")
	inExperienceOverlay.Name = "InExperienceOverlay"
	inExperienceOverlay.DisplayOrder = 6
	inExperienceOverlay.IgnoreGuiInset = true
	inExperienceOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	inExperienceOverlay.ClipToDeviceSafeArea = false
	inExperienceOverlay.ScreenInsets = Enum.ScreenInsets.None
	inExperienceOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	inExperienceOverlay.Parent = coreGuiService
	local var1 = reactRobloxModule.createRoot(inExperienceOverlay)
	var1:render(reactModule.createElement(foundationModule.FoundationProvider, { colorMode = foundationModule.Enums.ColorMode.Dark }, {
		LocalizationProvider = reactModule.createElement(localizationModule.LocalizationProvider, {
			localization = localization.new(localizationService.RobloxLocaleId)
		}, {
			Popups = reactModule.createElement(view, { tag = "size-full" }, {
				HeadsetDisconnectDialog = reactModule.createElement(components.HeadsetDisconnectDialog),
				HurtOverlay = reactModule.createElement(components.HurtOverlay),
				InExperienceUiSelector = if fFlagEnableUISelector then reactModule.createElement(components.InExperienceUiSelector) else nil
			}),
			Binders = reactModule.createElement(reactModule.Fragment, {}, {
				SongbirdDebugAudio = reactModule.createElement(songbirdModule.DebugAudioEmitters)
			})
		})
	}))
	
	return var1
end