local LocalizationService = game:GetService("LocalizationService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local RobloxAppLocalesModule = require(Parent.RobloxAppLocales)
local BuildExperienceCompositionStyleSheetModule = require(BuildExperience.Components.BuildExperienceCompositionStyleSheet)
local LibraryBrowserViewModule = require(script.Parent.LibraryBrowser.LibraryBrowserView)
local LibraryExperienceViewModule = require(script.Parent.LibraryExperienceView)
local LibraryThemeProviderModule = require(script.Parent.LibraryThemeProvider)
local UseLibraryStringsModule = require(script.Parent.useLibraryStrings)

local function noop() end

local function LibraryPregameContent(p1)
	-- upvalues: UseLibraryStringsModule (copy), noop (copy), ReactModule (copy), LibraryExperienceViewModule (copy), LibraryBrowserViewModule (copy)
	local UseLibraryStringsModuleResult = UseLibraryStringsModule()
	
	return ReactModule.createElement(LibraryExperienceViewModule, {
		isOpen = true,
		assetLabel = UseLibraryStringsModuleResult.title,
		worldLabel = UseLibraryStringsModuleResult.world,
		title = UseLibraryStringsModuleResult.title,
		searchPlaceholder = UseLibraryStringsModuleResult.searchPlaceholder,
		onShowLibrary = noop,
		onShowWorld = noop,
		onLeave = p1.onCancel
	}, {
		Browser = ReactModule.createElement(LibraryBrowserViewModule, {
			status = "Loading",
			categories = {},
			strings = UseLibraryStringsModuleResult,
			worldCutout = {
				title = UseLibraryStringsModuleResult.world,
				onActivated = noop,
				onRectChanged = noop
			}
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), RobloxAppLocalesModule (copy), LocalizationService (copy), LocalizationModule (copy), LibraryThemeProviderModule (copy), BuildExperienceCompositionStyleSheetModule (copy), LibraryPregameContent (copy)
	return ReactModule.createElement("ScreenGui", {
		ResetOnSpawn = false,
		ClipToDeviceSafeArea = false,
		DisplayOrder = p1.displayOrder,
		ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Localization = ReactModule.createElement(LocalizationModule.LocalizationProvider, {
			localization = ReactModule.useMemo(function()
				-- upvalues: RobloxAppLocalesModule (upval), LocalizationService (upval)
				return RobloxAppLocalesModule.Localization.new(LocalizationService.RobloxLocaleId)
			end, {})
		}, {
			Theme = ReactModule.createElement(LibraryThemeProviderModule, { displayOrder = p1.displayOrder }, {
				CompositionStyleSheet = ReactModule.createElement(BuildExperienceCompositionStyleSheetModule),
				Content = ReactModule.createElement(LibraryPregameContent, p1)
			})
		})
	})
end