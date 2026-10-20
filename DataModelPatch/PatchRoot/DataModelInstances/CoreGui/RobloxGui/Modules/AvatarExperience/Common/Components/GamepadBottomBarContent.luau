local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local TModule = require(CorePackages.Packages.t)
local GamepadBottomBarElementModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.GamepadBottomBarElement)
local config = {
	[Enum.KeyCode.ButtonA] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
	[Enum.KeyCode.ButtonB] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
	[Enum.KeyCode.ButtonX] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonX.png",
	[Enum.KeyCode.ButtonY] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonY.png",
	[Enum.KeyCode.ButtonL3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonL3.png",
	[Enum.KeyCode.ButtonR3] = "rbxasset://textures/ui/Controls/DesignSystem/ButtonR3.png",
	[Enum.KeyCode.Thumbstick1] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Directional.png",
	[Enum.KeyCode.Thumbstick2] = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Directional.png"
}
local config1 = {
	[Enum.KeyCode.Thumbstick1] = {
		vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Vertical.png",
		horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick1Horizontal.png"
	},
	[Enum.KeyCode.Thumbstick2] = {
		vertical = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Vertical.png",
		horizontal = "rbxasset://textures/ui/Controls/DesignSystem/Thumbstick2Horizontal.png"
	}
}
local config2 = {
	["Feature.Catalog.Action.ItemOptions"] = 1,
	["CommonUI.Messages.Action.Apply"] = 1,
	["CommonUI.Messages.Action.Reset"] = 2,
	["Feature.Catalog.Action.OpenDetails"] = 2,
	["Feature.Catalog.Action.CloseDetails"] = 2,
	["Feature.Catalog.Action.Buy"] = 3,
	["Feature.Avatar.Heading.WearConfirmation"] = 4,
	["CommonUI.Controls.Action.Confirm"] = 5,
	["Feature.Catalog.Action.Remove"] = 6,
	["Feature.Avatar.Title.Move"] = 7,
	["Feature.Avatar.Action.Pan"] = 1,
	["Feature.Avatar.Action.Zoom"] = 2,
	["Feature.Avatar.Action.Rotate"] = 3,
	["Feature.Avatar.Action.DefaultView"] = 4
}
local GamepadBottomBarContent = RoactModule.PureComponent:extend("GamepadBottomBarContent")
GamepadBottomBarContent.validateProps = TModule.strictInterface({ boundInputs = TModule.table, width = TModule.number })

function GamepadBottomBarContent.renderElements(p1, p2, p3)
	-- upvalues: RoactModule (copy), GamepadBottomBarElementModule (copy)
	local Width: number = p1.props.width
	local Elements = {}
	local CountP1 = #p2
	
	if CountP1 > 0 and Width > 0 then
		local WidthRatio = (Width - (CountP1 - 1) * 36 - 24) / CountP1
		
		for i = 1, CountP1 do
			local v1 = p3[i]
			Elements[i] = RoactModule.createElement(GamepadBottomBarElementModule, {
				elementIcon = v1.elementIcon,
				elementText = p2[i],
				layoutOrder = v1.layoutOrder,
				disabled = v1.disabled,
				width = WidthRatio
			})
		end
	end
	return RoactModule.createFragment(Elements)
end

function GamepadBottomBarContent.render(p4)
	-- upvalues: config1 (copy), config2 (copy), config (copy), WithLocalizationFunction (copy)
	local BoundInputs = p4.props.boundInputs
	local Keys = {}
	local List = {}
	
	if BoundInputs then
		for i, boundInput in BoundInputs do
			if typeof(boundInput) == "table" and i ~= Enum.KeyCode.ButtonB then
				if boundInput.axes then
					local Vertical = boundInput.axes.vertical
					local Horizontal = boundInput.axes.horizontal
					local Entry = config1[i]
					
					if Vertical then
						table.insert(Keys, Vertical.key)
						table.insert(List, {
							elementIcon = Entry.vertical,
							layoutOrder = config2[Vertical.key] or 0,
							disabled = Vertical.disabled
						})
					end
					if Horizontal then
						table.insert(Keys, Horizontal.key)
						table.insert(List, {
							elementIcon = Entry.horizontal,
							layoutOrder = config2[Horizontal.key] or 0,
							disabled = Horizontal.disabled
						})
					end
				elseif boundInput.key then
					table.insert(Keys, boundInput.key)
					table.insert(List, {
						elementIcon = config[i],
						layoutOrder = config2[boundInput.key] or 0,
						disabled = boundInput.disabled
					})
				end
			end
		end
	end
	return WithLocalizationFunction(Keys)(function(p5)
		-- upvalues: p4 (copy), List (copy)
		return p4:renderElements(p5, List)
	end)
end

return GamepadBottomBarContent