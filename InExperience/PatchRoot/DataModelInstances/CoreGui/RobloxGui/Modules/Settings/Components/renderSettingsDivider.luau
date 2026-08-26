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

local function DividerContainer()
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), divider (ref), dividerOrientation (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			top = UDim.new(0, var1.Padding.XSmall),
			bottom = UDim.new(0, var1.Padding.Large)
		}
	}, {
		Divider = reactModule.createElement(divider, { orientation = dividerOrientation.Horizontal })
	})
end

return function(value)
	-- upvalues: create (ref), settingsShowSignal (ref), reactRobloxModule (ref), reactModule (ref), inExperienceMenuReactModule (ref), DividerContainer (ref)
	local var1 = create("Frame")({
		Name = "DividerWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = value.layoutOrder,
		Parent = value.parent
	})
	local var2 = nil
	settingsShowSignal:connect(function(p1)
		-- upvalues: var2 (write), var1 (ref), value (ref), reactRobloxModule (copy), reactModule (copy), inExperienceMenuReactModule (copy), DividerContainer (copy)
		if p1 then
			var1.Parent = value.parent
			var2 = reactRobloxModule.createRoot(var1)
			var2:render(reactModule.createElement(inExperienceMenuReactModule, nil, {
				DividerContainer = reactModule.createElement(DividerContainer)
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