local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Spacer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill" }),
		Message = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-right gap-xsmall auto-y",
			Size = UDim2.new(0.78, 0, 0, 0)
		}, {
			Bubble = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "auto-xy padding-medium bg-shift-200",
				cornerRadius = UDim.new(0, UseTokensFunction().Size.Size_500)
			}, {
				Text = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = Frame.message.text,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		})
	})
end)