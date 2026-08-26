local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)
local popoverSide = foundationModule.Enums.PopoverSide

local function choosePopoverSideForViewport(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: popoverSide (ref)
	if p7 <= 0 then
		return p1
	end
	local var1 = p7 + p8
	local var2 = p3 - p5
	local var3 = p6 - p4
	
	local function _(p9)
		-- upvalues: popoverSide (copy), var2 (ref), var3 (ref)
		return if p9 == popoverSide.Top then var2 else var3
	end
	
	local _ = function(p9)
		-- upvalues: popoverSide (copy), var2 (ref), var3 (ref), var1 (ref)
		return var1 <= (if p9 == popoverSide.Top then var2 else var3)
	end
	
	local var4 = if p2 ~= nil then p1 else p2
	
	if var1 <= (if var4 == popoverSide.Top then var2 else var3) then
		return var4
	end
	local var5 = if var4 == popoverSide.Top then popoverSide.Bottom else popoverSide.Top
	
	return if var1 <= (if var5 == popoverSide.Top then var2 else var3) then var5 elseif var2 < var3 then popoverSide.Bottom else popoverSide.Top
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref), choosePopoverSideForViewport (ref), signalsModule (ref)
	local var1 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), p3 (ref), var1 (ref), choosePopoverSideForViewport (copy), p2 (ref), p4 (ref), p5 (ref), signalsModule (copy)
		if not p1 then
			var3(nil)
			
			return
		end
		local function updateSide()
			-- upvalues: p3 (copy), var1 (copy), var3 (copy), choosePopoverSideForViewport (copy), p2 (copy), p4 (copy), p5 (copy)
			local current = p3.current
			
			if not current then return end
			local absolutePositionY = var1.getAbsolutePositionY(false)
			local absoluteSizeY = var1.getAbsoluteSizeY(false)
			
			if absoluteSizeY <= 0 then
				return
			end
			local y = current.AbsolutePosition.Y
			local var4 = y + current.AbsoluteSize.Y
			local var5 = absolutePositionY + absoluteSizeY
			var3(function(p6)
				-- upvalues: choosePopoverSideForViewport (copy), p2 (copy), y (ref), var4 (ref), absolutePositionY (ref), var5 (ref), p4 (copy), p5 (copy)
				return choosePopoverSideForViewport(p2, p6, y, var4, absolutePositionY, var5, p4, p5)
			end)
		end
		
		local var4 = signalsModule.createEffect(function(p6)
			-- upvalues: var1 (copy), updateSide (ref)
			local _ = var1.getCanvasPositionY(p6)
			local _ = var1.getAbsolutePositionY(p6)
			local _ = var1.getAbsoluteSizeY(p6)
			updateSide()
		end)
		local t = {}
		
		if p3.current then
			table.insert(t, p3.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateSide))
			table.insert(t, p3.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSide))
		end
		return function()
			-- upvalues: var4 (ref), t (ref)
			var4()
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p1,
		p2,
		p4,
		p5,
		var1
	})
	
	return if p1 then var2 or p2 else p2
end