local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local inExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local moreSettingsBannerModule = require(script.Parent.MoreSettingsBanner)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local isPioneerLaunch = require(corePackagesService.Workspace.Packages.PioneerUtils).isPioneerLaunch
local settingsShowSignal = coreScriptsCommonModule.SettingsShowSignal

return function(value)
	-- upvalues: isPioneerLaunch (ref), create (ref), settingsShowSignal (ref), reactRobloxModule (ref), reactModule (ref), inExperienceMenuReactModule (ref), moreSettingsBannerModule (ref)
	if (value.isPioneerLaunch or isPioneerLaunch)() then
		local var1 = create("Frame")({
			Name = "MoreSettingsBannerWrapper",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = value.layoutOrder,
			Parent = value.parent
		})
		local var2 = nil
		settingsShowSignal:connect(function(p1)
			-- upvalues: var2 (write), var1 (ref), value (ref), reactRobloxModule (copy), reactModule (copy), inExperienceMenuReactModule (copy), moreSettingsBannerModule (copy)
			if p1 then
				var1.Parent = value.parent
				var2 = reactRobloxModule.createRoot(var1)
				var2:render(reactModule.createElement(inExperienceMenuReactModule, nil, {
					MoreSettingsBanner = reactModule.createElement(moreSettingsBannerModule)
				}))
				
				return
			elseif var2 then
				var2:unmount()
				var2 = nil
				var1.Parent = nil
			end
		end)
		
		return var1
	end
	return nil
end