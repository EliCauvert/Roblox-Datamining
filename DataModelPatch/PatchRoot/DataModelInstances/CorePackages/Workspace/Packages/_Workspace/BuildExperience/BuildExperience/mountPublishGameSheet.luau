local CoreGui = game:GetService("CoreGui")
local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local PublishGameSheetModule = require(BuildExperience.Components.PublishGameSheet.PublishGameSheet)
local GetPublishGameSheetStoreModule = require(BuildExperience.Stores.GetPublishGameSheetStore)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local Localization = require(Parent.RobloxAppLocales).Localization

local function ConnectedPublishGameSheet()
	-- upvalues: GetPublishGameSheetStoreModule (copy), ReactModule (copy), Localization (copy), LocalizationService (copy), LocalizationProvider (copy), FoundationModule (copy), BuildExperienceCompositionStyleSheetModule (copy), PublishGameSheetModule (copy)
	local PublishGameSheetStoreModule = GetPublishGameSheetStoreModule()
	
	return ReactModule.createElement(LocalizationProvider, {
		localization = ReactModule.useMemo(function()
			-- upvalues: Localization (upval), LocalizationService (upval)
			return Localization.new(LocalizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = ReactModule.createElement(FoundationModule.FoundationProvider, { theme = FoundationModule.Enums.Theme.Dark }, {
			CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
			PublishGameSheet = ReactModule.createElement(PublishGameSheetModule, {
				isOpen = PublishGameSheetStoreModule.useIsOpen(),
				onClose = ReactModule.useCallback(function()
					-- upvalues: PublishGameSheetStoreModule (copy)
					PublishGameSheetStoreModule.setIsOpen(false)
				end, { PublishGameSheetStoreModule })
			})
		})
	})
end

local LazyComponent = require(Parent.RoactUtils).Components.createLazyComponent(function()
	-- upvalues: ConnectedPublishGameSheet (copy)
	return ConnectedPublishGameSheet
end)

return function()
	-- upvalues: CoreGui (copy), ReactRobloxModule (copy), ReactModule (copy), LazyComponent (copy)
	local BuildExperiencePublishGameSheet = Instance.new("ScreenGui")
	BuildExperiencePublishGameSheet.Name = "BuildExperiencePublishGameSheet"
	BuildExperiencePublishGameSheet.IgnoreGuiInset = true
	BuildExperiencePublishGameSheet.ResetOnSpawn = false
	BuildExperiencePublishGameSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BuildExperiencePublishGameSheet.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(BuildExperiencePublishGameSheet)
	Root:render(ReactModule.createElement(LazyComponent))
	
	return Root
end