local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(expChat.Localization)
local fStringInExpChatRewriteLabelKeyModule = require(expChat.Flags.FStringInExpChatRewriteLabelKey)
local mergeBindableScalarModule = require(expChat.ChatWindow.Helpers.mergeBindableScalar)

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref), mergeBindableScalarModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local var2 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var3 = p1.textTransparency:map(function(p2)
		return p2 < 1
	end)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		Visible = p1.Visible
	}, {
		Label = reactModule.createElement(foundationModule.Text, {
			tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
			LayoutOrder = 1,
			RichText = true,
			Text = "(" .. (if var2.rewrittenLabelText and var2.rewrittenLabelText ~= "" then var2.rewrittenLabelText else var2.defaultRewrittenLabelText) .. ")",
			textStyle = {
				Color3 = var1.Color.Content.Muted.Color3,
				Transparency = mergeBindableScalarModule(var1.Color.Content.Muted.Transparency, p1.textTransparency)
			},
			stroke = {
				Color = Color3.fromRGB(0, 0, 0),
				Transparency = mergeBindableScalarModule(0.5, p1.textTransparency),
				Thickness = var1.Stroke.Thin
			}
		}),
		IconButtonUp = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 2,
			size = foundationModule.Enums.InputSize.XSmall,
			icon = foundationModule.Enums.IconName.ChevronLargeUp,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			Visible = reactModule.joinBindings({ var3, p1.isRewriteMenuOpen }):map(function(p2)
				return p2[1] and p2[2]
			end),
			onActivated = p1.onActivated
		}),
		IconButtonDown = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 3,
			size = foundationModule.Enums.InputSize.XSmall,
			icon = foundationModule.Enums.IconName.ChevronLargeDown,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			Visible = reactModule.joinBindings({ var3, p1.isRewriteMenuOpen }):map(function(p2)
				return p2[1] and not p2[2]
			end),
			onActivated = p1.onActivated
		})
	})
end)