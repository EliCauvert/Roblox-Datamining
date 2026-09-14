local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local foundationModule = require(corePackagesService.Packages.Foundation)
local shouldShowMoreSettingsBannerModule = require(script.Parent.Parent.shouldShowMoreSettingsBanner)
local useLocalization = require(corePackagesService.Workspace.Packages.Localization).Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local text = foundationModule.Text
local view = foundationModule.View

return function(value)
	-- upvalues: reactModule (ref), useLocalization (ref), useTokens (ref), shouldShowMoreSettingsBannerModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), text (ref)
	local isPioneerLaunch = value.isPioneerLaunch
	local getAvailability = value.getAvailability
	local var1, var2 = reactModule.useState(false)
	local var3 = useLocalization({
		text = "CoreScripts.InGameMenu.GameSettings.MoreSettingsAvailable"
	})
	local var4 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: shouldShowMoreSettingsBannerModule (copy), isPioneerLaunch (ref), getAvailability (ref), var2 (ref)
		local var5 = false
		task.spawn(function()
			-- upvalues: shouldShowMoreSettingsBannerModule (copy), isPioneerLaunch (copy), getAvailability (copy), var5 (write), var2 (copy)
			if not var5 and shouldShowMoreSettingsBannerModule(isPioneerLaunch, getAvailability) then
				var2(true)
			end
		end)
		
		return function()
			-- upvalues: var5 (write)
			var5 = true
		end
	end, { isPioneerLaunch, getAvailability })
	
	return if var1 and var3.text ~= "" then reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		padding = {
			left = UDim.new(0, 10),
			right = UDim.new(0, 10),
			bottom = UDim.new(0, var4.Padding.Large)
		}
	}, {
		Banner = reactModule.createElement(view, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-medium stroke-standard stroke-default radius-medium",
			testId = "MoreSettingsBanner"
		}, {
			Icon = reactModule.createElement(icon, {
				LayoutOrder = 1,
				name = iconName.CircleI,
				size = iconSize.Small
			}),
			Label = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill auto-y text-body-medium text-wrap text-align-x-left content-default",
				testId = "MoreSettingsAvailableText",
				Text = var3.text
			})
		})
	}) else nil
end