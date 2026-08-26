local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)

local function _(p1, p2, p3, p4)
	return if p1 + p2 >= p3 then p3 + p4 < p1 else true
end

return function(p1, p2, p3)
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref), signalsModule (ref)
	local var1 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p3 (ref), var1 (ref), p2 (ref), signalsModule (copy)
		if p1 then
			local var2 = false
			
			local function dismissIfOutOfView()
				-- upvalues: var2 (write), p3 (copy), var1 (copy), p2 (copy)
				if var2 then return end
				local current = p3.current
				
				if not current then return end
				local absoluteSizeY = var1.getAbsoluteSizeY(false)
				
				if absoluteSizeY <= 0 then return end
				local y = current.AbsolutePosition.Y
				local absolutePositionY = var1.getAbsolutePositionY(false)
				
				if if y + current.AbsoluteSize.Y >= absolutePositionY then absolutePositionY + absoluteSizeY < y else true then
					var2 = true
					p2()
				end
			end
			
			local var3 = signalsModule.createEffect(function(p4)
				-- upvalues: var1 (copy), dismissIfOutOfView (ref)
				local _ = var1.getCanvasPositionY(p4)
				local _ = var1.getAbsolutePositionY(p4)
				local _ = var1.getAbsoluteSizeY(p4)
				dismissIfOutOfView()
			end)
			local var4 = if p3.current then p3.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(dismissIfOutOfView) else nil
			
			return function()
				-- upvalues: var3 (ref), var4 (write)
				var3()
				
				if var4 then
					var4:Disconnect()
				end
			end
		end
	end, { p1, p2, var1 })
end