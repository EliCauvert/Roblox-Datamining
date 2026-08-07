-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local alertVariantModule = require(foundation.Enums.AlertVariant)
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function createStandardVariantStyles(p0, p1) --[[ line: 31 ]]
	-- upvalues: colorNamespaceModule (ref)
	return {
		container = {
			tag = "bg-shift-200",
			colorNamespace = colorNamespaceModule.Color
		},
		title = { style = p0.Color.Content.Emphasis },
		description = { style = p0.Color.Content.Default },
		icon = { style = p1 }
	}
end

local function createEmphasisVariantStyles(p2, p3, p4) --[[ line: 43 ]]
	return {
		container = { tag = p3, colorNamespace = p4 },
		title = { style = p2[p4].Content.Emphasis },
		description = { style = p2[p4].Content.Default },
		icon = { style = p2[p4].Content.Emphasis }
	}
end

local function variantsFactory(p5) --[[ line: 59 ]]
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
				[alertSeverityModule.Info] = createStandardVariantStyles(p5, p5.Color.System.Emphasis),
				[alertSeverityModule.Warning] = createStandardVariantStyles(p5, p5.Color.System.Warning),
				[alertSeverityModule.Success] = createStandardVariantStyles(p5, p5.Color.System.Success),
				[alertSeverityModule.Error] = createStandardVariantStyles(p5, p5.Color.System.Alert)
			},
			[alertVariantModule.Emphasis] = {
				[alertSeverityModule.Info] = createEmphasisVariantStyles(p5, "bg-system-emphasis", colorNamespaceModule.DarkMode),
				[alertSeverityModule.Warning] = createEmphasisVariantStyles(p5, "bg-system-warning", colorNamespaceModule.LightMode),
				[alertSeverityModule.Success] = createEmphasisVariantStyles(p5, "bg-system-success", colorNamespaceModule.LightMode),
				[alertSeverityModule.Error] = createEmphasisVariantStyles(p5, "bg-system-alert", colorNamespaceModule.DarkMode)
			}
		}
	}
end

return function(p6, p7, p8) --[[ line: 98 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local systemBanner = variantsContextModule.useVariants("SystemBanner", variantsFactory, p6)
	
	return composeStyleVariantModule(systemBanner.common, systemBanner.severity[p7][p8])
end