local Parent = script.Parent.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local FFlagKeepSideSheetOpenBesideMenuModule = require(Parent.SharedFlags.FFlagKeepSideSheetOpenBesideMenu)
local Toast = require(Parent.UIBlox).App.Dialog.Toast
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local Root = nil

local function v10(ToastContent)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), Toast (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
			ToastWrapper = ReactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
				DisplayOrder = 12,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Toast = ReactModule.createElement(Toast, { duration = 3, toastContent = ToastContent })
			})
		})
	})
end

local function v11(p1)
	-- upvalues: ReactModule (copy), LocalizationProvider (copy), Localization (copy), LocalizationService (copy), StyleProviderWithDefaultTheme (copy), Toast (copy)
	return ReactModule.createElement(LocalizationProvider, {
		localization = Localization.new(LocalizationService.RobloxLocaleId)
	}, {
		StyleProvider = ReactModule.createElement(StyleProviderWithDefaultTheme, {}, {
			ToastWrapper = ReactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = p1.displayOrder or 12
			}, {
				Toast = ReactModule.createElement(Toast, { duration = 3, toastContent = p1.toastContent })
			})
		})
	})
end

return function(ToastContent, DisplayOrder)
	-- upvalues: Root (ref), ReactRobloxModule (copy), FFlagKeepSideSheetOpenBesideMenuModule (copy), ReactModule (copy), v11 (copy), v10 (copy)
	if not Root then
		local UIBloxToast = Instance.new("Folder")
		UIBloxToast.Name = "UIBloxToast"
		UIBloxToast.Parent = game:GetService("CoreGui")
		Root = ReactRobloxModule.createRoot(UIBloxToast)
	end
	if FFlagKeepSideSheetOpenBesideMenuModule then
		Root:render(ReactModule.createElement(v11, { toastContent = ToastContent, displayOrder = DisplayOrder }))
		
		return
	else
		Root:render(ReactModule.createElement(v10, ToastContent))
	end
end