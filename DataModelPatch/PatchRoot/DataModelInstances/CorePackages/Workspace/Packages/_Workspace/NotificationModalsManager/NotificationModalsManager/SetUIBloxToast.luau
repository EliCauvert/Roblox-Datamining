local Parent = script.Parent.Parent
local ReactRobloxModule = require(Parent.ReactRoblox)
local ReactModule = require(Parent.React)
local Toast = require(Parent.UIBlox).App.Dialog.Toast
local LocalizationService = game:GetService("LocalizationService")
local Localization = require(Parent.InExperienceLocales).Localization
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local StyleProviderWithDefaultTheme = require(Parent.Style).StyleProviderWithDefaultTheme
local Root = nil

local function v9(ToastContent)
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

return function(p1)
	-- upvalues: Root (ref), ReactRobloxModule (copy), ReactModule (copy), v9 (copy)
	if not Root then
		local UIBloxToast = Instance.new("Folder")
		UIBloxToast.Name = "UIBloxToast"
		UIBloxToast.Parent = game:GetService("CoreGui")
		Root = ReactRobloxModule.createRoot(UIBloxToast)
	end
	Root:render(ReactModule.createElement(v9, p1))
end