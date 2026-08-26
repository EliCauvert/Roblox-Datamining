local var1 = script:FindFirstAncestor("ultimate-list")
local _ = require(var1.Dimensions)
local dimensionsMethodsModule = require(var1.Dimensions.DimensionsMethods)
local reactModule = require(var1.Parent.React)
local _ = require(var1.Renderers)
local adjustPositionToScrollAxisModule = require(var1.Dimensions.adjustPositionToScrollAxis)
local _ = require(var1.createVirtualizedListController)
local joinAndMapBindingsModule = require(var1.Util.joinAndMapBindings)
local createElement = reactModule.createElement

local function getKeyDefault(_, p1)
	return tostring(p1)
end

return function(p1)
	-- upvalues: reactModule (ref), getKeyDefault (ref), dimensionsMethodsModule (ref), createElement (ref), joinAndMapBindingsModule (ref), adjustPositionToScrollAxisModule (ref)
	local var2, var3 = reactModule.useState(p1.virtualizedListController.get)
	local var4, var5 = reactModule.useBinding(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), var5 (ref), var3 (ref)
		local var6 = var2
		
		return p1.virtualizedListController.bindToUpdate(function()
			-- upvalues: var5 (copy), var6 (write), p1 (copy), var3 (copy)
			var5({
				lockedTo = var6,
				scrollAxis = p1.scrollAxisBinding:getValue()
			})
			var6 = p1.virtualizedListController.get()
			var3(var6)
		end)
	end, { p1.virtualizedListController, p1.scrollAxisBinding })
	local t = {}
	local getKey = p1.getKey or getKeyDefault
	local range = p1.virtualizedListController.getRange()
	
	for i, v in var2 do
		local var6 = range.X + (i - 1)
		local uDimRect = dimensionsMethodsModule.getUDimRect(p1.dimensions, v, var6, p1.virtualizedListController.getWindowSize(), p1.direction)
		t[getKey(v, var6)] = createElement("Frame", {
			BackgroundTransparency = 1,
			Position = joinAndMapBindingsModule(function(p2, p3)
				-- upvalues: p1 (ref), var2 (ref), adjustPositionToScrollAxisModule (copy), uDimRect (ref)
				return if p1.config.freezeViewWhileScrolling == false or p3 == nil or p3.lockedTo ~= var2 then adjustPositionToScrollAxisModule(uDimRect.position, p2, p1.direction) else adjustPositionToScrollAxisModule(uDimRect.position, p3.scrollAxis, p1.direction)
			end, p1.scrollAxisBinding, var4),
			Size = uDimRect.size
		}, p1.callback(v))
	end
	return createElement(reactModule.Fragment, nil, t)
end