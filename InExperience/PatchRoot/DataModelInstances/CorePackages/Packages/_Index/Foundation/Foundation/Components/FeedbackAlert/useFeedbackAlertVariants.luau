local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local ComposeStyleVariantModule = require(Foundation.Utility.composeStyleVariant)
local _ = require(Foundation.Providers.Style.Tokens)
local VariantsContextModule = require(Foundation.Providers.Style.VariantsContext)

local function createSeverityStyles(_, Style)
	return {
		icon = { style = Style },
		stroke = {
			Thickness = 1,
			Color = Style.Color3,
			Transparency = Style.Transparency
		},
		backgroundStyle = { Transparency = 0.95, Color3 = Style.Color3 }
	}
end

local function variantsFactory(p1)
	-- upvalues: AlertSeverityModule (copy), createSeverityStyles (copy)
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
			[AlertSeverityModule.Info] = createSeverityStyles(p1, p1.Color.System.Emphasis),
			[AlertSeverityModule.Warning] = createSeverityStyles(p1, p1.Color.System.Warning),
			[AlertSeverityModule.Success] = createSeverityStyles(p1, p1.Color.System.Success),
			[AlertSeverityModule.Error] = createSeverityStyles(p1, p1.Color.System.Alert)
		}
	}
end

return function(p1, p2)
	-- upvalues: VariantsContextModule (copy), variantsFactory (copy), ComposeStyleVariantModule (copy)
	local FeedbackAlert = VariantsContextModule.useVariants("FeedbackAlert", variantsFactory, p1)
	
	return ComposeStyleVariantModule(FeedbackAlert.common, FeedbackAlert.severity[p2])
end