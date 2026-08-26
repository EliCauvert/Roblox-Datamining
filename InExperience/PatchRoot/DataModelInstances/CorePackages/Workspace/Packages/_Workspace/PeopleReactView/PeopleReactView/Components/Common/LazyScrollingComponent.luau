local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = require(parent.Foundation).View
local fFlagEnablePeopleListLazyRender = require(parent.PeopleService).getService("Flags").FFlagEnablePeopleListLazyRender
local peoplePageLazyRenderThreshold = game:DefineFastInt("PeoplePageLazyRenderThreshold", 100)

function LazyScrollingComponent(p1)
	-- upvalues: reactModule (ref), peoplePageLazyRenderThreshold (ref), signalsModule (ref), view (ref), fFlagEnablePeopleListLazyRender (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: peoplePageLazyRenderThreshold (copy)
		return p2 < p3 + p4 + peoplePageLazyRenderThreshold
	end, {})
	local var4 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var4 (ref), var2 (ref), var3 (ref), p1 (ref), signalsModule (copy)
		if var1 or not var4.current then
			return
		end
		var2(var3(var4.current.AbsolutePosition.Y, p1.scrollingFrameAbsolutePositionY(false), p1.scrollingFrameAbsoluteSizeY(false)))
		local var5 = var4.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: var4 (copy), var2 (copy), var3 (copy), p1 (copy)
			if var4.current then
				var2(var3(var4.current.AbsolutePosition.Y, p1.scrollingFrameAbsolutePositionY(false), p1.scrollingFrameAbsoluteSizeY(false)))
				
				return
			end
		end)
		local var6 = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), var4 (copy), var2 (copy), var3 (copy)
			local _ = p1.scrollingFrameCanvasPositionY(p2)
			local var7 = p1.scrollingFrameAbsolutePositionY(p2)
			local var8 = p1.scrollingFrameAbsoluteSizeY(p2)
			
			if var4.current then
				var2(var3(var4.current.AbsolutePosition.Y, var7, var8))
				
				return
			end
		end)
		
		return function()
			-- upvalues: var5 (ref), var6 (ref)
			if var5 then
				var5:Disconnect()
			end
			var6()
		end
	end, { var1 })
	
	return if var1 then p1.children else reactModule.createElement(view, {
		tag = if fFlagEnablePeopleListLazyRender then "size-full-0 auto-xy" else "auto-xy",
		ref = var4,
		LayoutOrder = p1.placeholderLayoutOrder
	}, { Placeholder = p1.placeholder })
end

return reactModule.memo(LazyScrollingComponent)