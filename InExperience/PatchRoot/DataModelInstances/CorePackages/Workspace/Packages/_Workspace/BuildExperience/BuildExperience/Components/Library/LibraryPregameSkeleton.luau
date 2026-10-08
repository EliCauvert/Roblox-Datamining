local localizationService = game:GetService("LocalizationService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local robloxAppLocalesModule = require(parent.RobloxAppLocales)
local buildExperienceCompositionStyleSheetModule = require(buildExperience.Components.BuildExperienceCompositionStyleSheet)
local libraryBrowserViewModule = require(script.Parent.LibraryBrowser.LibraryBrowserView)
local libraryExperienceViewModule = require(script.Parent.LibraryExperienceView)
local libraryThemeProviderModule = require(script.Parent.LibraryThemeProvider)
local useLibraryStringsModule = require(script.Parent.useLibraryStrings)

local function noop() end

local function LibraryPregameContent(p1)
	-- upvalues: useLibraryStringsModule (ref), noop (ref), reactModule (ref), libraryExperienceViewModule (ref), libraryBrowserViewModule (ref)
	local var1 = useLibraryStringsModule()
	
	return reactModule.createElement(libraryExperienceViewModule, {
		isOpen = true,
		assetLabel = var1.title,
		worldLabel = var1.world,
		title = var1.title,
		searchPlaceholder = var1.searchPlaceholder,
		onShowLibrary = noop,
		onShowWorld = noop,
		onLeave = p1.onCancel
	}, {
		Browser = reactModule.createElement(libraryBrowserViewModule, {
			status = "Loading",
			categories = {},
			strings = var1,
			worldCutout = {
				title = var1.world,
				onActivated = noop,
				onRectChanged = noop
			}
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), robloxAppLocalesModule (ref), localizationService (ref), localizationModule (ref), libraryThemeProviderModule (ref), buildExperienceCompositionStyleSheetModule (ref), LibraryPregameContent (ref)
	return reactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		ClipToDeviceSafeArea = false,
		DisplayOrder = p1.displayOrder,
		ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Localization = reactModule.createElement(localizationModule.LocalizationProvider, {
			localization = reactModule.useMemo(function()
				-- upvalues: robloxAppLocalesModule (copy), localizationService (copy)
				return robloxAppLocalesModule.Localization.new(localizationService.RobloxLocaleId)
			end, {})
		}, {
			Theme = reactModule.createElement(libraryThemeProviderModule, { displayOrder = p1.displayOrder }, {
				CompositionStyleSheet = reactModule.createElement(buildExperienceCompositionStyleSheetModule),
				Content = reactModule.createElement(LibraryPregameContent, p1)
			})
		})
	})
end