local var0 = script:FindFirstAncestor("ultimate-list")
local _ = require(var0.Dimensions)
local dimensionsMethodsModule = require(var0.Dimensions.DimensionsMethods)
local reactModule = require(var0.Parent.React)
local _ = require(var0.Renderers)
local adjustPositionToScrollAxisModule = require(var0.Dimensions.adjustPositionToScrollAxis)
local _ = require(var0.createVirtualizedListController)
local joinAndMapBindingsModule = require(var0.Util.joinAndMapBindings)
local createElement = reactModule.createElement

local function getKeyDefault(_, p0) --[[ line: 13 ]]
	return tostring(p0)
end

return function(p1) --[[ line: 23 | named "ReactStateRenderer" ]]
	-- upvalues: reactModule (ref), getKeyDefault (ref), dimensionsMethodsModule (ref), createElement (ref), joinAndMapBindingsModule (ref), adjustPositionToScrollAxisModule (ref)
	local var6, var7 = reactModule.useState(p1.virtualizedListController.get)
	local var8, var9 = reactModule.useBinding(nil)
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: var6 (ref), p1 (ref), var9 (ref), var7 (ref)
		local var15 = var6
		
		return p1.virtualizedListController.bindToUpdate(function() --[[ line: 42 ]]
			-- upvalues: var9 (copy), var15 (write), p1 (copy), var7 (copy)
			var9({
				lockedTo = var15,
				scrollAxis = p1.scrollAxisBinding:getValue()
			})
			var15 = p1.virtualizedListController.get()
			var7(var15)
		end)
	end, { p1.virtualizedListController, p1.scrollAxisBinding })
	local t = {}
	local getKey = p1.getKey or getKeyDefault
	local range = p1.virtualizedListController.getRange()
	
	for i, v in var6 do
		local var13 = range.X + (i - 1)
		local uDimRect = dimensionsMethodsModule.getUDimRect(p1.dimensions, v, var13, p1.virtualizedListController.getWindowSize(), p1.direction)
		t[getKey(v, var13)] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindingsModule(function(p2, p3) --[[ line: 70 ]]
				-- upvalues: p1 (ref), var6 (ref), adjustPositionToScrollAxisModule (copy), uDimRect (ref)
				return if p1.config.freezeViewWhileScrolling == false or p3 == nil or p3.lockedTo ~= var6 then adjustPositionToScrollAxisModule(uDimRect.position, p2, p1.direction) else adjustPositionToScrollAxisModule(uDimRect.position, p3.scrollAxis, p1.direction)
			end, p1.scrollAxisBinding, var8),
			Size = uDimRect.size
		}, p1.callback(v))
	end
	return createElement(reactModule.Fragment, nil, t)
end