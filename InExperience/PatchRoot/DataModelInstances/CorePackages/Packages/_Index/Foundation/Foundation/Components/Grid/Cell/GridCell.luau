local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getGridSizeTagModule = require(foundation.Utility.getGridSizeTag)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { size = 1, testId = "--foundation-grid--cell" }

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), dashModule (ref), reactModule (ref), getGridSizeTagModule (ref), viewModule (ref)
	local var1 = withDefaultsModule(p1, t)
	
	return reactModule.createElement(viewModule, dashModule.assign(dashModule.omit(var1, { "size" }), {
		tag = table.concat({
			reactModule.useMemo(function()
				-- upvalues: getGridSizeTagModule (copy), var1 (ref)
				return getGridSizeTagModule(var1.size)
			end, { var1.size }),
			var1.tag
		}, " "),
		ref = p2
	}), var1.children)
end))