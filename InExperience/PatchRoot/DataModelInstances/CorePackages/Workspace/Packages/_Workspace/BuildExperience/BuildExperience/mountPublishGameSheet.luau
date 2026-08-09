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
local publishGameSheetModule = require(buildExperience.Components.PublishGameSheet.PublishGameSheet)
local getPublishGameSheetStoreModule = require(buildExperience.Stores.GetPublishGameSheetStore)
local localizationProvider = localizationModule.LocalizationProvider
local localization = robloxAppLocalesModule.Localization

local function ConnectedPublishGameSheet() --[[ line: 20 ]]
	-- upvalues: getPublishGameSheetStoreModule (ref), reactModule (ref), localization (ref), localizationService (ref), localizationProvider (ref), foundationModule (ref), publishGameSheetModule (ref)
	local var13 = getPublishGameSheetStoreModule()
	
	return reactModule.createElement(localizationProvider, {
		localization = reactModule.useMemo(function() --[[ line: 23 ]]
			-- upvalues: localization (copy), localizationService (copy)
			return localization.new(localizationService.RobloxLocaleId)
		end, {})
	}, {
		FoundationProvider = reactModule.createElement(foundationModule.FoundationProvider, { theme = foundationModule.Enums.Theme.Dark }, {
			PublishGameSheet = reactModule.createElement(publishGameSheetModule, {
				isOpen = var13.useIsOpen(),
				onClose = reactModule.useCallback(function() --[[ line: 27 ]]
					-- upvalues: var13 (ref)
					var13.setIsOpen(false)
				end, { var13 })
			})
		})
	})
end

local var12 = roactUtilsModule.Components.createLazyComponent(function() --[[ line: 45 ]]
	-- upvalues: ConnectedPublishGameSheet (ref)
	return ConnectedPublishGameSheet
end)

return function() --[[ line: 49 | named "mountPublishGameSheet" ]]
	-- upvalues: coreGuiService (ref), reactRobloxModule (ref), reactModule (ref), var12 (ref)
	local buildExperiencePublishGameSheet = Instance.new("ScreenGui")
	buildExperiencePublishGameSheet.Name = "BuildExperiencePublishGameSheet"
	buildExperiencePublishGameSheet.IgnoreGuiInset = true
	buildExperiencePublishGameSheet.ResetOnSpawn = false
	buildExperiencePublishGameSheet.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	buildExperiencePublishGameSheet.Parent = coreGuiService
	local var15 = reactRobloxModule.createRoot(buildExperiencePublishGameSheet)
	var15:render(reactModule.createElement(var12))
	
	return var15
end