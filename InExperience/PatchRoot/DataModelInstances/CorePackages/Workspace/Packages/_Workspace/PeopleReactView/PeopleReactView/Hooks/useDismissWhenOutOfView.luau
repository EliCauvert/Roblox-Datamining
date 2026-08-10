local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)

local function _(p0, p1, p2, p3) --[[ line: 10 | named "isGuiObjectOutOfScrollingFrameView" ]]
	return if p0 + p1 >= p2 then p2 + p3 < p0 else true
end

return function(p4, p5, p6) --[[ line: 24 | named "useDismissWhenOutOfView" ]]
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var5 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: p4 (ref), p6 (ref), var5 (ref), p5 (ref), signalsModule (copy)
		if p4 then
			local var6 = false
			
			local function dismissIfOutOfView() --[[ line: 34 ]]
				-- upvalues: var6 (write), p6 (copy), var5 (copy), p5 (copy)
				if var6 then return end
				local current = p6.current
				
				if not current then return end
				local absoluteSizeY = var5.getAbsoluteSizeY(false)
				
				if absoluteSizeY <= 0 then return end
				local y = current.AbsolutePosition.Y
				local absolutePositionY = var5.getAbsolutePositionY(false)
				
				if if y + current.AbsoluteSize.Y >= absolutePositionY then absolutePositionY + absoluteSizeY < y else true then
					var6 = true
					p5()
				end
			end
			
			local var8 = signalsModule.createEffect(function(p7) --[[ line: 62 ]]
				-- upvalues: var5 (copy), dismissIfOutOfView (ref)
				local _ = var5.getCanvasPositionY(p7)
				local _ = var5.getAbsolutePositionY(p7)
				local _ = var5.getAbsoluteSizeY(p7)
				dismissIfOutOfView()
			end)
			local var9 = if p6.current then p6.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(dismissIfOutOfView) else nil
			
			return function() --[[ line: 77 ]]
				-- upvalues: var8 (ref), var9 (write)
				var8()
				
				if var9 then
					var9:Disconnect()
				end
			end
		end
	end, { p4, p5, var5 })
end