local songbird = script:FindFirstAncestor("Songbird")
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local useCallback = reactModule.useCallback
local createNextOrder = require(songbird.Parent.ReactUtils).createNextOrder
local useTokens = foundationModule.Hooks.useTokens
local t = { iconSize = foundationModule.Enums.IconSize.Medium }

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), createNextOrder (ref), useTokens (ref), useCallback (ref), foundationModule (ref), reactModule (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local var6 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y row gap-small padding-small align-y-center radius-medium",
		onStateChanged = useCallback(function(p1)
			-- upvalues: foundationModule (copy), var5 (ref)
			if p1 == foundationModule.Enums.ControlState.Pressed and var5.onActivated then
				var5.onActivated()
			end
		end, { var5.onActivated }),
		LayoutOrder = var5.LayoutOrder
	}, {
		Icon = if var5.icon then reactModule.createElement(foundationModule.Icon, {
			name = var5.icon,
			size = var5.iconSize,
			style = useTokens().Color.Content.Emphasis,
			LayoutOrder = var6()
		}) else nil,
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy content-default text-label-large",
			Text = var5.text,
			LayoutOrder = var6()
		})
	})
end