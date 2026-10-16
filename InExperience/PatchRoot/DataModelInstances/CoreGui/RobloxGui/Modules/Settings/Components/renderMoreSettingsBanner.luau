local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local InExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local MoreSettingsBannerModule = require(script.Parent.MoreSettingsBanner)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local IsPioneerLaunch = require(CorePackages.Workspace.Packages.PioneerUtils).isPioneerLaunch
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal

return function(p1) --[[ Line: 21 | Named "renderMoreSettingsBanner" ]]
	-- upvalues: IsPioneerLaunch (copy), CreateFunction (copy), SettingsShowSignal (copy), ReactRobloxModule (copy), ReactModule (copy), InExperienceMenuReactModule (copy), MoreSettingsBannerModule (copy)
	if (p1.isPioneerLaunch or IsPioneerLaunch)() then
		local v1 = CreateFunction("Frame")({
			Name = "MoreSettingsBannerWrapper",
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = p1.layoutOrder,
			Parent = p1.parent
		})
		local Root = nil
		SettingsShowSignal:connect(function(p2) --[[ Line: 37 ]]
			-- upvalues: Root (ref), v1 (copy), p1 (copy), ReactRobloxModule (upval), ReactModule (upval), InExperienceMenuReactModule (upval), MoreSettingsBannerModule (upval)
			if p2 then
				v1.Parent = p1.parent
				Root = ReactRobloxModule.createRoot(v1)
				Root:render(ReactModule.createElement(InExperienceMenuReactModule, nil, {
					MoreSettingsBanner = ReactModule.createElement(MoreSettingsBannerModule)
				}))
				
				return
			end
			if Root then
				Root:unmount()
				Root = nil
				v1.Parent = nil
			end
		end)
		
		return v1
	else
		return nil
	end
end