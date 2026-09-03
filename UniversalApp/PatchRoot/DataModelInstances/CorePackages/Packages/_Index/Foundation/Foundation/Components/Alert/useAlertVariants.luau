local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local alertVariantModule = require(foundation.Enums.AlertVariant)
local colorModeModule = require(foundation.Enums.ColorMode)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function createSeverityVariant(p1, p2, p3, p4)
	return {
		container = {
			backgroundStyle = { Color3 = p1.Color3, Transparency = p2 }
		},
		icon = { style = p3 },
		border = { backgroundStyle = p4 }
	}
end

local function variantsFactory(p1)
	-- upvalues: alertSeverityModule (ref), createSeverityVariant (ref), alertVariantModule (ref)
	local t = { top = UDim.new(0, p1.Size.Size_150 + 1) }
	local t_1 = {
		top = UDim.new(0, p1.Size.Size_150),
		bottom = UDim.new(0, p1.Size.Size_150)
	}
	local size500 = p1.Size.Size_500
	local t_2 = {
		tag = "text-body-medium text-wrap text-align-x-left content-emphasis",
		padding = t
	}
	local t_3 = {
		main = {
			tag = "row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
		},
		stack = { tag = "col fill gap-small auto-y" },
		iconFrame = { Size = UDim2.fromOffset(size500, size500) },
		message = t_2,
		link = t_2,
		border = { Size = UDim2.new(1, 0, 0, p1.Stroke.Standard) }
	}
	local t_4 = {
		[alertSeverityModule.Info] = createSeverityVariant(p1.Color.System.Neutral, 0.9, p1.Color.System.Emphasis, p1.Color.Stroke.Emphasis),
		[alertSeverityModule.Success] = createSeverityVariant(p1.Color.System.Success, 0.9, p1.Color.System.Success, p1.Color.Stroke.Emphasis),
		[alertSeverityModule.Warning] = createSeverityVariant(p1.Color.System.Warning, 0.84, p1.Color.System.Warning, p1.Color.System.Warning),
		[alertSeverityModule.Error] = createSeverityVariant(p1.Color.System.Alert, 0.84, p1.Color.System.Alert, p1.Color.System.Alert)
	}
	local t_5 = {
		[alertVariantModule.Feedback] = {
			container = {
				tag = "radius-medium row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
			}
		},
		[alertVariantModule.System] = { container = { tag = "col size-full-0 auto-y" } }
	}
	local t_6 = { container = { tag = "stroke-standard stroke-emphasis" } }
	local t_7 = {
		[alertSeverityModule.Info] = t_6,
		[alertSeverityModule.Success] = t_6,
		[alertSeverityModule.Warning] = {
			container = { tag = "stroke-standard stroke-system-warning" }
		},
		[alertSeverityModule.Error] = {
			container = { tag = "stroke-standard stroke-system-alert" }
		}
	}
	local var1 = size500 - p1.Size.Size_100
	local t_8 = {
		tag = "radius-circle",
		Size = UDim2.fromOffset(var1, var1),
		Position = UDim2.fromOffset((size500 - var1) / 2, (size500 - var1) / 2),
		backgroundStyle = p1.Color.Extended.White.White_100
	}
	
	return {
		common = t_3,
		severity = t_4,
		variants = t_5,
		strokes = t_7,
		backplates = {
			[alertSeverityModule.Info] = { iconBackplate = t_8 },
			[alertSeverityModule.Success] = { iconBackplate = t_8 },
			[alertSeverityModule.Warning] = {},
			[alertSeverityModule.Error] = { iconBackplate = t_8 }
		},
		isStacked = {
			[false] = {
				message = { tag = "fill auto-y" },
				link = { tag = "auto-xy" }
			},
			[true] = {
				message = { tag = "size-full-0 auto-y" },
				link = { tag = "size-full-0 auto-y", padding = t_1 }
			}
		}
	}
end

return function(p1, p2, p3, p4)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), colorModeModule (ref), composeStyleVariantModule (ref), alertVariantModule (ref)
	local alert = variantsContextModule.useVariants("Alert", variantsFactory, p1)
	
	return composeStyleVariantModule(alert.common, alert.severity[p2], alert.variants[p3], alert.isStacked[p4], if p3 == alertVariantModule.Feedback then alert.strokes[p2] else {}, if p1.Config.ColorMode.Name == colorModeModule.Dark then alert.backplates[p2] else {})
end