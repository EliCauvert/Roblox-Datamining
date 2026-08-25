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

local function _(p0)
	return function(p1)
		-- upvalues: p0 (ref)
		return if p0 then p1.X else p1.Y
	end
end

t.BidirectionalFlatList = reactModule.forwardRef(function(p2, p3)
	-- upvalues: promiseModule (ref), useState (ref), useRef (ref), reactModule (ref), flatListModule (ref), object (ref), viewModule (ref)
	local function promiseFn()
		-- upvalues: promiseModule (copy)
		return promiseModule.resolve()
	end
	
	local _ = if p2.activityIndicatorColor == nil then "black" else p2.activityIndicatorColor
	local var6 = if p2.autoscrollToTopThreshold == nil then 100 else p2.autoscrollToTopThreshold
	local data = p2.data
	local enableAutoscrollToTop = p2.enableAutoscrollToTop
	local footerLoadingIndicator = p2.FooterLoadingIndicator
	local headerLoadingIndicator = p2.HeaderLoadingIndicator
	local listHeaderComponent = p2.ListHeaderComponent
	local listFooterComponent = p2.ListFooterComponent
	local var7 = if p2.onEndReached == nil then promiseFn else p2.onEndReached
	local var8 = if p2.onEndReachedThreshold == nil then 10 else p2.onEndReachedThreshold
	local onScroll = p2.onScroll
	local var9 = if p2.onStartReached == nil then promiseFn else p2.onStartReached
	local var10 = if p2.onStartReachedThreshold == nil then 10 else p2.onStartReachedThreshold
	local var11 = p2.showDefaultLoadingIndicators == nil or p2.showDefaultLoadingIndicators
	local var12 = if p2.enableRetryOnStartReached == nil then false else p2.enableRetryOnStartReached
	local var13 = if p2.enableRetryOnEndReached == nil then false else p2.enableRetryOnEndReached
	local var14, var15 = useState(false)
	local var16, var17 = useState(false)
	local var18, var19 = useState(0)
	local var20 = useRef({})
	local var21 = useRef({})
	local var22 = useRef(nil)
	local var23 = useRef(nil)
	
	local function maybeCallOnStartReached()
		-- upvalues: data (ref), var20 (ref), p2 (ref), var18 (ref), var15 (ref), promiseModule (copy), var22 (ref), var23 (ref), var9 (ref)
		local var26
		if data and #data > 0 and var20.current[#data] then return end
		if p2.inverted then
			var26 = var18 >= 3
			var26 = nil
		else
			var26 = var18 >= 1
		end
		if not var26 then return end
		if data and #data > 0 and var26 then
			var20.current[#data] = true
		end
		var15(true)
		
		local function p()
			-- upvalues: promiseModule (copy), var22 (copy), var15 (copy)
			return promiseModule.new(function(p4)
				-- upvalues: var22 (copy), var15 (copy)
				var22.current = nil
				var15(false)
				p4()
			end)
		end
		
		if var23.current then
			var23.current:andThen(function()
				-- upvalues: var22 (copy), var9 (copy), p (ref)
				var22.current = var9():andThen(p)
			end)
			
			return
		end
		var22.current = var9():andThen(p)
	end
	
	local function maybeCallOnEndReached()
		-- upvalues: data (ref), var21 (ref), p2 (ref), var18 (ref), var17 (ref), promiseModule (copy), var23 (ref), var22 (ref), var7 (ref)
		local var28
		if data and #data > 0 and var21.current[#data] then return end
		if p2.inverted then
			var28 = var18 >= 3
			var28 = nil
		else
			var28 = var18 >= 1
		end
		if not var28 then return end
		if data and #data > 0 and var28 then
			var21.current[#data] = true
		end
		var17(true)
		
		local function p()
			-- upvalues: promiseModule (copy), var23 (copy), var17 (copy)
			return promiseModule.new(function(p5)
				-- upvalues: var23 (copy), var17 (copy)
				var23.current = nil
				var17(false)
				p5()
			end)
		end
		
		if var22.current then
			var22.current:andThen(function()
				-- upvalues: var23 (copy), var7 (copy), p (ref)
				var23.current = var7():andThen(p)
			end)
			
			return
		end
		var23.current = var7():andThen(p)
	end
	
	return reactModule.createElement(reactModule.Fragment, nil, reactModule.createElement(flatListModule, object.assign(table.clone(p2), {
		renderItem = function(p6)
			-- upvalues: reactModule (copy), viewModule (copy), p3 (ref), p2 (ref), enableAutoscrollToTop (ref), var6 (ref)
			local item = p6.item
			
			return reactModule.createElement(viewModule, {
				BorderSizePixel = 0,
				name = "resize",
				onLayout = function(p7)
					-- upvalues: p3 (copy), p2 (copy), item (ref), enableAutoscrollToTop (copy), var6 (copy)
					local var30 = if p3 and p3.current then p3.current._listRef._scrollRef.getNativeScrollRef()._nativeRef.current else nil
					local horizontal = p2.horizontal
					
					local var31 = function(p8)
						-- upvalues: horizontal (ref)
						return if horizontal then p8.X else p8.Y
					end
					
					if item.shouldResizeOnMount and var30 then
						local var32 = var31(p7.AbsoluteSize)
						
						if var32 <= 0 or var30 == nil then
							item.shouldResizeOnMount = false
							
							return
						end
						local canvasPosition = var30.CanvasPosition
						local absoluteSize = var30.AbsoluteSize
						local absoluteCanvasSize = var30.AbsoluteCanvasSize
						local var33 = if enableAutoscrollToTop then var6 else nil
						
						if var33 and (if p2.inverted then var31(absoluteCanvasSize) - var31(canvasPosition) - var31(absoluteSize) else var31(canvasPosition)) < var33 then
							item.shouldResizeOnMount = false
							var30.CanvasPosition = if p2.inverted then if p2.horizontal then Vector2.new(var31(absoluteCanvasSize) - var31(absoluteSize), var30.CanvasPosition.Y) else Vector2.new(var30.CanvasPosition.X, var31(absoluteCanvasSize) - var31(absoluteSize)) elseif p2.horizontal then Vector2.new(0, var30.CanvasPosition.Y) else Vector2.new(var30.CanvasPosition.X, 0)
							
							return
						end
						local var34 = if p2.inverted then if p2.horizontal then Vector2.new(canvasPosition.X - var32, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y - var32) elseif p2.horizontal then Vector2.new(canvasPosition.X + var32, canvasPosition.Y) else Vector2.new(canvasPosition.X, canvasPosition.Y + var32)
						item.shouldResizeOnMount = false
						var30.CanvasPosition = var34
					end
				end,
				AutomaticSize = if p2.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
				Size = if p2.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
			}, { child = p2.renderItem(p6) })
		end,
		ref = p3,
		ListHeaderComponent = function()
			-- upvalues: var11 (ref), listHeaderComponent (ref), reactModule (copy), var14 (ref), headerLoadingIndicator (ref)
			if var11 then
				if not var14 then
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
			-- upvalues: var11 (ref), listFooterComponent (ref), reactModule (copy), var16 (ref), footerLoadingIndicator (ref)
			if var11 then
				if not var16 then
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
		onScroll = function(p9)
			-- upvalues: var19 (ref), onScroll (ref), p2 (ref), var10 (ref), var8 (ref), maybeCallOnStartReached (ref), var12 (ref), data (ref), var20 (ref), maybeCallOnEndReached (ref), var13 (ref), var21 (ref)
			var19(function(p10)
				return p10 + 1
			end)
			
			if onScroll then
				onScroll(p9)
			end
			local var35 = p9:GetChildren()[1]
			local horizontal = p2.horizontal
			
			local var36 = function(p11)
				-- upvalues: horizontal (ref)
				return if horizontal then p11.X else p11.Y
			end
			
			local var37 = var36(p9.AbsoluteSize)
			local var38 = if p2.inverted then var36(p9.AbsoluteCanvasSize) - var36(p9.CanvasPosition) - var37 else var36(p9.CanvasPosition)
			local var39 = var36(var35.AbsoluteSize) - var37 - var38 < var8
			
			if var38 < var10 then
				maybeCallOnStartReached()
			elseif var12 and data and (#data > 0 and var20.current[#data]) then
				var20.current[#data] = false
			end
			if var39 then
				maybeCallOnEndReached()
				
				return
			elseif var13 and data and (#data > 0 and var21.current[#data]) then
				var21.current[#data] = false
			end
		end,
		maintainVisibleContentPosition = {
			minIndexForVisible = 1,
			autoscrollToTopThreshold = if enableAutoscrollToTop then var6 else nil
		}
	})))
end)

return t