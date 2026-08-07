local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local getDrawerVisibleStore = require(parent.Drawer).Stores.GetDrawerVisibleStore

return function() --[[ line: 9 | named "useDismissFlyoutOnPartyTopBanner" ]]
	-- upvalues: useSetDrawerVisible (ref), useSelector (ref), reactModule (ref), getDrawerVisibleStore (ref)
	local var1 = useSetDrawerVisible()
	local var2 = useSelector(function(p0) --[[ line: 12 ]]
		return if p0.AppTopBanner then p0.AppTopBanner.expanded else false
	end)
	local var3 = reactModule.useRef(var2)
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: getDrawerVisibleStore (copy), var3 (ref), var2 (ref), var1 (ref)
		if getDrawerVisibleStore(false).getDrawerVisible() and var3.current and not var2 then
			var1(false)
		end
		var3.current = var2
	end, { var2, var1 })
end