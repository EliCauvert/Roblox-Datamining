-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local composeStyleVariantModule = require(foundation.Utility.composeStyleVariant)
local _ = require(foundation.Providers.Style.Tokens)
local variantsContextModule = require(foundation.Providers.Style.VariantsContext)

local function createSeverityStyles(_, p0) --[[ line: 34 ]]
	return {
		icon = { style = p0 },
		stroke = {
			Thickness = 1,
			Color = p0.Color3,
			Transparency = p0.Transparency
		},
		backgroundStyle = { Transparency = 0.95, Color3 = p0.Color3 }
	}
end

local function variantsFactory(p1) --[[ line: 49 ]]
	-- upvalues: alertSeverityModule (ref), createSeverityStyles (ref)
	return {
		common = {
			container = {
				tag = "col align-x-left align-y-center gap-medium size-full-0 auto-y padding-large radius-medium"
			},
			headerRow = { tag = "row align-y-center gap-medium size-full-0 auto-y" },
			title = {
				tag = "shrink auto-xy text-title-medium text-truncate-split content-emphasis"
			},
			subtitle = {
				tag = "shrink auto-xy text-body-medium text-truncate-split content-default"
			},
			description = {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left text-truncate-split content-default"
			},
			link = {
				tag = "shrink auto-xy text-body-medium text-truncate-split content-emphasis"
			}
		},
		severity = {
			[alertSeverityModule.Info] = createSeverityStyles(p1, p1.Color.System.Emphasis),
			[alertSeverityModule.Warning] = createSeverityStyles(p1, p1.Color.System.Warning),
			[alertSeverityModule.Success] = createSeverityStyles(p1, p1.Color.System.Success),
			[alertSeverityModule.Error] = createSeverityStyles(p1, p1.Color.System.Alert)
		}
	}
end

return function(p2, p3) --[[ line: 81 ]]
	-- upvalues: variantsContextModule (ref), variantsFactory (ref), composeStyleVariantModule (ref)
	local feedbackAlert = variantsContextModule.useVariants("FeedbackAlert", variantsFactory, p2)
	
	return composeStyleVariantModule(feedbackAlert.common, feedbackAlert.severity[p3])
end