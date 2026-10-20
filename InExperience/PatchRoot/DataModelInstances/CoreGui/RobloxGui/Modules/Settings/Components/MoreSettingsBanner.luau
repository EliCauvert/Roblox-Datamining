local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local ShouldShowMoreSettingsBannerModule = require(script.Parent.Parent.shouldShowMoreSettingsBanner)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), ShouldShowMoreSettingsBannerModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), Text (copy)
	local IsPioneerLaunch = p1.isPioneerLaunch
	local GetAvailability = p1.getAvailability
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		text = "CoreScripts.InGameMenu.GameSettings.MoreSettingsAvailable"
	})
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function()
		-- upvalues: ShouldShowMoreSettingsBannerModule (upval), IsPioneerLaunch (copy), GetAvailability (copy), UseStateResult2 (copy)
		local Flag = false
		task.spawn(function()
			-- upvalues: ShouldShowMoreSettingsBannerModule (upval), IsPioneerLaunch (upval), GetAvailability (upval), Flag (ref), UseStateResult2 (upval)
			local ShouldShowMoreSettingsBannerModule1 = ShouldShowMoreSettingsBannerModule(IsPioneerLaunch, GetAvailability)
			
			if not Flag and ShouldShowMoreSettingsBannerModule1 then
				UseStateResult2(true)
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { IsPioneerLaunch, GetAvailability })
	
	return if UseStateResult and UseLocalizationResult.text ~= "" then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		padding = {
			left = UDim.new(0, 10),
			right = UDim.new(0, 10),
			bottom = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		Banner = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
			testId = "MoreSettingsBanner"
		}, {
			Icon = ReactModule.createElement(Icon, {
				LayoutOrder = 1,
				name = IconName.CircleI,
				size = IconSize.Small
			}),
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-default",
				testId = "MoreSettingsAvailableText",
				Text = UseLocalizationResult.text
			})
		})
	}) else nil
end