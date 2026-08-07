local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local text = foundationModule.Text
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p0) --[[ line: 19 | named "ChatUserMessage" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "row gap-small size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder
	}, {
		Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill" }),
		Message = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-right gap-xsmall auto-y",
			Size = UDim2.new(0.78, 0, 0, 0)
		}, {
			Bubble = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "auto-xy padding-medium bg-shift-200",
				cornerRadius = UDim.new(0, useTokens().Size.Size_500)
			}, {
				Text = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-emphasis",
					Text = p0.message.text,
					Size = UDim2.new(1, 0, 0, 0)
				})
			})
		})
	})
end)