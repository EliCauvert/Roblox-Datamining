local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(chatUIPrimitives.Types)

return reactModule.memo(function(p0) --[[ line: 18 | named "RewriteToggle" ]]
	-- upvalues: foundationModule (ref), reactModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "col gap-xsmall auto-y",
		Size = UDim2.new(1, 0, 0, 0),
		backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
		LayoutOrder = p0.LayoutOrder
	}, {
		toggleRow = reactModule.createElement(foundationModule.View, {
			tag = "row align-y-center gap-xsmall auto-xy",
			LayoutOrder = 1,
			backgroundStyle = { Transparency = 1, Color3 = Color3.new(0, 0, 0) },
			Visible = p0.messageBinding:map(function(p1) --[[ line: 27 ]]
				return p1 ~= nil and p1.wasRewritten == true
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
				icon = if p0.showOriginal then foundationModule.Enums.IconName.ChevronLargeUp else foundationModule.Enums.IconName.ChevronLargeDown,
				variant = foundationModule.Enums.ButtonVariant.Utility,
				size = foundationModule.Enums.InputSize.XSmall,
				onActivated = p0.onToggle
			})
		}),
		dropdown = reactModule.createElement(foundationModule.View, {
			tag = "col gap-xxsmall size-full-0 auto-y padding-small radius-medium",
			LayoutOrder = 2,
			backgroundStyle = {
				Transparency = 0.7,
				Color3 = foundationModule.Hooks.useTokens().Color.Common.Scrim.Color3
			},
			Visible = p0.messageBinding:map(function(p2) --[[ line: 38 ]]
				-- upvalues: p0 (ref)
				return p2 ~= nil and (p2.wasRewritten == true and p0.showOriginal)
			end)
		}, {
			original = reactModule.createElement(foundationModule.Text, {
				tag = "text-caption-medium text-wrap text-align-x-left content-muted",
				RichText = true,
				LayoutOrder = 1,
				Text = p0.messageBinding:map(function(p3) --[[ line: 31 ]]
					return if p3 and p3.originalText then `<s>{p3.originalText}</s>` else ""
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