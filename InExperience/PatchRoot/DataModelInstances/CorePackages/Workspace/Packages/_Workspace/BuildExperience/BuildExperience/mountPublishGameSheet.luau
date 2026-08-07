local coreGuiService = game:GetService("CoreGui")
local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local roactUtilsModule = require(parent.RoactUtils)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local publishGameSheetModule = require(buildExperience.Components.PublishGameSheet.PublishGameSheet)
local getPublishGameSheetStoreModule = require(buildExperience.Stores.GetPublishGameSheetStore)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization

local function ConnectedPublishGameSheet() --[[ line: 21 ]]
	-- upvalues: getPublishGameSheetStoreModule (ref), reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationModule (ref), buildExperienceCompositionStyleSheetModule (ref), publishGameSheetModule (ref)
	local var14 = getPublishGameSheetStoreModule()
	
	return reactModule.createElement(localizationProvider, {
		localization = reactModule.useMemo(function() --[[ line: 24 ]]
			-- upvalues: localization (copy), localizationService (copy)
			return localization.new(localizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
			CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
			PublishGameSheet = reactModule.createElement(publishGameSheetModule, {
				isOpen = var14.useIsOpen(),
				onClose = reactModule.useCallback(function() --[[ line: 28 ]]
					-- upvalues: var14 (ref)
					var14.setIsOpen(false)
				end, { var14 })
			})
		})
	})
end

local var13 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 47 ]]
	-- upvalues: ConnectedPublishGameSheet (ref)
	return ConnectedPublishGameSheet
end)

return function() --[[ line: 51 | named "mountPublishGameSheet" ]]
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), var13 (ref)
	local buildExperiencePublishGameSheet = Instance.new("ScreenGui")
	buildExperiencePublishGameSheet.Name = "BuildExperiencePublishGameSheet"
	buildExperiencePublishGameSheet.IgnoreGuiInset = true
	buildExperiencePublishGameSheet.ResetOnSpawn = false
	buildExperiencePublishGameSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperiencePublishGameSheet.Parent = coreGuiService
	local var16 = reactRobloxModule.createRoot(buildExperiencePublishGameSheet)
	var16:render(reactModule.createElement(var13))
	
	return var16
end