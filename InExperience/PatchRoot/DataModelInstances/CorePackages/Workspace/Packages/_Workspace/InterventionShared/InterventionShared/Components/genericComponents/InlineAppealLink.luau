local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(InterventionShared.Utils.Constants)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local InlineLayoutModule = require(Parent.InlineLayout)
local InlineLayout = InlineLayoutModule.Components.InlineLayout
local LinkElement = InlineLayoutModule.Components.InlineLayoutElements.LinkElement
local TextElement = InlineLayoutModule.Components.InlineLayoutElements.TextElement
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = { name = "u", attributes = {} }

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), TextElement (copy), LinkElement (copy), config (copy), ReactModule (copy), View (copy), InlineLayout (copy)
	local UseTokensResult = UseTokensFunction()
	local BodyMedium = UseTokensResult.Typography.BodyMedium
	local Default = UseTokensResult.Color.Content.Default
	local A, A2, A3 = UseLocalizationFunction({
		disclaimer = {
			ConstantsModule.localizationKeys.DisclaimerText,
			startLink = "<a>",
			endLink = "</a>"
		}
	}).disclaimer:match("^(.*)<a>(.*)</a>(.*)$")
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		testId = "inline-appeal-link",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement(InlineLayout, {
			Elements = {
				TextElement.new({ Text = A, fontStyle = BodyMedium, textStyle = Default }),
				LinkElement.new({
					TextElement.new({
						testId = "inline-appeal-link-action-text",
						Text = A2,
						EngineTags = { config },
						fontStyle = BodyMedium,
						textStyle = Default
					})
				}, {
					key = "inline-appeal-link-action",
					onActivated = Frame.onActivated
				}),
				TextElement.new({ Text = A3, fontStyle = BodyMedium, textStyle = Default })
			}
		})
	})
end)