local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = require(parent.Foundation).View
local fFlagEnablePeopleListLazyRender = require(parent.PeopleService).getService("Flags").FFlagEnablePeopleListLazyRender
local peoplePageLazyRenderThreshold = game:DefineFastInt("PeoplePageLazyRenderThreshold", 100)

function LazyScrollingComponent(p0) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), peoplePageLazyRenderThreshold (ref), signalsModule (ref), view (ref), fFlagEnablePeopleListLazyRender (ref)
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useCallback(function(p1, p2, p3) --[[ line: 33 ]]
		-- upvalues: peoplePageLazyRenderThreshold (copy)
		return p1 < p2 + p3 + peoplePageLazyRenderThreshold
	end, {})
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 41 ]]
		-- upvalues: var3 (ref), var6 (ref), var4 (ref), var5 (ref), p0 (ref), signalsModule (copy)
		if var3 or not var6.current then
			return
		end
		var4(var5(var6.current.AbsolutePosition.Y, p0.scrollingFrameAbsolutePositionY(false), p0.scrollingFrameAbsoluteSizeY(false)))
		local var7 = var6.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ line: 59 ]]
			-- upvalues: var6 (copy), var4 (copy), var5 (copy), p0 (copy)
			if var6.current then
				var4(var5(var6.current.AbsolutePosition.Y, p0.scrollingFrameAbsolutePositionY(false), p0.scrollingFrameAbsoluteSizeY(false)))
				
				return
			end
		end)
		local var8 = signalsModule.createEffect(function(p4) --[[ line: 74 ]]
			-- upvalues: p0 (copy), var6 (copy), var4 (copy), var5 (copy)
			local _ = p0.scrollingFrameCanvasPositionY(p4)
			local var9 = p0.scrollingFrameAbsolutePositionY(p4)
			local var10 = p0.scrollingFrameAbsoluteSizeY(p4)
			
			if var6.current then
				var4(var5(var6.current.AbsolutePosition.Y, var9, var10))
				
				return
			end
		end)
		
		return function() --[[ line: 89 ]]
			-- upvalues: var7 (ref), var8 (ref)
			if var7 then
				var7:Disconnect()
			end
			var8()
		end
	end, { var3 })
	
	return if var3 then p0.children else reactModule.createElement(view, {
		tag = if fFlagEnablePeopleListLazyRender then "size-full-0 auto-xy" else "auto-xy",
		ref = var6,
		LayoutOrder = p0.placeholderLayoutOrder
	}, { Placeholder = p0.placeholder })
end

return reactModule.memo(LazyScrollingComponent)