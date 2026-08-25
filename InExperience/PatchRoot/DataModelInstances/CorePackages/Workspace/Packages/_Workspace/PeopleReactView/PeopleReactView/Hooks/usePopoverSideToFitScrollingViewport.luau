local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getScrollingFrameStoreModule = require(peopleReactView.Stores.GetScrollingFrameStore)
local popoverSide = foundationModule.Enums.PopoverSide

local function choosePopoverSideForViewport(p0, p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: popoverSide (ref)
	if p6 <= 0 then
		return p0
	end
	local var7 = p6 + p7
	local var8 = p2 - p4
	local var9 = p5 - p3
	
	local function _(p8)
		-- upvalues: popoverSide (copy), var8 (ref), var9 (ref)
		return if p8 == popoverSide.Top then var8 else var9
	end
	
	local _ = function(p9)
		-- upvalues: popoverSide (copy), var8 (ref), var9 (ref), var7 (ref)
		return var7 <= (if p9 == popoverSide.Top then var8 else var9)
	end
	
	local var10 = if p1 ~= nil then p0 else p1
	
	if var7 <= (if var10 == popoverSide.Top then var8 else var9) then
		return var10
	end
	local var11 = if var10 == popoverSide.Top then popoverSide.Bottom else popoverSide.Top
	
	return if var7 <= (if var11 == popoverSide.Top then var8 else var9) then var11 elseif var8 < var9 then popoverSide.Bottom else popoverSide.Top
end

return function(p10, p11, p12, p13, p14)
	-- upvalues: signalsReactModule (ref), getScrollingFrameStoreModule (ref), reactModule (ref), choosePopoverSideForViewport (ref), signalsModule (ref)
	local var12 = signalsReactModule.useSignalState(getScrollingFrameStoreModule)
	local var13, var14 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: p10 (ref), var14 (ref), p12 (ref), var12 (ref), choosePopoverSideForViewport (copy), p11 (ref), p13 (ref), p14 (ref), signalsModule (copy)
		if not p10 then
			var14(nil)
			
			return
		end
		local function updateSide()
			-- upvalues: p12 (copy), var12 (copy), var14 (copy), choosePopoverSideForViewport (copy), p11 (copy), p13 (copy), p14 (copy)
			local current = p12.current
			
			if not current then return end
			local absolutePositionY = var12.getAbsolutePositionY(false)
			local absoluteSizeY = var12.getAbsoluteSizeY(false)
			
			if absoluteSizeY <= 0 then
				return
			end
			local y = current.AbsolutePosition.Y
			local var20 = y + current.AbsoluteSize.Y
			local var21 = absolutePositionY + absoluteSizeY
			var14(function(p15)
				-- upvalues: choosePopoverSideForViewport (copy), p11 (copy), y (ref), var20 (ref), absolutePositionY (ref), var21 (ref), p13 (copy), p14 (copy)
				return choosePopoverSideForViewport(p11, p15, y, var20, absolutePositionY, var21, p13, p14)
			end)
		end
		
		local var16 = signalsModule.createEffect(function(p16)
			-- upvalues: var12 (copy), updateSide (ref)
			local _ = var12.getCanvasPositionY(p16)
			local _ = var12.getAbsolutePositionY(p16)
			local _ = var12.getAbsoluteSizeY(p16)
			updateSide()
		end)
		local t = {}
		
		if p12.current then
			table.insert(t, p12.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateSide))
			table.insert(t, p12.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSide))
		end
		return function()
			-- upvalues: var16 (ref), t (ref)
			var16()
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p10,
		p11,
		p13,
		p14,
		var12
	})
	
	return if p10 then var13 or p11 else p11
end