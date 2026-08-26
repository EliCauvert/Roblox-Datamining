local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = p1.LayoutOrder
	}, {
		toggleRow = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 1,
			backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
			Visible = p1.messageBinding:map(function(p2)
				return p2 ~= nil and p2.wasRewritten == true
			end)
		}, {
			label = reactModule.createElement(foundationModule.Text, {
				tag = "auto-xy text-caption-small text-align-x-left content-muted",
				Text = "(rephrased)",
				LayoutOrder = 1
			}),
			caret = reactModule.createElement(foundationModule.IconButton, {
				isCircular = true,
				LayoutOrder = 2,
				icon = if p1.showOriginal then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown,
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.XSmall,
				onActivated = p1.onToggle
			})
		}),
		dropdown = reactModule.createElement(foundationModule.View, {
			tag = "col gap-xxsmall size-full-0 auto-y padding-small radius-medium",
			LayoutOrder = 2,
			backgroundStyle = {
				Transparency = 0.7,
				Color3 = foundationModule.Hooks.useTokens().Color.Common.Scrim.Color3
			},
			Visible = p1.messageBinding:map(function(p2)
				-- upvalues: p1 (ref)
				return p2 ~= nil and (p2.wasRewritten == true and p1.showOriginal)
			end)
		}, {
			original = reactModule.createElement(foundationModule.Text, {
				tag = "text-caption-medium text-wrap text-align-x-left content-muted",
				RichText = true,
				LayoutOrder = 1,
				Text = p1.messageBinding:map(function(p2)
					return if p2 and p2.originalText then `<s>{p2.originalText}</s>` else ""
				end),
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			explanation = reactModule.createElement(foundationModule.Text, {
				tag = "text-caption-medium text-wrap text-align-x-left content-muted",
				Text = "Roblox rephrases messages that break safety rules.",
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			})
		})
	})
end)