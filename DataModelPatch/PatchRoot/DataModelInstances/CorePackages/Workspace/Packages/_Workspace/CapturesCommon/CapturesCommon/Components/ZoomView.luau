local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local View = require(Parent1.Foundation).View
local UseZoomControllerModule = require(Parent.Hooks.useZoomController)

return function(p1)
	-- upvalues: UseZoomControllerModule (copy), ReactModule (copy), View (copy)
	local UseZoomControllerModuleResult, UseZoomControllerModuleResult2 = UseZoomControllerModule(p1.active == nil or p1.active)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseZoomControllerModuleResult (copy)
		if p1.onZoomStatusChanged then
			p1.onZoomStatusChanged(UseZoomControllerModuleResult)
		end
	end, { UseZoomControllerModuleResult, p1.onZoomStatusChanged })
	
	return ReactModule.createElement(View, {
		tag = "anchor-center-center position-center-center size-full bg-action-subtle",
		ZIndex = 1,
		ref = UseZoomControllerModuleResult2
	}, {
		ZoomItem = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	})
end