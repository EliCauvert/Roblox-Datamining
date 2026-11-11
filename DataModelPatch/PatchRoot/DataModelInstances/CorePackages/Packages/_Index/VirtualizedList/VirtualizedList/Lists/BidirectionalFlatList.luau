local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Object = require(Parent1.LuauPolyfill).Object
local PromiseModule = require(Parent1.Promise)
local ReactModule = require(Parent1.React)
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local ViewModule = require(Parent.Components.View.View)
local FlatListModule = require(script.Parent.FlatList)

local function _(p1)
	return function(AbsoluteSize)
		-- upvalues: p1 (copy)
		return if p1 then AbsoluteSize.X else AbsoluteSize.Y
	end
end

return {
	BidirectionalFlatList = ReactModule.forwardRef(function(Tbl, Ref)
		-- upvalues: PromiseModule (copy), UseStateFunction (copy), UseRefFunction (copy), ReactModule (copy), FlatListModule (copy), Object (copy), ViewModule (copy)
		local function promiseFn()
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve()
		end
		
		if Tbl.activityIndicatorColor ~= nil then
			local _ = Tbl.activityIndicatorColor
		end
		local AutoscrollToTopThreshold = if Tbl.autoscrollToTopThreshold == nil then 100 else Tbl.autoscrollToTopThreshold
		local Data = Tbl.data
		local EnableAutoscrollToTop = Tbl.enableAutoscrollToTop
		local FooterLoadingIndicator = Tbl.FooterLoadingIndicator
		local HeaderLoadingIndicator = Tbl.HeaderLoadingIndicator
		local ListHeaderComponent = Tbl.ListHeaderComponent
		local ListFooterComponent = Tbl.ListFooterComponent
		local PromiseFn = if Tbl.onEndReached == nil then promiseFn else Tbl.onEndReached
		local OnEndReachedThreshold = if Tbl.onEndReachedThreshold == nil then 10 else Tbl.onEndReachedThreshold
		local OnScrollFunction = Tbl.onScroll
		local PromiseFn1 = if Tbl.onStartReached == nil then promiseFn else Tbl.onStartReached
		local OnStartReachedThreshold = if Tbl.onStartReachedThreshold == nil then 10 else Tbl.onStartReachedThreshold
		local NoShowDefaultLoadingIndicators = Tbl.showDefaultLoadingIndicators == nil or Tbl.showDefaultLoadingIndicators
		local EnableRetryOnStartReached = Tbl.enableRetryOnStartReached ~= nil and Tbl.enableRetryOnStartReached
		local EnableRetryOnEndReached = Tbl.enableRetryOnEndReached ~= nil and Tbl.enableRetryOnEndReached
		local UseStateResult, UseStateResult2 = UseStateFunction(false)
		local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
		local UseStateResult3, UseStateResult2_2 = UseStateFunction(0)
		local UseRefResult = UseRefFunction({})
		local UseRefResult1 = UseRefFunction({})
		local UseRefResult2 = UseRefFunction(nil)
		local UseRefResult3 = UseRefFunction(nil)
		
		local function maybeCallOnStartReached()
			-- upvalues: Data (copy), UseRefResult (copy), Tbl (copy), UseStateResult3 (copy), UseStateResult2 (copy), PromiseModule (upval), UseRefResult2 (copy), UseRefResult3 (copy), PromiseFn1 (copy)
			if Data and #Data > 0 and UseRefResult.current[#Data] then return end
			local IsUseStateResultAbove: boolean = if Tbl.inverted then UseStateResult3 >= 3 else UseStateResult3 >= 1
			
			if not IsUseStateResultAbove then return end
			if Data and #Data > 0 and IsUseStateResultAbove then
				UseRefResult.current[#Data] = true
			end
			UseStateResult2(true)
			
			local function p()
				-- upvalues: PromiseModule (upval), UseRefResult2 (upval), UseStateResult2 (upval)
				return PromiseModule.new(function(Callback: () -> ())
					-- upvalues: UseRefResult2 (upval), UseStateResult2 (upval)
					UseRefResult2.current = nil
					UseStateResult2(false)
					Callback()
				end)
			end
			
			if UseRefResult3.current then
				UseRefResult3.current:andThen(function()
					-- upvalues: UseRefResult2 (upval), PromiseFn1 (upval), p (copy)
					UseRefResult2.current = PromiseFn1():andThen(p)
				end)
				
				return
			else
				UseRefResult2.current = PromiseFn1():andThen(p)
			end
		end
		
		local function maybeCallOnEndReached()
			-- upvalues: Data (copy), UseRefResult1 (copy), Tbl (copy), UseStateResult3 (copy), UseStateResult2_1 (copy), PromiseModule (upval), UseRefResult3 (copy), UseRefResult2 (copy), PromiseFn (copy)
			if Data and #Data > 0 and UseRefResult1.current[#Data] then return end
			local IsUseStateResultAbove: boolean = if Tbl.inverted then UseStateResult3 >= 3 else UseStateResult3 >= 1
			
			if not IsUseStateResultAbove then return end
			if Data and #Data > 0 and IsUseStateResultAbove then
				UseRefResult1.current[#Data] = true
			end
			UseStateResult2_1(true)
			
			local function p()
				-- upvalues: PromiseModule (upval), UseRefResult3 (upval), UseStateResult2_1 (upval)
				return PromiseModule.new(function(Callback: () -> ())
					-- upvalues: UseRefResult3 (upval), UseStateResult2_1 (upval)
					UseRefResult3.current = nil
					UseStateResult2_1(false)
					Callback()
				end)
			end
			
			if UseRefResult2.current then
				UseRefResult2.current:andThen(function()
					-- upvalues: UseRefResult3 (upval), PromiseFn (upval), p (copy)
					UseRefResult3.current = PromiseFn():andThen(p)
				end)
				
				return
			else
				UseRefResult3.current = PromiseFn():andThen(p)
			end
		end
		
		return ReactModule.createElement(ReactModule.Fragment, nil, ReactModule.createElement(FlatListModule, Object.assign(table.clone(Tbl), {
			renderItem = function(p1)
				-- upvalues: ReactModule (upval), ViewModule (upval), Ref (copy), Tbl (copy), EnableAutoscrollToTop (copy), AutoscrollToTopThreshold (copy)
				local Item = p1.item
				
				return ReactModule.createElement(ViewModule, {
					BorderSizePixel = 0,
					name = "resize",
					onLayout = function(Frame)
						-- upvalues: Ref (upval), Tbl (upval), Item (copy), EnableAutoscrollToTop (upval), AutoscrollToTopThreshold (upval)
						local Current = if Ref and Ref.current then Ref.current._listRef._scrollRef.getNativeScrollRef()._nativeRef.current else nil
						local Horizontal = Tbl.horizontal
						
						local function v50(AbsoluteSize)
							-- upvalues: Horizontal (copy)
							return if Horizontal then AbsoluteSize.X else AbsoluteSize.Y
						end
						
						if Item.shouldResizeOnMount and Current then
							local v1: number = v50(Frame.AbsoluteSize)
							
							if v1 <= 0 or Current == nil then
								Item.shouldResizeOnMount = false
								
								return
							end
							local CanvasPosition = Current.CanvasPosition
							local AbsoluteSize = Current.AbsoluteSize
							local AbsoluteCanvasSize = Current.AbsoluteCanvasSize
							local AutoscrollToTopThreshold1 = if EnableAutoscrollToTop then AutoscrollToTopThreshold else nil
							
							if AutoscrollToTopThreshold1 and (if Tbl.inverted then v50(AbsoluteCanvasSize) - v50(CanvasPosition) - v50(AbsoluteSize) else v50(CanvasPosition)) < AutoscrollToTopThreshold1 then
								Item.shouldResizeOnMount = false
								Current.CanvasPosition = if Tbl.inverted then if Tbl.horizontal then Vector2.new(v50(AbsoluteCanvasSize) - v50(AbsoluteSize), Current.CanvasPosition.Y) else Vector2.new(Current.CanvasPosition.X, v50(AbsoluteCanvasSize) - v50(AbsoluteSize)) elseif Tbl.horizontal then Vector2.new(0, Current.CanvasPosition.Y) else Vector2.new(Current.CanvasPosition.X, 0)
								
								return
							end
							Item.shouldResizeOnMount = false
							Current.CanvasPosition = if Tbl.inverted then if Tbl.horizontal then Vector2.new(CanvasPosition.X - v1, CanvasPosition.Y) else Vector2.new(CanvasPosition.X, CanvasPosition.Y - v1) elseif Tbl.horizontal then Vector2.new(CanvasPosition.X + v1, CanvasPosition.Y) else Vector2.new(CanvasPosition.X, CanvasPosition.Y + v1)
						end
					end,
					AutomaticSize = if Tbl.horizontal then Enum.AutomaticSize.X else Enum.AutomaticSize.Y,
					Size = if Tbl.horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0)
				}, { child = Tbl.renderItem(p1) })
			end,
			ref = Ref,
			ListHeaderComponent = function()
				-- upvalues: NoShowDefaultLoadingIndicators (copy), ListHeaderComponent (copy), ReactModule (upval), UseStateResult (copy), HeaderLoadingIndicator (copy)
				if not NoShowDefaultLoadingIndicators then
					return if ListHeaderComponent then ReactModule.createElement(ListHeaderComponent, nil) else nil
				end
				if not UseStateResult then
					return nil
				end
				if HeaderLoadingIndicator then
					return ReactModule.createElement(HeaderLoadingIndicator, nil)
				end
				if _G.__DEV__ then
					warn("default activity indicator not available")
				end
				return nil
			end,
			ListFooterComponent = function()
				-- upvalues: NoShowDefaultLoadingIndicators (copy), ListFooterComponent (copy), ReactModule (upval), UseStateResult1 (copy), FooterLoadingIndicator (copy)
				if not NoShowDefaultLoadingIndicators then
					return if ListFooterComponent then ReactModule.createElement(ListFooterComponent, nil) else nil
				end
				if not UseStateResult1 then
					return nil
				end
				if FooterLoadingIndicator then
					return ReactModule.createElement(FooterLoadingIndicator, nil)
				end
				if _G.__DEV__ then
					warn("default activity indicator not available")
				end
				return nil
			end,
			onEndReached = Object.None,
			onScroll = function(ScrollFrame)
				-- upvalues: UseStateResult2_2 (copy), OnScrollFunction (copy), Tbl (copy), OnStartReachedThreshold (copy), OnEndReachedThreshold (copy), maybeCallOnStartReached (copy), EnableRetryOnStartReached (copy), Data (copy), UseRefResult (copy), maybeCallOnEndReached (copy), EnableRetryOnEndReached (copy), UseRefResult1 (copy)
				UseStateResult2_2(function(p1: number): number
					return p1 + 1
				end)
				
				if OnScrollFunction then
					OnScrollFunction(ScrollFrame)
				end
				local Child = ScrollFrame:GetChildren()[1]
				local Horizontal = Tbl.horizontal
				
				local function v42(AbsoluteSize)
					-- upvalues: Horizontal (copy)
					return if Horizontal then AbsoluteSize.X else AbsoluteSize.Y
				end
				
				local v1 = v42(ScrollFrame.AbsoluteSize)
				local v2 = if Tbl.inverted then v42(ScrollFrame.AbsoluteCanvasSize) - v42(ScrollFrame.CanvasPosition) - v1 else v42(ScrollFrame.CanvasPosition)
				local IsOnStartReachedThresholdAbove = v2 < OnStartReachedThreshold
				local IsOnEndReachedThresholdAbove = v42(Child.AbsoluteSize) - v1 - v2 < OnEndReachedThreshold
				
				if IsOnStartReachedThresholdAbove then
					maybeCallOnStartReached()
				elseif EnableRetryOnStartReached and Data and #Data > 0 and UseRefResult.current[#Data] then
					UseRefResult.current[#Data] = false
				end
				if IsOnEndReachedThresholdAbove then
					maybeCallOnEndReached()
					
					return
				end
				if EnableRetryOnEndReached and Data and #Data > 0 and UseRefResult1.current[#Data] then
					UseRefResult1.current[#Data] = false
				end
			end,
			maintainVisibleContentPosition = {
				minIndexForVisible = 1,
				autoscrollToTopThreshold = if EnableAutoscrollToTop then AutoscrollToTopThreshold else nil
			}
		})))
	end)
}