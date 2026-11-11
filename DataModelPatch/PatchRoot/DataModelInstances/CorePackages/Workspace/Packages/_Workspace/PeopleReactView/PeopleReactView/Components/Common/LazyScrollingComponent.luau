local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View
local FFlagEnablePeopleListLazyRender = require(Parent.PeopleService).getService("Flags").FFlagEnablePeopleListLazyRender
local PeoplePageLazyRenderThreshold = game:DefineFastInt("PeoplePageLazyRenderThreshold", 100)

function LazyScrollingComponent(p1)
	-- upvalues: ReactModule (copy), PeoplePageLazyRenderThreshold (copy), SignalsModule (copy), View (copy), FFlagEnablePeopleListLazyRender (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(p2, p3, p4): boolean
		-- upvalues: PeoplePageLazyRenderThreshold (upval)
		return p2 < p3 + p4 + PeoplePageLazyRenderThreshold
	end, {})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), UseStateResult2 (copy), UseResult (copy), p1 (copy), SignalsModule (upval)
		if UseStateResult or not UseRefResult.current then return end
		UseStateResult2(UseResult(UseRefResult.current.AbsolutePosition.Y, p1.scrollingFrameAbsolutePositionY(false), p1.scrollingFrameAbsoluteSizeY(false)))
		local Connection = UseRefResult.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: UseRefResult (upval), UseStateResult2 (upval), UseResult (upval), p1 (upval)
			if UseRefResult.current then
				UseStateResult2(UseResult(UseRefResult.current.AbsolutePosition.Y, p1.scrollingFrameAbsolutePositionY(false), p1.scrollingFrameAbsoluteSizeY(false)))
				
				return
			end
		end)
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (upval), UseRefResult (upval), UseStateResult2 (upval), UseResult (upval)
			local _ = p1.scrollingFrameCanvasPositionY(p2)
			local ScrollingFrameAbsolutePositionYResult = p1.scrollingFrameAbsolutePositionY(p2)
			local ScrollingFrameAbsoluteSizeYResult = p1.scrollingFrameAbsoluteSizeY(p2)
			
			if UseRefResult.current then
				UseStateResult2(UseResult(UseRefResult.current.AbsolutePosition.Y, ScrollingFrameAbsolutePositionYResult, ScrollingFrameAbsoluteSizeYResult))
				
				return
			end
		end)
		
		return function()
			-- upvalues: Connection (copy), Effect (copy)
			if Connection then
				Connection:Disconnect()
			end
			Effect()
		end
	end, { UseStateResult })
	
	return if UseStateResult then p1.children else ReactModule.createElement(View, {
		tag = if FFlagEnablePeopleListLazyRender then "size-full-0 auto-xy" else "auto-xy",
		ref = UseRefResult,
		LayoutOrder = p1.placeholderLayoutOrder
	}, { Placeholder = p1.placeholder })
end

return ReactModule.memo(LazyScrollingComponent)