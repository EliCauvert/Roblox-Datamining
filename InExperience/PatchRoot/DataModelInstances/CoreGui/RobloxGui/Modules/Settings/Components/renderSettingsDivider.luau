local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local InExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local DividerOrientation = FoundationModule.Enums.DividerOrientation
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function DividerContainer() --[[ Line: 23 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Divider (copy), DividerOrientation (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			top = UDim.new(0, UseTokensResult.Padding.XSmall),
			bottom = UDim.new(0, UseTokensResult.Padding.Large)
		}
	}, {
		Divider = ReactModule.createElement(Divider, { orientation = DividerOrientation.Horizontal })
	})
end

return function(p1) --[[ Line: 39 | Named "renderSettingsDivider" ]]
	-- upvalues: CreateFunction (copy), SettingsShowSignal (copy), ReactRobloxModule (copy), ReactModule (copy), InExperienceMenuReactModule (copy), DividerContainer (copy)
	local v1 = CreateFunction("Frame")({
		Name = "DividerWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Parent = p1.parent
	})
	local Root = nil
	SettingsShowSignal:connect(function(p2) --[[ Line: 50 ]]
		-- upvalues: Root (ref), v1 (copy), p1 (copy), ReactRobloxModule (upval), ReactModule (upval), InExperienceMenuReactModule (upval), DividerContainer (upval)
		if p2 then
			v1.Parent = p1.parent
			Root = ReactRobloxModule.createRoot(v1)
			Root:render(ReactModule.createElement(InExperienceMenuReactModule, nil, {
				DividerContainer = ReactModule.createElement(DividerContainer)
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
end