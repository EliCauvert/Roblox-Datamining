local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local inExperienceDetailsPrompt = script:FindFirstAncestor("InExperienceDetailsPrompt")
local parent = inExperienceDetailsPrompt.Parent
local provider = require(parent.FocusNavigationUtils).FocusNavigableSurfaceRegistry.Provider
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local localizationProvider = require(parent.Localization).LocalizationProvider
local localization = require(parent.InExperienceLocales).Localization
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local reactRobloxModule = require(parent.ReactRoblox)
local inExperienceDetailsPromptAppModule = require(inExperienceDetailsPrompt.InExperienceDetailsPromptApp)
local fFlagLuaAppIedpOverlayAndNavigationFix = require(parent.SharedFlags).FFlagLuaAppIedpOverlayAndNavigationFix
local inExperienceDetailsPromptDisplayOrder = game:DefineFastInt("InExperienceDetailsPromptDisplayOrder", -1)

local function _() --[[ line: 23 | named "createFocusNavigationService" ]]
	-- upvalues: reactFocusNavigationModule (ref)
	return reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
end

return function() --[[ line: 27 | named "renderInExperienceDetailsPrompt" ]]
	-- upvalues: fFlagLuaAppIedpOverlayAndNavigationFix (ref), coreGuiService (ref), inExperienceDetailsPromptDisplayOrder (ref), reactFocusNavigationModule (ref), reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), foundationProvider (ref), foundationModule (ref), provider (ref), inExperienceDetailsPromptAppModule (ref), reactRobloxModule (ref)
	local folder = Instance.new("Folder")
	folder.Name = if fFlagLuaAppIedpOverlayAndNavigationFix then "InExperienceDetailsPromptApp" else "InExperienceDetailsPrompt"
	folder.Parent = coreGuiService
	local inExperienceDetailsPromptOverlay = nil
	
	if fFlagLuaAppIedpOverlayAndNavigationFix then
		inExperienceDetailsPromptOverlay = Instance.new("ScreenGui")
		inExperienceDetailsPromptOverlay.Parent = folder
		inExperienceDetailsPromptOverlay.Name = "InExperienceDetailsPromptOverlay"
		inExperienceDetailsPromptOverlay.DisplayOrder = inExperienceDetailsPromptDisplayOrder
		inExperienceDetailsPromptOverlay.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		inExperienceDetailsPromptOverlay.Enabled = true
		inExperienceDetailsPromptOverlay.ScreenInsets = Enum.ScreenInsets.CoreUISafeInsets
		inExperienceDetailsPromptOverlay.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
		inExperienceDetailsPromptOverlay.ClipToDeviceSafeArea = false
	end
	local var11 = reactRobloxModule.createRoot(if fFlagLuaAppIedpOverlayAndNavigationFix then inExperienceDetailsPromptOverlay else folder)
	var11:render(reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		FoundationProvider = reactModule.createElement(foundationProvider, {
			theme = foundationModule.Enums.Theme.Dark,
			overlayGui = if fFlagLuaAppIedpOverlayAndNavigationFix then inExperienceDetailsPromptOverlay else nil
		}, {
			FocusNavigationProvider = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, {
				value = reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
			}, {
				FocusNavigationRegistryProvider = reactModule.createElement(provider, nil, {
					InExperienceDetailsPromptApp = reactModule.createElement(inExperienceDetailsPromptAppModule)
				})
			})
		})
	}))
	
	return var11
end