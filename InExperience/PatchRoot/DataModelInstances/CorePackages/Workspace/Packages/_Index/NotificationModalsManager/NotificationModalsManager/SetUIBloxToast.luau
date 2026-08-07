local parent = script.Parent.Parent
local reactRobloxModule = require(parent.ReactRoblox)
local reactModule = require(parent.React)
local toast = require(parent.UIBlox).App.Dialog.Toast
local localizationService = game:GetService("LocalizationService")
local localization = require(parent.InExperienceLocales).Localization
local localizationProvider = require(parent.Localization).LocalizationProvider
local styleProviderWithDefaultTheme = require(parent.Style).StyleProviderWithDefaultTheme
local var3 = nil

local var4 = function(p0) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), localizationProvider (ref), localization (ref), localizationService (ref), styleProviderWithDefaultTheme (ref), toast (ref)
	return reactModule.createElement(localizationProvider, {
		localization = localization.new(localizationService.RobloxLocaleId)
	}, {
		StyleProvider = reactModule.createElement(styleProviderWithDefaultTheme, {}, {
			ToastWrapper = reactModule.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ResetOnSpawn = false,
				DisplayOrder = 12,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Toast = reactModule.createElement(toast, { duration = 3, toastContent = p0 })
			})
		})
	})
end

return function(p1) --[[ line: 37 ]]
	-- upvalues: var3 (write), reactRobloxModule (ref), reactModule (ref), var4 (ref)
	if not var3 then
		local UIBloxToast = Instance.new("Folder")
		UIBloxToast.Name = "UIBloxToast"
		UIBloxToast.Parent = game:GetService("CoreGui")
		var3 = reactRobloxModule.createRoot(UIBloxToast)
	end
	var3:render(reactModule.createElement(var4, p1))
end