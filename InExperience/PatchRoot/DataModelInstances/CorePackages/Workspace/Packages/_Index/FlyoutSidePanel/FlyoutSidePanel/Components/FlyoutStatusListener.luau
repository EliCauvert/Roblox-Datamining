local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useDrawerVisible = require(parent.Drawer).Hooks.useDrawerVisible

return function(p0)
	-- upvalues: useDrawerVisible (ref), reactModule (ref)
	local var1 = useDrawerVisible()
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var1 (ref)
		if p0.onVisibleChanged then
			p0.onVisibleChanged(var1)
		end
	end, { var1, p0.onVisibleChanged })
	
	return nil
end