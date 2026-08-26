local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local localizationModule = require(corePackagesService.Workspace.Packages.Localization)
local settingReactViewModule = require(corePackagesService.Workspace.Packages.SettingReactView)
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local inExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local useLocalization = localizationModule.Hooks.useLocalization
local headerText = settingReactViewModule.HeaderText
local settingsShowSignal = coreScriptsCommonModule.SettingsShowSignal
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function HeaderTextContainer(p1)
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), view (ref), headerText (ref)
	return reactModule.createElement(view, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			bottom = UDim.new(0, useTokens().Padding.Small)
		}
	}, {
		Text = reactModule.createElement(headerText, {
			text = useLocalization({ headerText = p1.text }).headerText
		})
	})
end

return function(value)
	-- upvalues: create (ref), settingsShowSignal (ref), reactRobloxModule (ref), reactModule (ref), inExperienceMenuReactModule (ref), HeaderTextContainer (ref)
	local var1 = create("Frame")({
		Name = "HeaderWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder,
		Parent = value.parent
	})
	local var2 = nil
	settingsShowSignal:connect(function(p1)
		-- upvalues: var2 (write), var1 (ref), value (ref), reactRobloxModule (copy), reactModule (copy), inExperienceMenuReactModule (copy), HeaderTextContainer (copy)
		if p1 then
			var1.Parent = value.parent
			var2 = reactRobloxModule.createRoot(var1)
			var2:render(reactModule.createElement(inExperienceMenuReactModule, nil, {
				HeaderTextContainer = reactModule.createElement(HeaderTextContainer, { text = value.headerText })
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