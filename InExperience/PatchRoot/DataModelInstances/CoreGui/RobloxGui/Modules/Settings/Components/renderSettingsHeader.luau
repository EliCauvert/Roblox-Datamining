local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local InExperienceMenuReactModule = require(script.Parent.Parent.InExperienceMenuReact)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local HeaderText = require(CorePackages.Workspace.Packages.SettingReactView).HeaderText
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function HeaderTextContainer(p1) --[[ Line: 26 ]]
	-- upvalues: UseLocalizationFunction (copy), UseTokensFunction (copy), ReactModule (copy), View (copy), HeaderText (copy)
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		padding = {
			left = UDim.new(0, 10),
			bottom = UDim.new(0, UseTokensFunction().Padding.Small)
		}
	}, {
		Text = ReactModule.createElement(HeaderText, {
			text = UseLocalizationFunction({ headerText = p1.text }).headerText
		})
	})
end

return function(p1) --[[ Line: 44 | Named "renderSettingsHeader" ]]
	-- upvalues: CreateFunction (copy), SettingsShowSignal (copy), ReactRobloxModule (copy), ReactModule (copy), InExperienceMenuReactModule (copy), HeaderTextContainer (copy)
	local v1 = CreateFunction("Frame")({
		Name = "HeaderWrapper",
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder,
		Parent = p1.parent
	})
	local Root = nil
	SettingsShowSignal:connect(function(p2) --[[ Line: 55 ]]
		-- upvalues: Root (ref), v1 (copy), p1 (copy), ReactRobloxModule (upval), ReactModule (upval), InExperienceMenuReactModule (upval), HeaderTextContainer (upval)
		if p2 then
			v1.Parent = p1.parent
			Root = ReactRobloxModule.createRoot(v1)
			Root:render(ReactModule.createElement(InExperienceMenuReactModule, nil, {
				HeaderTextContainer = ReactModule.createElement(HeaderTextContainer, { text = p1.headerText })
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