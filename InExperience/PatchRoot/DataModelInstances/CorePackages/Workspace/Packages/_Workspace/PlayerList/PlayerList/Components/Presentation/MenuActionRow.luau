local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local playerListIconModule = require(parent.Common.PlayerListIcon)

return reactModule.memo(function(p0) --[[ line: 13 | named "MenuActionRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), playerListIconModule (ref), text (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-left align-y-center gap-medium size-full-1000 auto-y",
		LayoutOrder = p0.layoutOrder,
		onActivated = p0.onActivated
	}, {
		Icon = if p0.icon ~= nil then nil else reactModule.createElement(playerListIconModule, {
			layoutOrder = 1,
			icon = p0.icon,
			size = useTokens().Size.Size_500
		}),
		Label = reactModule.createElement(text, {
			tag = "auto-xy text-body-medium text-align-x-left content-default",
			LayoutOrder = 2,
			Text = p0.label
		})
	})
end)