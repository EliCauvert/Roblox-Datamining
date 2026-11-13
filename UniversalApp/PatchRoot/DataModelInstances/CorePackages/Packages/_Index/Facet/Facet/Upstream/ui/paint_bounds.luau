local function _(p1, p2, p3, p4, p5, p6)
	local v1 = p3 + p2 - p4
	local v2 = if v1 > 0 and p6 < v1 * p5 then p6 / v1 else p5
	
	return if p1 <= p3 then p1 * v2 elseif p4 <= p1 then p6 - (p2 - p1) * v2 else p3 * v2 + (p1 - p3) / (p4 - p3) * (p6 - v1 * v2)
end

return table.freeze({
	measure = function(Buf, Width: number, Height: number)
		local X0: number = Width
		local Y0: number = Height
		local X1 = 0
		local Y1 = 0
		
		for i = 0, Height - 1 do
			local Offset = i * Width * 4 + 3
			
			for i1 = 0, Width - 1 do
				if buffer.readu8(Buf, Offset) >= 26 then
					if i1 < X0 then
						X0 = i1
					end
					if X1 <= i1 then
						X1 = i1 + 1
					end
					if i < Y0 then
						Y0 = i
					end
					Y1 = i + 1
				end
				Offset += 4
			end
		end
		if X1 <= X0 or Y1 <= Y0 then
			X0 = 0
			Y0 = 0
			X1 = 0
			Y1 = 0
		end
		return {
			x0 = X0,
			y0 = Y0,
			x1 = X1,
			y1 = Y1,
			width = Width,
			height = Height
		}
	end,
	place = function(Vector, p1, p2, p3, p4: number)
		local NewX = Vector.x + Vector.width / 2
		local NewY = Vector.y + Vector.height / 2
		
		if p1.x1 <= p1.x0 or p1.y1 <= p1.y0 or p1.width <= 0 or p1.height <= 0 then
			return { width = 0, height = 0, x = NewX, y = NewY }
		end
		local Largest = 0
		local Largest1 = 0
		local Width = Vector.width
		local Height = Vector.height
		
		if p2 == "Slice" and p3 ~= nil and p3.x0 < p3.x1 and p3.y0 < p3.y1 then
			local X0 = p1.x0
			local Width1 = p1.width
			local X0_1 = p3.x0
			local X1 = p3.x1
			local Scale = p3.scale
			local Width2 = Vector.width
			local XDelta = X0_1 + Width1 - X1
			local WidthRatio = if XDelta > 0 and Width2 < XDelta * Scale then Width2 / XDelta else Scale
			Largest = if X0 <= X0_1 then X0 * WidthRatio elseif X1 <= X0 then Width2 - (Width1 - X0) * WidthRatio else X0_1 * WidthRatio + (X0 - X0_1) / (X1 - X0_1) * (Width2 - XDelta * WidthRatio)
			local X11 = p1.x1
			local Width3 = p1.width
			local X01 = p3.x0
			local X1_1 = p3.x1
			local Scale1 = p3.scale
			local Width4 = Vector.width
			local XDelta1 = X01 + Width3 - X1_1
			local WidthRatio1 = if XDelta1 > 0 and Width4 < XDelta1 * Scale1 then Width4 / XDelta1 else Scale1
			Width = if X11 <= X01 then X11 * WidthRatio1 elseif X1_1 <= X11 then Width4 - (Width3 - X11) * WidthRatio1 else X01 * WidthRatio1 + (X11 - X01) / (X1_1 - X01) * (Width4 - XDelta1 * WidthRatio1)
			local Y0 = p1.y0
			local Height1 = p1.height
			local Y0_1 = p3.y0
			local Y1 = p3.y1
			local Scale2 = p3.scale
			local Height2 = Vector.height
			local YDelta = Y0_1 + Height1 - Y1
			local HeightRatio = if YDelta > 0 and Height2 < YDelta * Scale2 then Height2 / YDelta else Scale2
			Largest1 = if Y0 <= Y0_1 then Y0 * HeightRatio elseif Y1 <= Y0 then Height2 - (Height1 - Y0) * HeightRatio else Y0_1 * HeightRatio + (Y0 - Y0_1) / (Y1 - Y0_1) * (Height2 - YDelta * HeightRatio)
			local Y11 = p1.y1
			local Height3 = p1.height
			local Y01 = p3.y0
			local Y1_1 = p3.y1
			local Scale3 = p3.scale
			local Height4 = Vector.height
			local YDelta1 = Y01 + Height3 - Y1_1
			local HeightRatio1 = if YDelta1 > 0 and Height4 < YDelta1 * Scale3 then Height4 / YDelta1 else Scale3
			Height = if Y11 <= Y01 then Y11 * HeightRatio1 elseif Y1_1 <= Y11 then Height4 - (Height3 - Y11) * HeightRatio1 else Y01 * HeightRatio1 + (Y11 - Y01) / (Y1_1 - Y01) * (Height4 - YDelta1 * HeightRatio1)
		elseif p2 ~= "Tile" then
			local WidthRatio = Vector.width / p1.width
			local HeightRatio = Vector.height / p1.height
			
			if p2 == "Fit" then
				WidthRatio = math.min(WidthRatio, HeightRatio)
				HeightRatio = WidthRatio
			elseif p2 == "Crop" then
				WidthRatio = math.max(WidthRatio, HeightRatio)
				HeightRatio = WidthRatio
			end
			local WidthRatio1 = (Vector.width - p1.width * WidthRatio) / 2
			local HeightRatio1 = (Vector.height - p1.height * HeightRatio) / 2
			Largest = math.max(0, WidthRatio1 + p1.x0 * WidthRatio)
			Width = math.min(Vector.width, WidthRatio1 + p1.x1 * WidthRatio)
			Largest1 = math.max(0, HeightRatio1 + p1.y0 * HeightRatio)
			Height = math.min(Vector.height, HeightRatio1 + p1.y1 * HeightRatio)
		end
		local LargestDelta = Largest - Vector.width / 2
		local WidthDelta = Width - Vector.width / 2
		local LargestDelta1 = Largest1 - Vector.height / 2
		local HeightDelta = Height - Vector.height / 2
		
		for _ = 1, p4 % 4 do
			local Negated = -HeightDelta
			local Negated1 = -LargestDelta1
			LargestDelta1 = LargestDelta
			HeightDelta = WidthDelta
			LargestDelta = Negated
			WidthDelta = Negated1
		end
		return {
			x = NewX + LargestDelta,
			y = NewY + LargestDelta1,
			width = math.max(0, WidthDelta - LargestDelta),
			height = math.max(0, HeightDelta - LargestDelta1)
		}
	end
})