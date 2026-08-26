local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local reactModule = require(parent.React)
local constantsModule = require(interventionShared.Utils.Constants)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local inlineLayoutModule = require(parent.InlineLayout)
local inlineLayout = inlineLayoutModule.Components.InlineLayout
local linkElement = inlineLayoutModule.Components.InlineLayoutElements.LinkElement
local textElement = inlineLayoutModule.Components.InlineLayoutElements.TextElement
local useLocalization = require(parent.Localization).Hooks.useLocalization
local t = { name = "u", attributes = {} }

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), constantsModule (ref), textElement (ref), linkElement (ref), t (ref), reactModule (ref), view (ref), inlineLayout (ref)
	local var1 = useTokens()
	local disclaimer = useLocalization({
		disclaimer = {
			constantsModule.localizationKeys.DisclaimerText,
			startLink = "<a>",
			endLink = "</a>"
		}
	}).disclaimer
	local bodyMedium = var1.Typography.BodyMedium
	local default = var1.Color.Content.Default
	local var2, var3, var4 = disclaimer:match("^(.*)<a>(.*)</a>(.*)$")
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		testId = "inline-appeal-link",
		LayoutOrder = p1.LayoutOrder
	}, {
		Layout = reactModule.createElement(inlineLayout, {
			Elements = {
				textElement.new({ Text = var2, fontStyle = bodyMedium, textStyle = default }),
				linkElement.new({
					textElement.new({
						testId = "inline-appeal-link-action-text",
						Text = var3,
						EngineTags = { t },
						fontStyle = bodyMedium,
						textStyle = default
					})
				}, {
					key = "inline-appeal-link-action",
					onActivated = p1.onActivated
				}),
				textElement.new({ Text = var4, fontStyle = bodyMedium, textStyle = default })
			}
		})
	})
end)