local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible

return function(p1)
	-- upvalues: useDrawerVisible (ref), reactModule (ref)
	local var1 = useDrawerVisible()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.onVisibleChanged then
			p1.onVisibleChanged(var1)
		end
	end, { var1, p1.onVisibleChanged })
	
	return nil
end