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

local function HeaderTextContainer(p0) --[[ line: 26 ]]
	-- upvalues: useLocalization (ref), useTokens (ref), reactModule (ref), view (ref), headerText (ref)
	return reactModule.createElement(view, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			bottom = UDim.new(0, useTokens().Padding.Small)
		}
	}, {
		Text = reactModule.createElement(headerText, {
			text = useLocalization({ headerText = p0.text }).headerText
		})
	})
end

return function(value) --[[ line: 44 | named "renderSettingsHeader" ]]
	-- upvalues: create (ref), settingsShowSignal (ref), reactRobloxModule (ref), reactModule (ref), inExperienceMenuReactModule (ref), HeaderTextContainer (ref)
	local var9 = create("Frame")({
		Name = "HeaderWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder,
		Parent = value.parent
	})
	local var10 = nil
	settingsShowSignal:connect(function(p1) --[[ line: 55 ]]
		-- upvalues: var10 (write), var9 (ref), value (ref), reactRobloxModule (copy), reactModule (copy), inExperienceMenuReactModule (copy), HeaderTextContainer (copy)
		if p1 then
			var9.Parent = value.parent
			var10 = reactRobloxModule.createRoot(var9)
			var10:render(reactModule.createElement(inExperienceMenuReactModule, nil, {
				HeaderTextContainer = reactModule.createElement(HeaderTextContainer, { text = value.headerText })
			}))
			
			return
		elseif var10 then
			var10:unmount()
			var10 = nil
			var9.Parent = nil
		end
	end)
	
	return var9
end