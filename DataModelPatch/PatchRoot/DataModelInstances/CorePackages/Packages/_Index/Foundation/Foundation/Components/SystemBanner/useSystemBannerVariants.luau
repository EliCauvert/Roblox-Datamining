local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local AlertVariantModule = require(Foundation.Enums.AlertVariant)
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function createStandardVariantStyles(p1, Style)
	-- upvalues: ColorModeModule (copy)
	return {
		container = { tag = "bg-shift-200", colorMode = ColorModeModule.Color },
		title = { style = p1.Color.Content.Emphasis },
		description = { style = p1.Color.Content.Default },
		icon = { style = Style }
	}
end

local function createEmphasisVariantStyles(p1, Tag, DarkMode)
	return {
		container = { tag = Tag, colorMode = DarkMode },
		title = { style = p1[DarkMode].Content.Emphasis },
		description = { style = p1[DarkMode].Content.Default },
		icon = { style = p1[DarkMode].Content.Emphasis }
	}
end

local function variantsFactory(p1)
	-- upvalues: AlertVariantModule (copy), AlertSeverityModule (copy), createStandardVariantStyles (copy), createEmphasisVariantStyles (copy), ColorModeModule (copy)
	return {
		common = {
			container = {
				tag = "row gap-medium size-full-0 auto-y padding-x-medium padding-y-large"
			},
			title = {
				tag = "auto-xy padding-y-xxsmall text-title-medium text-wrap text-align-x-left"
			},
			description = {
				tag = "auto-xy text-body-medium text-wrap text-align-x-left"
			}
		},
		severity = {
			[AlertVariantModule.Standard] = {
				[AlertSeverityModule.Info] = createStandardVariantStyles(p1, p1.Color.System.Emphasis),
				[AlertSeverityModule.Warning] = createStandardVariantStyles(p1, p1.Color.System.Warning),
				[AlertSeverityModule.Success] = createStandardVariantStyles(p1, p1.Color.System.Success),
				[AlertSeverityModule.Error] = createStandardVariantStyles(p1, p1.Color.System.Alert)
			},
			[AlertVariantModule.Emphasis] = {
				[AlertSeverityModule.Info] = createEmphasisVariantStyles(p1, "bg-system-emphasis", ColorModeModule.DarkMode),
				[AlertSeverityModule.Warning] = createEmphasisVariantStyles(p1, "bg-system-warning", ColorModeModule.LightMode),
				[AlertSeverityModule.Success] = createEmphasisVariantStyles(p1, "bg-system-success", ColorModeModule.LightMode),
				[AlertSeverityModule.Error] = createEmphasisVariantStyles(p1, "bg-system-alert", ColorModeModule.DarkMode)
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local SystemBanner = VariantsContextModule.useVariants("SystemBanner", variantsFactory, p1)
	
	return ComposeStyleVariantModule(SystemBanner.common, SystemBanner.severity[p2][p3])
end