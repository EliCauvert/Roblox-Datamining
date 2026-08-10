local collectionViews = script:FindFirstAncestor("CollectionViews")
local parent = collectionViews.Parent
local reactModule = require(parent.React)
local calculateItemWidthModule = require(collectionViews.calculateItemWidth)
local useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
local luaAppFixCollectionSizeBindingsZero = game:DefineFastFlag("LuaAppFixCollectionSizeBindingsZero", false)

local function getItemSize(p0, p1, p2, p3, p4, p5, p6) --[[ line: 12 ]]
	-- upvalues: calculateItemWidthModule (ref)
	local var5 = calculateItemWidthModule(p0, p1, p2, p3, p4, p6)
	
	return Vector2.new(var5, p5(var5))
end

return function(p7, p8, p9, p10, p11, p12, p13) --[[ line: 31 | named "useCollectionSizeBindings" ]]
	-- upvalues: useStore (ref), reactModule (ref), getItemSize (ref), luaAppFixCollectionSizeBindingsZero (ref), calculateItemWidthModule (ref)
	local var6 = useStore()
	local var7, var8 = reactModule.useBinding(Vector2.zero)
	
	if var7:getValue() == Vector2.zero then
		var8(var6:getState().ScreenSize)
	end
	local var9, var10 = reactModule.useBinding(getItemSize(p7, p8, p9, var7:getValue() and var7:getValue().X or 0, p10, p11, p13))
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useCallback(function(p14) --[[ line: 60 ]]
		-- upvalues: luaAppFixCollectionSizeBindingsZero (copy), p12 (ref), var8 (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), p11 (ref), p13 (ref), calculateItemWidthModule (copy), var10 (ref)
		local absoluteSize = p14.AbsoluteSize
		
		if luaAppFixCollectionSizeBindingsZero and absoluteSize.X == 0 then return end
		if p12 then
			p12(absoluteSize)
		end
		var8(absoluteSize)
		local var14 = calculateItemWidthModule(p7, p8, p9, if absoluteSize then absoluteSize.X else 0, p10, p13)
		var10(Vector2.new(var14, p11(var14)))
	end, {
		p7, p8, p9, p10, p11, p12, p13
	})
	reactModule.useEffect(function() --[[ line: 93 ]]
		-- upvalues: var11 (ref), var13 (ref)
		if var11 then
			var13(var11)
		end
	end, { var13, var11 })
	
	return var9, var7, var13, var12
end