local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local GetDrawerVisibleStoreFunction = require(Parent.Drawer).Stores.GetDrawerVisibleStore

return function()
	-- upvalues: UseSetDrawerVisibleFunction (copy), UseSelectorFunction (copy), ReactModule (copy), GetDrawerVisibleStoreFunction (copy)
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		return if p1.AppTopBanner then p1.AppTopBanner.expanded else false
	end)
	local UseRefResult = ReactModule.useRef(UseSelectorResult)
	ReactModule.useEffect(function()
		-- upvalues: GetDrawerVisibleStoreFunction (upval), UseRefResult (copy), UseSelectorResult (copy), UseSetDrawerVisibleResult (copy)
		if GetDrawerVisibleStoreFunction(false).getDrawerVisible() and UseRefResult.current and not UseSelectorResult then
			UseSetDrawerVisibleResult(false)
		end
		UseRefResult.current = UseSelectorResult
	end, { UseSelectorResult, UseSetDrawerVisibleResult })
end