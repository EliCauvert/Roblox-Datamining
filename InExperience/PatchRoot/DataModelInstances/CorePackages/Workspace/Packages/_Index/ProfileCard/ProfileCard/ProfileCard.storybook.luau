local LocalizationService = game:GetService("LocalizationService")
local ProfileCard = script:FindFirstAncestor("ProfileCard")
local Parent = ProfileCard.Parent
local FoundationModule = require(Parent.Foundation)
local LocalizationProvider = require(Parent.Localization).LocalizationProvider
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.Dev.ReactRoblox)
local Localization = require(Parent.Dev.RobloxAppLocales).Localization
local UIBloxModule = require(Parent.UIBlox)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
UIBloxModule.init(require(Parent.Dev.RobloxAppUIBloxConfig))
local AppFeaturePolicies = UniversalAppPolicyModule.AppFeaturePolicies
local AppStyleProvider = UIBloxModule.App.Style.AppStyleProvider
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local config = {
	Default = ColorMode.Dark,
	Dark = ColorMode.Dark,
	Light = ColorMode.Light
}

local function isControlEnabled(Controls, Segment): boolean
	if Controls == nil then
		return false
	end
	if Controls[Segment] == true then
		return true
	end
	for i, control in Controls do
		if type(i) == "string" and string.sub(i, 1, #Segment) == Segment and control == true then
			return true
		end
	end
	return false
end

return {
	name = "ProfileCard",
	roact = ReactModule,
	reactRoblox = ReactRobloxModule,
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), Localization (copy), LocalizationService (copy), config (copy), isControlEnabled (copy), LocalizationProvider (copy), RoactAppPolicy (copy), AppFeaturePolicies (copy), FoundationProvider (copy), Device (copy), AppStyleProvider (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), Localization (upval), LocalizationService (upval), config (upval), isControlEnabled (upval), LocalizationProvider (upval), RoactAppPolicy (upval), AppFeaturePolicies (upval), FoundationProvider (upval), Device (upval), AppStyleProvider (upval), p1 (copy)
			local UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: Localization (upval), LocalizationService (upval)
				return Localization.new(LocalizationService.RobloxLocaleId)
			end, {})
			local Entry = config[p2.theme] or config.Default
			local ShowUncheckedBadge = isControlEnabled(p2.controls, "showUncheckedBadge")
			
			return ReactModule.createElement(LocalizationProvider, { localization = UseMemoResult }, {
				Policy = ReactModule.createElement(RoactAppPolicy.Provider, {
					key = tostring(ShowUncheckedBadge),
					policy = { AppFeaturePolicies },
					policyData = { ShowUncheckedBadge = ShowUncheckedBadge }
				}, {
					Foundation = ReactModule.createElement(FoundationProvider, {
						colorMode = Entry,
						device = Device[p2.platform] or Device.Desktop,
						preferences = p2.settings,
						scale = p2.settings and p2.settings.scale
					}, {
						AppStyle = ReactModule.createElement(AppStyleProvider, { style = { fontName = "Gotham", themeName = Entry } }, { Story = ReactModule.createElement(p1, p2) })
					})
				})
			})
		end
	end,
	storyRoots = { ProfileCard }
}