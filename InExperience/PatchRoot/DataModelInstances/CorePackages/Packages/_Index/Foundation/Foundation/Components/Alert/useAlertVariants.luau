local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local AlertVariantModule = require(Foundation.Enums.AlertVariant)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function createSeverityVariant(Alert, Transparency, Style, Emphasis)
	return {
		container = {
			backgroundStyle = { Color3 = Alert.Color3, Transparency = Transparency }
		},
		icon = { style = Style },
		border = { backgroundStyle = Emphasis }
	}
end

local function variantsFactory(p1)
	-- upvalues: AlertSeverityModule (copy), createSeverityVariant (copy), AlertVariantModule (copy)
	local Size500 = p1.Size.Size_500
	local Link = {
		tag = "text-body-medium text-wrap text-align-x-left content-emphasis",
		padding = { top = UDim.new(0, p1.Size.Size_150 + 1) }
	}
	local config = { container = { tag = "stroke-standard stroke-emphasis" } }
	local XOffset = Size500 - p1.Size.Size_100
	local IconBackplate = {
		tag = "radius-circle",
		Size = UDim2.fromOffset(XOffset, XOffset),
		Position = UDim2.fromOffset((Size500 - XOffset) / 2, (Size500 - XOffset) / 2),
		backgroundStyle = p1.Color.Extended.White.White_100
	}
	
	return {
		common = {
			main = {
				tag = "row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
			},
			stack = { tag = "col fill gap-small auto-y" },
			iconFrame = { Size = UDim2.fromOffset(Size500, Size500) },
			message = Link,
			link = Link,
			border = { Size = UDim2.new(1, 0, 0, p1.Stroke.Standard) }
		},
		severity = {
			[AlertSeverityModule.Info] = createSeverityVariant(p1.Color.System.Neutral, 0.9, p1.Color.System.Emphasis, p1.Color.Stroke.Emphasis),
			[AlertSeverityModule.Success] = createSeverityVariant(p1.Color.System.Success, 0.9, p1.Color.System.Success, p1.Color.Stroke.Emphasis),
			[AlertSeverityModule.Warning] = createSeverityVariant(p1.Color.System.Warning, 0.84, p1.Color.System.Warning, p1.Color.System.Warning),
			[AlertSeverityModule.Error] = createSeverityVariant(p1.Color.System.Alert, 0.84, p1.Color.System.Alert, p1.Color.System.Alert)
		},
		variants = {
			[AlertVariantModule.Feedback] = {
				container = {
					tag = "radius-medium row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
				}
			},
			[AlertVariantModule.System] = { container = { tag = "col size-full-0 auto-y" } }
		},
		strokes = {
			[AlertSeverityModule.Info] = config,
			[AlertSeverityModule.Success] = config,
			[AlertSeverityModule.Warning] = {
				container = { tag = "stroke-standard stroke-system-warning" }
			},
			[AlertSeverityModule.Error] = {
				container = { tag = "stroke-standard stroke-system-alert" }
			}
		},
		backplates = {
			[AlertSeverityModule.Info] = { iconBackplate = IconBackplate },
			[AlertSeverityModule.Success] = { iconBackplate = IconBackplate },
			[AlertSeverityModule.Warning] = {},
			[AlertSeverityModule.Error] = { iconBackplate = IconBackplate }
		},
		isStacked = {
			[false] = {
				message = { tag = "fill auto-y" },
				link = { tag = "auto-xy" }
			},
			[true] = {
				message = { tag = "size-full-0 auto-y" },
				link = {
					tag = "size-full-0 auto-y",
					padding = {
						top = UDim.new(0, p1.Size.Size_150),
						bottom = UDim.new(0, p1.Size.Size_150)
					}
				}
			}
		}
	}
end

return function(p1, p2, Feedback, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ColorModeModule (copy), ComposeStyleVariantModule (copy), AlertVariantModule (copy)
	local Alert = VariantsContextModule.useVariants("Alert", variantsFactory, p1)
	local IsNameMatch = p1.Config.ColorMode.Name == ColorModeModule.Dark
	
	return ComposeStyleVariantModule(Alert.common, Alert.severity[p2], Alert.variants[Feedback], Alert.isStacked[p3], if Feedback == AlertVariantModule.Feedback then Alert.strokes[p2] else {}, if IsNameMatch then Alert.backplates[p2] else {})
end