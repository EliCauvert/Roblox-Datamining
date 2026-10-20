local Foundation = script:FindFirstAncestor("Foundation")
local ConstantsModule = require(Foundation.Constants)
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Components.Types)
local ButtonVariantModule = require(Foundation.Enums.ButtonVariant)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local _ = require(Foundation.Enums.StateLayerMode)
local _ = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local InputSizeModule = require(Foundation.Enums.InputSize)

local function _(p1)
	return { Color = p1.Color3, Transparency = p1.Transparency }
end

local function createButtonVariantStyles(p1, p2, p3)
	-- upvalues: ColorNamespaceModule (copy), DashModule (copy), ConstantsModule (copy)
	local t = {}
	
	for i in ColorNamespaceModule do
		local v1 = p1[i]
		local Config = if type(p2) == "table" then { Foreground = DashModule.get(v1, p2) } else v1[p2]
		local t1 = {}
		local Container = { style = Config.Background }
		local Stroke = nil
		
		if Config.Border then
			local Border = Config.Border
			Stroke = {
				Color = Border.Color3,
				Transparency = Border.Transparency
			}
		else
			Stroke = nil
		end
		Container.stroke = Stroke
		Container.stateLayer = {
			mode = ConstantsModule.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[p3 or false][i]
		}
		t1.container = Container
		t1.content = { style = Config.Foreground }
		t[i] = t1
	end
	return t
end

local function getButtonTypes(p4)
	-- upvalues: ButtonVariantModule (copy), createButtonVariantStyles (copy)
	return {
		[ButtonVariantModule.Utility] = createButtonVariantStyles(p4, "ActionUtility"),
		[ButtonVariantModule.Standard] = createButtonVariantStyles(p4, "ActionStandard"),
		[ButtonVariantModule.Emphasis] = createButtonVariantStyles(p4, "ActionEmphasis"),
		[ButtonVariantModule.Alert] = createButtonVariantStyles(p4, "ActionAlert"),
		[ButtonVariantModule.SubEmphasis] = createButtonVariantStyles(p4, "ActionSubEmphasis", true),
		[ButtonVariantModule.SoftEmphasis] = createButtonVariantStyles(p4, "ActionSoftEmphasis"),
		[ButtonVariantModule.Subtle] = createButtonVariantStyles(p4, "ActionSubtle"),
		[ButtonVariantModule.Text] = createButtonVariantStyles(p4, { "Content", "Emphasis" }),
		[ButtonVariantModule.Link] = createButtonVariantStyles(p4, { "Content", "Link" }),
		[ButtonVariantModule.OverMedia] = createButtonVariantStyles(p4, "ActionOverMedia", true)
	}
end

local function getSizes(p4)
	-- upvalues: InputSizeModule (copy)
	return {
		[InputSizeModule.XSmall] = {
			container = { radius = p4.Radius.Small, height = p4.Size.Size_600 }
		},
		[InputSizeModule.Small] = {
			container = { radius = p4.Radius.Medium, height = p4.Size.Size_800 }
		},
		[InputSizeModule.Medium] = {
			container = { radius = p4.Radius.Medium, height = p4.Size.Size_1000 }
		},
		[InputSizeModule.Large] = {
			container = { radius = p4.Radius.Medium, height = p4.Size.Size_1200 }
		}
	}
end

return function(p4)
	-- upvalues: getSizes (copy), getButtonTypes (copy)
	return { sizes = getSizes(p4), types = getButtonTypes(p4) }
end