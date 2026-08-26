local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local calculateItemWidthModule = require(collectionViews.calculateItemWidth)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local luaAppFixCollectionSizeBindingsZero = game:DefineFastFlag("LuaAppFixCollectionSizeBindingsZero", false)

local function getItemSize(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: calculateItemWidthModule (ref)
	local var1 = calculateItemWidthModule(p1, p2, p3, p4, p5, p7)
	
	return Vector2.new(var1, p6(var1))
end

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: useStore (ref), reactModule (ref), getItemSize (ref), luaAppFixCollectionSizeBindingsZero (ref), calculateItemWidthModule (ref)
	local var1 = useStore()
	local var2, var3 = reactModule.useBinding(Vector2.zero)
	
	if var2:getValue() == Vector2.zero then
		var3(var1:getState().ScreenSize)
	end
	local var4, var5 = reactModule.useBinding(getItemSize(p1, p2, p3, var2:getValue() and var2:getValue().X or 0, p4, p5, p7))
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useCallback(function(p8)
		-- upvalues: luaAppFixCollectionSizeBindingsZero (copy), p6 (ref), var3 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p7 (ref), calculateItemWidthModule (copy), var5 (ref)
		local absoluteSize = p8.AbsoluteSize
		
		if luaAppFixCollectionSizeBindingsZero and absoluteSize.X == 0 then return end
		if p6 then
			p6(absoluteSize)
		end
		var3(absoluteSize)
		local var9 = calculateItemWidthModule(p1, p2, p3, if absoluteSize then absoluteSize.X else 0, p4, p7)
		var5(Vector2.new(var9, p5(var9)))
	end, {
		p1, p2, p3, p4, p5, p6, p7
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var8 (ref)
		if var6 then
			var8(var6)
		end
	end, { var8, var6 })
	
	return var4, var2, var8, var7
end