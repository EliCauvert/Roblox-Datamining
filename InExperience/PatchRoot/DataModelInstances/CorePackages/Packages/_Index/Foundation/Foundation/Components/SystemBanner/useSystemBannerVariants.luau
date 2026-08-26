local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local alertVariantModule = require(foundation.Enums.AlertVariant)
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function createStandardVariantStyles(p1, p2)
	-- upvalues: colorNamespaceModule (ref)
	return {
		container = {
			tag = "bg-shift-200",
			colorNamespace = colorNamespaceModule.Color
		},
		title = { style = p1.Color.Content.Emphasis },
		description = { style = p1.Color.Content.Default },
		icon = { style = p2 }
	}
end

local function createEmphasisVariantStyles(p1, p2, p3)
	return {
		container = { tag = p2, colorNamespace = p3 },
		title = { style = p1[p3].Content.Emphasis },
		description = { style = p1[p3].Content.Default },
		icon = { style = p1[p3].Content.Emphasis }
	}
end

local function variantsFactory(p1)
	-- upvalues: alertVariantModule (ref), alertSeverityModule (ref), createStandardVariantStyles (ref), createEmphasisVariantStyles (ref), colorNamespaceModule (ref)
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
			[alertVariantModule.Standard] = {
				[alertSeverityModule.Info] = createStandardVariantStyles(p1, p1.Color.System.Emphasis),
				[alertSeverityModule.Warning] = createStandardVariantStyles(p1, p1.Color.System.Warning),
				[alertSeverityModule.Success] = createStandardVariantStyles(p1, p1.Color.System.Success),
				[alertSeverityModule.Error] = createStandardVariantStyles(p1, p1.Color.System.Alert)
			},
			[alertVariantModule.Emphasis] = {
				[alertSeverityModule.Info] = createEmphasisVariantStyles(p1, "bg-system-emphasis", colorNamespaceModule.DarkMode),
				[alertSeverityModule.Warning] = createEmphasisVariantStyles(p1, "bg-system-warning", colorNamespaceModule.LightMode),
				[alertSeverityModule.Success] = createEmphasisVariantStyles(p1, "bg-system-success", colorNamespaceModule.LightMode),
				[alertSeverityModule.Error] = createEmphasisVariantStyles(p1, "bg-system-alert", colorNamespaceModule.DarkMode)
			}
		}
	}
end

return function(p1, p2, p3)
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local systemBanner = variantsContextModule.useVariants("SystemBanner", variantsFactory, p1)
	
	return composeStyleVariantModule(systemBanner.common, systemBanner.severity[p2][p3])
end