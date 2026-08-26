local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local view = require(parent_1.Foundation).View
local useZoomControllerModule = require(parent.Hooks.useZoomController)

return function(p1)
	-- upvalues: useZoomControllerModule (ref), reactModule (ref), view (ref)
	local var1, var2 = useZoomControllerModule(p1.active ~= nil or p1.active)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var1 (ref)
		if p1.onZoomStatusChanged then
			p1.onZoomStatusChanged(var1)
		end
	end, { var1, p1.onZoomStatusChanged })
	
	return reactModule.createElement(view, {
		tag = "anchor-center-center position-center-center size-full bg-action-subtle",
		ZIndex = 1,
		ref = var2
	}, {
		ZoomItem = reactModule.createElement(reactModule.Fragment, nil, p1.children)
	})
end