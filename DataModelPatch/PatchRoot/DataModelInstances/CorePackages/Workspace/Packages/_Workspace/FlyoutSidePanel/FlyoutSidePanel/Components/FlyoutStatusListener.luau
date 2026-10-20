local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseDrawerVisibleFunction = require(Parent.Drawer).Hooks.useDrawerVisible

return function(p1)
	-- upvalues: UseDrawerVisibleFunction (copy), ReactModule (copy)
	local UseDrawerVisibleResult = UseDrawerVisibleFunction()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseDrawerVisibleResult (copy)
		if p1.onVisibleChanged then
			p1.onVisibleChanged(UseDrawerVisibleResult)
		end
	end, { UseDrawerVisibleResult, p1.onVisibleChanged })
	
	return nil
end