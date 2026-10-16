local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local InExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local Parent = InExperienceDetailsPrompt.Parent
local Provider = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.InExperienceLocales).Localization
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local ReactRobloxModule = require(Parent.ReactRoblox)
local InExperienceDetailsPromptAppModule = require(InExperienceDetailsPrompt.InExperienceDetailsPromptApp)
local FFlagLuaAppIedpOverlayAndNavigationFix = require(Parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local InExperienceDetailsPromptDisplayOrder = game:DefineFastInt("InExperienceDetailsPromptDisplayOrder", -1)

local function _() --[[ Line: 23 | Named "createFocusNavigationService" ]]
	-- upvalues: ReactFocusNavigationModule (copy)
	return ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
end

return function() --[[ Line: 27 | Named "renderInExperienceDetailsPrompt" ]]
	-- upvalues: FFlagLuaAppIedpOverlayAndNavigationFix (copy), CoreGui (copy), InExperienceDetailsPromptDisplayOrder (copy), ReactFocusNavigationModule (copy), ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), FoundationProvider (copy), FoundationModule (copy), Provider (copy), InExperienceDetailsPromptAppModule (copy), ReactRobloxModule (copy)
	local Folder = Instance.new("Folder")
	Folder.Name = if FFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptApp" else "InExperienceDetailsPrompt"
	Folder.Parent = CoreGui
	local InExperienceDetailsPromptOverlay = nil
	
	if FFlagLuaAppIedpOverlayAndNavigationFix then
		InExperienceDetailsPromptOverlay = Instance.new("ScreenGui")
		InExperienceDetailsPromptOverlay.Parent = Folder
		InExperienceDetailsPromptOverlay.Name = "InExperienceDetailsPromptOverlay"
		InExperienceDetailsPromptOverlay.DisplayOrder = InExperienceDetailsPromptDisplayOrder
		InExperienceDetailsPromptOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		InExperienceDetailsPromptOverlay.Enabled = true
		InExperienceDetailsPromptOverlay.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
		InExperienceDetailsPromptOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		InExperienceDetailsPromptOverlay.ClipToDeviceSafeArea = false
	end
	local Root = ReactRobloxModule.createRoot(if FFlagLuaAppIedpOverlayAndNavigationFix then InExperienceDetailsPromptOverlay else Folder)
	Root:render((ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		FoundationProvider = ReactModule.createElement(FoundationProvider, {
			colorMode = FoundationModule.Enums.ColorMode.Dark,
			overlayGui = if FFlagLuaAppIedpOverlayAndNavigationFix then InExperienceDetailsPromptOverlay else nil
		}, {
			FocusNavigationProvider = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, {
				value = ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui)
			}, {
				FocusNavigationRegistryProvider = ReactModule.createElement(Provider, nil, {
					InExperienceDetailsPromptApp = ReactModule.createElement(InExperienceDetailsPromptAppModule)
				})
			})
		})
	})))
	
	return Root
end