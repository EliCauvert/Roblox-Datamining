local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local useZoomControllerModule = require(parent.Hooks.useZoomController)

return function(p0)
	-- upvalues: useZoomControllerModule (ref), reactModule (ref), view (ref)
	local var2, var3 = useZoomControllerModule(p0.active ~= nil or p0.active)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var2 (ref)
		if p0.onZoomStatusChanged then
			p0.onZoomStatusChanged(var2)
		end
	end, { var2, p0.onZoomStatusChanged })
	
	return reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center size-full bg-action-subtle",
		ZIndex = 1,
		ref = var3
	}, {
		ZoomItem = reactModule.createElement(reactModule.Fragment, nil, p0.children)
	})
end