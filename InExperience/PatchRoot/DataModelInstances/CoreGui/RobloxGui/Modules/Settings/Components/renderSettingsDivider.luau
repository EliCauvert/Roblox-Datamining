local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local coreScriptsCommonModule = require(corePackagesService.Workspace.Packages.CoreScriptsCommon)
local inExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local settingsShowSignal = coreScriptsCommonModule.SettingsShowSignal
local view = foundationModule.View
local divider = foundationModule.Divider
local dividerOrientation = foundationModule.Enums.DividerOrientation
local useTokens = foundationModule.Hooks.useTokens

local function DividerContainer() --[[ line: 23 ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), divider (ref), dividerOrientation (ref)
	local var7 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			top = UDim.new(0, var7.Padding.XSmall),
			bottom = UDim.new(0, var7.Padding.Large)
		}
	}, {
		Divider = reactModule.createElement(divider, { orientation = dividerOrientation.Horizontal })
	})
end

return function(value) --[[ line: 39 | named "renderSettingsDivider" ]]
	-- upvalues: create (ref), settingsShowSignal (ref), reactRobloxModule (ref), reactModule (ref), inExperienceMenuReactModule (ref), DividerContainer (ref)
	local var8 = create("Frame")({
		Name = "DividerWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder,
		Parent = value.parent
	})
	local var9 = nil
	settingsShowSignal:connect(function(p0) --[[ line: 50 ]]
		-- upvalues: var9 (write), var8 (ref), value (ref), reactRobloxModule (copy), reactModule (copy), inExperienceMenuReactModule (copy), DividerContainer (copy)
		if p0 then
			var8.Parent = value.parent
			var9 = reactRobloxModule.createRoot(var8)
			var9:render(reactModule.createElement(inExperienceMenuReactModule, nil, {
				DividerContainer = reactModule.createElement(DividerContainer)
			}))
			
			return
		elseif var9 then
			var9:unmount()
			var9 = nil
			var8.Parent = nil
		end
	end)
	
	return var8
end