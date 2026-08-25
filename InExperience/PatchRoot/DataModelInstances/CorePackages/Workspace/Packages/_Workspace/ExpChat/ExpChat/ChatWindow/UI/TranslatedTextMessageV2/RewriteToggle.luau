local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local localizationModule = require(expChat.Localization)
local fStringInExpChatRewriteLabelKeyModule = require(expChat.Flags.FStringInExpChatRewriteLabelKey)
local mergeBindableScalarModule = require(expChat.ChatWindow.Helpers.mergeBindableScalar)

return reactModule.memo(function(p0)
	-- upvalues: foundationModule (ref), localizationModule (ref), fStringInExpChatRewriteLabelKeyModule (ref), reactModule (ref), mergeBindableScalarModule (ref)
	local var6 = foundationModule.Hooks.useTokens()
	local var7 = localizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = fStringInExpChatRewriteLabelKeyModule
	})
	local var8 = p0.textTransparency:map(function(p1)
		return p1 < 1
	end)
	
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder,
		Visible = p0.Visible
	}, {
		Label = reactModule.createElement(foundationModule.Text, {
			tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
			LayoutOrder = 1,
			RichText = true,
			Text = "(" .. (if var7.rewrittenLabelText and var7.rewrittenLabelText ~= "" then var7.rewrittenLabelText else var7.defaultRewrittenLabelText) .. ")",
			textStyle = {
				Color3 = var6.Color.Content.Muted.Color3,
				Transparency = mergeBindableScalarModule(var6.Color.Content.Muted.Transparency, p0.textTransparency)
			},
			stroke = {
				Color = Color3.fromRGB(0, 0, 0),
				Transparency = mergeBindableScalarModule(0.5, p0.textTransparency),
				Thickness = var6.Stroke.Thin
			}
		}),
		IconButtonUp = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 2,
			size = foundationModule.Enums.InputSize.XSmall,
			icon = foundationModule.Enums.IconName.ChevronLargeUp,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			Visible = reactModule.joinBindings({ var8, p0.isRewriteMenuOpen }):map(function(p2)
				return p2[1] and p2[2]
			end),
			onActivated = p0.onActivated
		}),
		IconButtonDown = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 3,
			size = foundationModule.Enums.InputSize.XSmall,
			icon = foundationModule.Enums.IconName.ChevronLargeDown,
			variant = foundationModule.Enums.ButtonVariant.Utility,
			Visible = reactModule.joinBindings({ var8, p0.isRewriteMenuOpen }):map(function(p3)
				return p3[1] and not p3[2]
			end),
			onActivated = p0.onActivated
		})
	})
end)