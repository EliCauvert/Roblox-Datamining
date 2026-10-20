local CollectionViews = script:FindFirstAncestor("CollectionViews")
local Parent = CollectionViews.Parent
local ReactModule = require(Parent.React)
local CalculateItemWidthModule = require(CollectionViews.calculateItemWidth)
local UseStoreFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
local LuaAppFixCollectionSizeBindingsZero = game:DefineFastFlag("LuaAppFixCollectionSizeBindingsZero", false)

local function getItemSize(p1, p2, p3, X, p4, Callback, p5): Vector2
	-- upvalues: CalculateItemWidthModule (copy)
	local ItemWidthModule = CalculateItemWidthModule(p1, p2, p3, X, p4, p5)
	
	return Vector2.new(ItemWidthModule, (Callback(ItemWidthModule)))
end

return function(p1, p2, p3, p4, Callback, Callback1, p5)
	-- upvalues: UseStoreFunction (copy), ReactModule (copy), getItemSize (copy), LuaAppFixCollectionSizeBindingsZero (copy), CalculateItemWidthModule (copy)
	local UseStoreResult = UseStoreFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	
	if UseBindingResult:getValue() == Vector2.zero then
		UseBindingResult2(UseStoreResult:getState().ScreenSize)
	end
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(getItemSize(p1, p2, p3, UseBindingResult:getValue() and UseBindingResult:getValue().X or 0, p4, Callback, p5))
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: LuaAppFixCollectionSizeBindingsZero (upval), Callback1 (copy), UseBindingResult2 (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy), Callback (copy), p5 (copy), CalculateItemWidthModule (upval), UseBindingResult2_1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if LuaAppFixCollectionSizeBindingsZero and AbsoluteSize.X == 0 then return end
		if Callback1 then
			Callback1(AbsoluteSize)
		end
		UseBindingResult2(AbsoluteSize)
		local ItemWidthModule = CalculateItemWidthModule(p1, p2, p3, AbsoluteSize and AbsoluteSize.X or 0, p4, p5)
		UseBindingResult2_1((Vector2.new(ItemWidthModule, (Callback(ItemWidthModule)))))
	end, {
		p1, p2, p3, p4, Callback, Callback1, p5
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseResult (copy)
		if UseStateResult then
			UseResult(UseStateResult)
		end
	end, { UseResult, UseStateResult })
	
	return UseBindingResult1, UseBindingResult, UseResult, UseStateResult2
end