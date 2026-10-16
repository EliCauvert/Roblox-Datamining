local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(ChatUIPrimitives.Types)

return ReactModule.memo(function(Frame) --[[ Line: 18 | Named "RewriteToggle" ]]
	-- upvalues: FoundationModule (copy), ReactModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = Frame.LayoutOrder
	}, {
		toggleRow = ReactModule.createElement(FoundationModule.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 1,
			backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
			Visible = Frame.messageBinding:map(function(p1): boolean --[[ Line: 27 ]]
				return p1 ~= nil and p1.wasRewritten == true
			end)
		}, {
			label = ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-caption-small text-align-x-left content-muted",
				Text = "(rephrased)",
				LayoutOrder = 1
			}),
			caret = ReactModule.createElement(FoundationModule.IconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = if Frame.showOriginal then FoundationModule.Enums.IconName.ChevronLargeUp else FoundationModule.Enums.IconName.ChevronLargeDown,
				variant = FoundationModule.Enums.ButtonVariant.Utility,
				size = FoundationModule.Enums.InputSize.XSmall,
				onActivated = Frame.onToggle
			})
		}),
		dropdown = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-xxsmall size-full-0 auto-y padding-small radius-medium",
			LayoutOrder = 2,
			backgroundStyle = {
				Transparency = 0.7,
				Color3 = FoundationModule.Hooks.useTokens().Color.Common.Scrim.Color3
			},
			Visible = Frame.messageBinding:map(function(p1) --[[ Line: 38 ]]
				-- upvalues: Frame (copy)
				return p1 ~= nil and (p1.wasRewritten == true and Frame.showOriginal)
			end)
		}, {
			original = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-caption-medium text-wrap text-align-x-left content-muted",
				RichText = true,
				LayoutOrder = 1,
				Text = Frame.messageBinding:map(function(p1): string --[[ Line: 31 ]]
					return if p1 and p1.originalText then `<s>{p1.originalText}</s>` else ""
				end),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			explanation = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-caption-medium text-wrap text-align-x-left content-muted",
				Text = "Roblox rephrases messages that break safety rules.",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end)