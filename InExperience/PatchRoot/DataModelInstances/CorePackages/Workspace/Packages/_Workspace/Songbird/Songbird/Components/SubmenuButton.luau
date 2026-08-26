local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local useCallback = reactModule.useCallback
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder
local useTokens = foundationModule.Hooks.useTokens
local t = { iconSize = foundationModule.Enums.IconSize.Medium }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useTokens (ref), useCallback (ref), foundationModule (ref), reactModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y row gap-small padding-small align-y-center radius-medium",
		onStateChanged = useCallback(function(p2)
			-- upvalues: foundationModule (copy), var1 (ref)
			if p2 == foundationModule.Enums.ControlState.Pressed and var1.onActivated then
				var1.onActivated()
			end
		end, { var1.onActivated }),
		LayoutOrder = var1.LayoutOrder
	}, {
		Icon = if var1.icon then reactModule.createElement(foundationModule.Icon, {
			name = var1.icon,
			size = var1.iconSize,
			style = useTokens().Color.Content.Emphasis,
			LayoutOrder = var2()
		}) else nil,
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy content-default text-label-large",
			Text = var1.text,
			LayoutOrder = var2()
		})
	})
end