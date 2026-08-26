local parent = script.Parent.Parent
local parent_1 = parent.Parent
local object = require(parent_1.LuauPolyfill).Object
local promiseModule = require(parent_1.Promise)
local t = {}
local reactModule = require(parent_1.React)
local useRef = reactModule.useRef
local useState = reactModule.useState
local viewModule = require(parent.Components.View.View)
local flatListModule = require(script.Parent.FlatList)

local function _(p1)
	return function(p2)
		-- upvalues: p1 (ref)
		return if p1 then p2.X else p2.Y
	end
end

t.BidirectionalFlatList = reactModule.forwardRef(function(p1, p2)
	-- upvalues: promiseModule (ref), useState (ref), useRef (ref), reactModule (ref), flatListModule (ref), object (ref), viewModule (ref)
	local function promiseFn()
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve()
	end
	
	local _ = if p1.activityIndicatorColor == nil then "black" else p1.activityIndicatorColor
	local var1 = if p1.autoscrollToTopThreshold == nil then 100 else p1.autoscrollToTopThreshold
	local data = p1.data
	local enableAutoscrollToTop = p1.enableAutoscrollToTop
	local footerLoadingIndicator = p1.FooterLoadingIndicator
	local headerLoadingIndicator = p1.HeaderLoadingIndicator
	local listHeaderComponent = p1.ListHeaderComponent
	local listFooterComponent = p1.ListFooterComponent
	local var2 = if p1.onEndReached == nil then promiseFn else p1.onEndReached
	local var3 = if p1.onEndReachedThreshold == nil then 10 else p1.onEndReachedThreshold
	local onScroll = p1.onScroll
	local var4 = if p1.onStartReached == nil then promiseFn else p1.onStartReached
	local var5 = if p1.onStartReachedThreshold == nil then 10 else p1.onStartReachedThreshold
	local var6 = p1.showDefaultLoadingIndicators == nil or p1.showDefaultLoadingIndicators
	local var7 = if p1.enableRetryOnStartReached == nil then false else p1.enableRetryOnStartReached
	local var8 = if p1.enableRetryOnEndReached == nil then false else p1.enableRetryOnEndReached
	local var9, var10 = useState(false)
	local var11, var12 = useState(false)
	local var13, var14 = useState(0)
	local var15 = useRef({})
	local var16 = useRef({})
	local var17 = useRef(nil)
	local var18 = useRef(nil)
	
	local function maybeCallOnStartReached()
		-- upvalues: data (ref), var15 (ref), p1 (ref), var13 (ref), var10 (ref), promiseModule (copy), var17 (ref), var18 (ref), var4 (ref)
		local var19
		if data and #data > 0 and var15.current[#data] then return end
		if p1.inverted then
			var19 = var13 >= 3
			var19 = nil
		else
			var19 = var13 >= 1
		end
		if not var19 then return end
		if data and #data > 0 and var19 then
			var15.current[#data] = true
		end
		var10(true)
		
		local function p()
			-- upvalues: promiseModule (copy), var17 (copy), var10 (copy)
			return promiseModule.new(function(p3)
				-- upvalues: var17 (copy), var10 (copy)
				var17.current = nil
				var10(false)
				p3()
			end)
		end
		
		if var18.current then
			var18.current:andThen(function()
				-- upvalues: var17 (copy), var4 (copy), p (ref)
				var17.current = var4():andThen(p)
			end)
			
			return
		end
		var17.current = var4():andThen(p)
	end
	
	local function maybeCallOnEndReached()
		-- upvalues: data (ref), var16 (ref), p1 (ref), var13 (ref), var12 (ref), promiseModule (copy), var18 (ref), var17 (ref), var2 (ref)
		local var19
		if data and #data > 0 and var16.current[#data] then return end
		if p1.inverted then
			var19 = var13 >= 3
			var19 = nil
		else
			var19 = var13 >= 1
		end
		if not var19 then return end
		if data and #data > 0 and var19 then
			var16.current[#data] = true
		end
		var12(true)
		
		local function p()
			-- upvalues: promiseModule (copy), var18 (copy), var12 (copy)
			return promiseModule.new(function(p3)
				-- upvalues: var18 (copy), var12 (copy)
				var18.current = nil
				var12(false)
				p3()
			end)
		end
		
		if var17.current then
			var17.current:andThen(function()
				-- upvalues: var18 (copy), var2 (copy), p (ref)
				var18.current = var2():andThen(p)
			end)
			
			return
		end
		var18.current = var2():andThen(p)
	end
	
	return reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement(flatListModule, object.assign(table.clone(p1), {
		renderItem = function(p3)
			-- upvalues: reactModule (copy), viewModule (copy), p2 (ref), p1 (ref), enableAutoscrollToTop (ref), var1 (ref)
			local item = p3.item
			
			return reactModule.createElement(viewModule, {
				BorderSizePixel = 0,
				name = "resize",
				onLayout = function(p4)
					-- upvalues: p2 (copy), p1 (copy), item (ref), enableAutoscrollToTop (copy), var1 (copy)
					local var19 = if p2 and p2.current then p2.current._listRef._scrollRef.getNativeScrollRef()._nativeRef.current else nil
					local horizontal = p1.horizontal
					
					local var20 = function(p5)
						-- upvalues: horizontal (ref)
						return if horizontal then p5.X else p5.Y
					end
					
					if item.shouldResizeOnMount and var19 then
						local var21 = var20(p4.AbsoluteSize)
						
						if var21 <= 0 or var19 == nil then
							item.shouldResizeOnMount = false
							
							return
						end
						local canvasPosition = var19.CanvasPosition
						local absoluteSize = var19.AbsoluteSize
						local absoluteCanvasSize = var19.AbsoluteCanvasSize
						local var22 = if enableAutoscrollToTop then var1 else nil
						
						if var22 and (if p1.inverted then var20(absoluteCanvasSize) - var20(canvasPosition) - var20(absoluteSize) else var20(canvasPosition)) < var22 then
							item.shouldResizeOnMount = false
							var19.CanvasPosition = if p1.inverted then if p1.horizontal then Vector2.new(var20(absoluteCanvasSize) - var20(absoluteSize), var19.CanvasPosition.Y) else Vector2.new(var19.CanvasPosition.X, var20(absoluteCanvasSize) - var20(absoluteSize)) elseif p1.horizontal then Vector2.new(0, var19.CanvasPosition.Y) else Vector2.new(var19.CanvasPosition.X, 0)
							
							return
						end
						local var23 = if p1.inverted then if p1.horizontal then Vector2.new(canvasPosition.X - var21, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y - var21) elseif p1.horizontal then Vector2.new(canvasPosition.X + var21, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var21)
						item.shouldResizeOnMount = false
						var19.CanvasPosition = var23
					end
				end,
				AutomaticSize = if p1.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
				Size = if p1.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
			}, { child = p1.renderItem(p3) })
		end,
		ref = p2,
		ListHeaderComponent = function()
			-- upvalues: var6 (ref), listHeaderComponent (ref), reactModule (copy), var9 (ref), headerLoadingIndicator (ref)
			if var6 then
				if not var9 then
					return nil
				elseif headerLoadingIndicator then
					return reactModule.createElement(headerLoadingIndicator, nil)
				elseif _G.__DEV__ then
					warn("default activity indicator not available")
				end
				return nil
			else
				return if listHeaderComponent then reactModule.createElement(listHeaderComponent, nil) else nil
			end
		end,
		ListFooterComponent = function()
			-- upvalues: var6 (ref), listFooterComponent (ref), reactModule (copy), var11 (ref), footerLoadingIndicator (ref)
			if var6 then
				if not var11 then
					return nil
				elseif footerLoadingIndicator then
					return reactModule.createElement(footerLoadingIndicator, nil)
				elseif _G.__DEV__ then
					warn("default activity indicator not available")
				end
				return nil
			else
				return if listFooterComponent then reactModule.createElement(listFooterComponent, nil) else nil
			end
		end,
		onEndReached = object.None,
		onScroll = function(p3)
			-- upvalues: var14 (ref), onScroll (ref), p1 (ref), var5 (ref), var3 (ref), maybeCallOnStartReached (ref), var7 (ref), data (ref), var15 (ref), maybeCallOnEndReached (ref), var8 (ref), var16 (ref)
			var14(function(p4)
				return p4 + 1
			end)
			
			if onScroll then
				onScroll(p3)
			end
			local var19 = p3:GetChildren()[1]
			local horizontal = p1.horizontal
			
			local var20 = function(p4)
				-- upvalues: horizontal (ref)
				return if horizontal then p4.X else p4.Y
			end
			
			local var21 = var20(p3.AbsoluteSize)
			local var22 = if p1.inverted then var20(p3.AbsoluteCanvasSize) - var20(p3.CanvasPosition) - var21 else var20(p3.CanvasPosition)
			local var23 = var20(var19.AbsoluteSize) - var21 - var22 < var3
			
			if var22 < var5 then
				maybeCallOnStartReached()
			elseif var7 and data and (#data > 0 and var15.current[#data]) then
				var15.current[#data] = false
			end
			if var23 then
				maybeCallOnEndReached()
				
				return
			elseif var8 and data and (#data > 0 and var16.current[#data]) then
				var16.current[#data] = false
			end
		end,
		maintainVisibleContentPosition = {
			minIndexForVisible = 1,
			autoscrollToTopThreshold = if enableAutoscrollToTop then var1 else nil
		}
	})))
end)

return t