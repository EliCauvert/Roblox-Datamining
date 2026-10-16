local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(ExpChat.Localization)
local FStringInExpChatRewriteLabelKeyModule = require(ExpChat.Flags.FStringInExpChatRewriteLabelKey)
local MergeBindableScalarModule = require(ExpChat.ChatWindow.Helpers.mergeBindableScalar)

return ReactModule.memo(function(Frame) --[[ Line: 21 | Named "RewriteToggle" ]]
	-- upvalues: FoundationModule (copy), LocalizationModule (copy), FStringInExpChatRewriteLabelKeyModule (copy), ReactModule (copy), MergeBindableScalarModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = LocalizationModule.useLocalization({
		defaultRewrittenLabelText = "CoreScripts.TextChat.ChatWindow.RewrittenLabel",
		rewrittenLabelText = FStringInExpChatRewriteLabelKeyModule
	})
	local MapResult = Frame.textTransparency:map(function(p1: number): boolean --[[ Line: 32 ]]
		return p1 < 1
	end)
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder,
		Visible = Frame.Visible
	}, {
		Label = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-0-0 auto-xy text-caption-small text-align-x-left",
			LayoutOrder = 1,
			RichText = true,
			Text = "(" .. (if UseLocalizationResult.rewrittenLabelText and UseLocalizationResult.rewrittenLabelText ~= "" then UseLocalizationResult.rewrittenLabelText else UseLocalizationResult.defaultRewrittenLabelText) .. ")",
			textStyle = {
				Color3 = UseTokensResult.Color.Content.Muted.Color3,
				Transparency = MergeBindableScalarModule(UseTokensResult.Color.Content.Muted.Transparency, Frame.textTransparency)
			},
			stroke = {
				Color = Color3.fromRGB(0, 0, 0),
				Transparency = MergeBindableScalarModule(0.5, Frame.textTransparency),
				Thickness = UseTokensResult.Stroke.Thin
			}
		}),
		IconButtonUp = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 2,
			size = FoundationModule.Enums.InputSize.XSmall,
			icon = FoundationModule.Enums.IconName.ChevronLargeUp,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			Visible = ReactModule.joinBindings({ MapResult, Frame.isRewriteMenuOpen }):map(function(Entry) --[[ Line: 36 ]]
				return Entry[1] and Entry[2]
			end),
			onActivated = Frame.onActivated
		}),
		IconButtonDown = ReactModule.createElement(FoundationModule.IconButton, {
			isCircular = true,
			LayoutOrder = 3,
			size = FoundationModule.Enums.InputSize.XSmall,
			icon = FoundationModule.Enums.IconName.ChevronLargeDown,
			variant = FoundationModule.Enums.ButtonVariant.Utility,
			Visible = ReactModule.joinBindings({ MapResult, Frame.isRewriteMenuOpen }):map(function(Entry): boolean --[[ Line: 41 ]]
				return Entry[1] and not Entry[2]
			end),
			onActivated = Frame.onActivated
		})
	})
end)