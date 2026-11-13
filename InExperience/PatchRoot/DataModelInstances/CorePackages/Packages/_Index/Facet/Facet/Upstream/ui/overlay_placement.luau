local FreezeModule = require("./freeze")
local FreezeModuleResult = FreezeModule({
	top = true,
	bottom = true,
	leading = true,
	trailing = true
})
local FreezeModuleResult1 = FreezeModule({ start = true, center = true, ["end"] = true })
local FreezeModuleResult2 = FreezeModule({
	top = "bottom",
	bottom = "top",
	left = "right",
	right = "left"
})

local function _(p1)
	return if p1 == "leading" then "left" elseif p1 == "trailing" then "right" else p1
end

local _ = function(p1): boolean
	return p1 == "top" or p1 == "bottom"
end

local OverlayPlacementModule = {
	assertEdge = function(Edge, p1)
		-- upvalues: FreezeModuleResult (copy)
		if Edge ~= nil and (type(Edge) ~= "string" or not FreezeModuleResult[Edge]) then
			error(`Facet {p1}: edge must be top, bottom, leading or trailing (got {tostring(Edge)})`, 0)
		end
	end,
	assertAlign = function(Align, p1)
		-- upvalues: FreezeModuleResult1 (copy)
		if Align ~= nil and (type(Align) ~= "string" or not FreezeModuleResult1[Align]) then
			error(`Facet {p1}: align must be start, center or end (got {tostring(Align)})`, 0)
		end
	end,
	assertCrossOffset = function(Value: number, p1)
		if Value ~= nil and (type(Value) ~= "number" or Value ~= Value or math.abs(Value) == 1e999) then
			error(`Facet {p1}: crossOffset must be a finite number of pixels (got {tostring(Value)})`, 0)
		end
	end,
	width = function(Vector, p1, Vector1, p2): number
		return if p1.h <= math.max(Vector.y - p2 - Vector1.y, Vector1.y + Vector1.h - Vector.y - Vector.h - p2) then math.min(p1.w, Vector1.w) else math.min(p1.w, Vector1.w, (math.max(1, Vector.x - p2 - Vector1.x, Vector1.x + Vector1.w - Vector.x - Vector.w - p2)))
	end
}

function OverlayPlacementModule.solve(p1)
	-- upvalues: OverlayPlacementModule (copy), FreezeModuleResult2 (copy)
	OverlayPlacementModule.assertEdge(p1.edge, "placement")
	OverlayPlacementModule.assertAlign(p1.align, "placement")
	OverlayPlacementModule.assertCrossOffset(p1.crossOffset, "placement")
	local Source = p1.source
	local Size = p1.size
	local Safe = p1.safe
	local Gap = p1.gap or 0
	local Largest = math.max(p1.tail or 0, 0)
	local Largest1 = math.max(p1.tailInset or 0, 0)
	local Align = p1.align or "center"
	local Edge = p1.edge or "bottom"
	local Left = if Edge == "leading" then "left" elseif Edge == "trailing" then "right" else Edge
	
	local function _(p2)
		-- upvalues: Source (copy), Gap (copy), Size (copy)
		return if p2 == "bottom" then Source.y + Source.h + Gap elseif p2 == "top" then Source.y - Gap - Size.h elseif p2 == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
	end
	
	local _ = function(p2): boolean
		-- upvalues: Source (copy), Gap (copy), Size (copy), Safe (copy)
		local NewY = if p2 == "bottom" then Source.y + Source.h + Gap elseif p2 == "top" then Source.y - Gap - Size.h elseif p2 == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
		
		return if p2 == "top" or p2 == "bottom" then Safe.y <= NewY and NewY + Size.h <= Safe.y + Safe.h else Safe.x <= NewY and NewY + Size.w <= Safe.x + Safe.w
	end
	
	local Edge1 = Left
	local Flag = false
	local NewY = if Left == "bottom" then Source.y + Source.h + Gap elseif Left == "top" then Source.y - Gap - Size.h elseif Left == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
	local IsTop: boolean = Left == "top" or Left == "bottom"
	
	if not (if IsTop then Safe.y <= NewY and NewY + Size.h <= Safe.y + Safe.h else Safe.x <= NewY and NewY + Size.w <= Safe.x + Safe.w) then
		local FreezeModuleResultEntry = FreezeModuleResult2[Left]
		local NewY1 = if FreezeModuleResultEntry == "bottom" then Source.y + Source.h + Gap elseif FreezeModuleResultEntry == "top" then Source.y - Gap - Size.h elseif FreezeModuleResultEntry == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
		local IsTop1: boolean = FreezeModuleResultEntry == "top" or FreezeModuleResultEntry == "bottom"
		
		if if IsTop1 then Safe.y <= NewY1 and NewY1 + Size.h <= Safe.y + Safe.h else Safe.x <= NewY1 and NewY1 + Size.w <= Safe.x + Safe.w then
			Edge1 = FreezeModuleResultEntry
			Flag = true
		else
			local IsTop11: boolean = Left == "top" or Left == "bottom"
			local List = if IsTop11 then { "right", "left" } else { "bottom", "top" }
			for _, value in List do
				local IsTop2: boolean = value == "top" or value == "bottom"
				
				if if IsTop2 then Size.w <= Safe.w else Size.h <= Safe.h then
					local NewY11 = if value == "bottom" then Source.y + Source.h + Gap elseif value == "top" then Source.y - Gap - Size.h elseif value == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
					local IsTop3: boolean = value == "top" or value == "bottom"
					
					if if IsTop3 then Safe.y <= NewY11 and NewY11 + Size.h <= Safe.y + Safe.h else Safe.x <= NewY11 and NewY11 + Size.w <= Safe.x + Safe.w then
						Edge1 = value
						Flag = true
						break
					end
				end
			end
		end
	end
	local IsTop4: boolean = Edge1 == "top" or Edge1 == "bottom"
	local NewY2 = if Edge1 == "bottom" then Source.y + Source.h + Gap elseif Edge1 == "top" then Source.y - Gap - Size.h elseif Edge1 == "right" then Source.x + Source.w + Gap else Source.x - Gap - Size.w
	local Y = if IsTop4 then Safe.y else Safe.x
	local YDelta = Y + (if IsTop4 then Safe.h else Safe.w) - (if IsTop4 then Size.h else Size.w)
	local Value: number = NewY2
	
	if p1.overflow ~= "keep" then
		Value = math.clamp(Value, Y, (math.max(Y, YDelta)))
	end
	local W = if IsTop4 then Size.w else Size.h
	local X = if IsTop4 then Source.x else Source.y
	local W1 = if IsTop4 then Source.w else Source.h
	local Value1 = (if Align == "start" then X elseif Align == "end" then X + W1 - W else X + W1 / 2 - W / 2) + (p1.crossOffset or 0)
	local X1 = if IsTop4 then Safe.x else Safe.y
	local ClampedValue = math.clamp(Value1, X1, (math.max(X1, X1 + (if IsTop4 then Safe.w else Safe.h) - W)))
	local Config = if IsTop4 then { x = ClampedValue, y = Value, w = Size.w, h = Size.h } else { x = Value, y = ClampedValue, w = Size.w, h = Size.h }
	local IsYBelow: boolean = Safe.x <= Config.x and (Safe.y <= Config.y and Config.x + Config.w <= Safe.x + Safe.w) and Config.y + Config.h <= Safe.y + Safe.h
	local X2 = nil
	local Y1 = nil
	local TailSuppressed = true
	
	if Largest > 0 then
		local LargestRatio = Largest / 2
		local Smallest = math.min(ClampedValue + Largest1 + LargestRatio, ClampedValue + W / 2)
		local ClampedValue1 = math.clamp(X + W1 / 2, Smallest, (math.max(ClampedValue + W - Largest1 - LargestRatio, Smallest)))
		TailSuppressed = Value ~= NewY2 or (ClampedValue1 < X or X + W1 < ClampedValue1)
		
		if IsTop4 then
			X2 = ClampedValue1
			Y1 = if Edge1 == "bottom" then Config.y else Config.y + Config.h
		else
			X2 = if Edge1 == "right" then Config.x else Config.x + Config.w
			Y1 = ClampedValue1
		end
	end
	return {
		x = Config.x,
		y = Config.y,
		w = Config.w,
		h = Config.h,
		edge = Edge1,
		flipped = Flag,
		shift = ClampedValue - Value1,
		fits = IsYBelow,
		tailX = X2,
		tailY = Y1,
		tailSuppressed = TailSuppressed
	}
end

function OverlayPlacementModule.touch(Vector, Size, Safe, p2: number)
	-- upvalues: OverlayPlacementModule (copy)
	local IsYBelow = Safe.y <= Vector.y - p2 - Size.h
	local IsXBelow: boolean = Vector.x + p2 + Size.w <= Safe.x + Safe.w or Safe.x <= Vector.x - p2 - Size.w
	
	return OverlayPlacementModule.solve({
		source = {
			x = Vector.x - p2,
			y = Vector.y - p2,
			w = p2 * 2,
			h = p2 * 2
		},
		size = Size,
		safe = Safe,
		edge = if IsYBelow or not IsXBelow then "top" else "trailing"
	})
end

return OverlayPlacementModule