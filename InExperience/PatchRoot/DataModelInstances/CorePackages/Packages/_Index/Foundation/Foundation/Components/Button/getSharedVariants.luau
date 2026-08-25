local foundation = script:FindFirstAncestor("Foundation")
local constantsModule = require(foundation.Constants)
local dashModule = require(foundation.Parent.Dash)
local _ = require(foundation.Components.Types)
local buttonVariantModule = require(foundation.Enums.ButtonVariant)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local _ = require(foundation.Enums.StateLayerMode)
local _ = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local inputSizeModule = require(foundation.Enums.InputSize)

local function _(p0)
	return { Color = p0.Color3, Transparency = p0.Transparency }
end

local function createButtonVariantStyles(p1, p2, p3)
	-- upvalues: colorNamespaceModule (ref), dashModule (ref), constantsModule (ref)
	local t = {}
	
	for i in colorNamespaceModule do
		local t_3
		local var10 = p1[i]
		local var11 = if type(p2) == "table" then { Foreground = dashModule.get(var10, p2) } else var10[p2]
		local t_1 = {}
		local t_2 = { style = var11.Background }
		
		if var11.Border then
			local border = var11.Border
			t_3 = {
				Color = border.Color3,
				Transparency = border.Transparency
			}
		else
			t_3 = nil
		end
		t_2.stroke = t_3
		t_2.stateLayer = {
			mode = constantsModule.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[p3 or false][i]
		}
		t_1.container = t_2
		t_1.content = { style = var11.Foreground }
		t[i] = t_1
	end
	return t
end

local function getButtonTypes(p4)
	-- upvalues: buttonVariantModule (ref), createButtonVariantStyles (ref)
	return {
		[buttonVariantModule.Utility] = createButtonVariantStyles(p4, "ActionUtility"),
		[buttonVariantModule.Standard] = createButtonVariantStyles(p4, "ActionStandard"),
		[buttonVariantModule.Emphasis] = createButtonVariantStyles(p4, "ActionEmphasis"),
		[buttonVariantModule.Alert] = createButtonVariantStyles(p4, "ActionAlert"),
		[buttonVariantModule.SubEmphasis] = createButtonVariantStyles(p4, "ActionSubEmphasis", true),
		[buttonVariantModule.SoftEmphasis] = createButtonVariantStyles(p4, "ActionSoftEmphasis"),
		[buttonVariantModule.Subtle] = createButtonVariantStyles(p4, "ActionSubtle"),
		[buttonVariantModule.Text] = createButtonVariantStyles(p4, { "Content", "Emphasis" }),
		[buttonVariantModule.Link] = createButtonVariantStyles(p4, { "Content", "Link" }),
		[buttonVariantModule.OverMedia] = createButtonVariantStyles(p4, "ActionOverMedia", true)
	}
end

local function getSizes(p5)
	-- upvalues: inputSizeModule (ref)
	return {
		[inputSizeModule.XSmall] = {
			container = { radius = p5.Radius.Small, height = p5.Size.Size_600 }
		},
		[inputSizeModule.Small] = {
			container = { radius = p5.Radius.Medium, height = p5.Size.Size_800 }
		},
		[inputSizeModule.Medium] = {
			container = { radius = p5.Radius.Medium, height = p5.Size.Size_1000 }
		},
		[inputSizeModule.Large] = {
			container = { radius = p5.Radius.Medium, height = p5.Size.Size_1200 }
		}
	}
end

return function(p6)
	-- upvalues: getSizes (ref), getButtonTypes (ref)
	return { sizes = getSizes(p6), types = getButtonTypes(p6) }
end