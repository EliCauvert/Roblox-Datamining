local localizationService = game:GetService("LocalizationService")
local profileCard = script:FindFirstAncestor("ProfileCard")
local parent = profileCard.Parent
local foundationModule = require(parent.Foundation)
local localizationProvider = require(parent.Localization).LocalizationProvider
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local localization = require(parent.Dev.RobloxAppLocales).Localization
local UIBloxModule = require(parent.UIBlox)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
UIBloxModule.init(require(parent.Dev.RobloxAppUIBloxConfig))
local appFeaturePolicies = universalAppPolicyModule.AppFeaturePolicies
local appStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local roactAppPolicy = universalAppPolicyModule.RoactAppPolicy
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local foundationProvider = foundationModule.FoundationProvider
local t = {
	Default = colorMode.Dark,
	Dark = colorMode.Dark,
	Light = colorMode.Light
}

local function isControlEnabled(p1, p2)
	if p1 == nil then
		return false
	elseif p1[p2] == true then
		return true
	end
	for i, v in p1 do
		if type(i) == "string" and string.sub(i, 1, #p2) == p2 and v == true then
			return true
		end
	end
	return false
end

return {
	name = "ProfileCard",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p3)
		-- upvalues: reactModule (ref), localization (ref), localizationService (ref), t (ref), isControlEnabled (ref), localizationProvider (ref), roactAppPolicy (ref), appFeaturePolicies (ref), foundationProvider (ref), device (ref), appStyleProvider (ref)
		return function(p4)
			-- upvalues: reactModule (copy), localization (copy), localizationService (copy), t (copy), isControlEnabled (copy), localizationProvider (copy), roactAppPolicy (copy), appFeaturePolicies (copy), foundationProvider (copy), device (copy), appStyleProvider (copy), p3 (ref)
			local var1 = reactModule.useMemo(function()
				-- upvalues: localization (copy), localizationService (copy)
				return localization.new(localizationService.RobloxLocaleId)
			end, {})
			local theme = t[p4.theme] or t.Default
			local var2 = isControlEnabled(p4.controls, "showUncheckedBadge")
			
			return reactModule.createElement(localizationProvider, { localization = var1 }, {
				Policy = reactModule.createElement(roactAppPolicy.Provider, {
					key = tostring(var2),
					policy = { appFeaturePolicies },
					policyData = { ShowUncheckedBadge = var2 }
				}, {
					Foundation = reactModule.createElement(foundationProvider, {
						colorMode = theme,
						device = device[p4.platform] or device.Desktop,
						preferences = p4.settings,
						scale = p4.settings and p4.settings.scale
					}, {
						AppStyle = reactModule.createElement(appStyleProvider, { style = { fontName = "Gotham", themeName = theme } }, { Story = reactModule.createElement(p3, p4) })
					})
				})
			})
		end
	end,
	storyRoots = { profileCard }
}