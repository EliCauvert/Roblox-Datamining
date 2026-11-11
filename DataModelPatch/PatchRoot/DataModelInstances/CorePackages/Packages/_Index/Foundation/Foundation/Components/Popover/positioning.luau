local Foundation = script:FindFirstAncestor("Foundation")
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)

return {
	adjustForOnScreenKeyboard = function(p1, p2, p3): Rect
		return Rect.new(p1.Min, Vector2.new(p1.Max.X, (math.min(p1.Max.Y, (p2 - p3).Y))))
	end,
	isOnScreen = function(p1, p2): boolean
		return p2.Max.X >= p1.Min.X and p1.Max.X >= p2.Min.X and p2.Max.Y >= p1.Min.Y and p1.Max.Y >= p2.Min.Y
	end,
	calculateSide = function(Bottom, p1, p2, Vector)
		-- upvalues: PopoverSideModule (copy)
		if Bottom == PopoverSideModule.Top then
			if p1.Min.Y - Vector.Y < p2.Min.Y and p1.Max.Y + Vector.Y < p2.Max.Y then
				return PopoverSideModule.Bottom
			end
		elseif Bottom == PopoverSideModule.Bottom then
			if p2.Max.Y < p1.Max.Y + Vector.Y and p2.Min.Y < p1.Min.Y - Vector.Y then
				return PopoverSideModule.Top
			end
		elseif Bottom == PopoverSideModule.Left then
			if p1.Min.X - Vector.X < p2.Min.X and p1.Max.X + Vector.X < p2.Max.X then
				return PopoverSideModule.Right
			end
		elseif Bottom == PopoverSideModule.Right and p2.Max.X < p1.Max.X + Vector.X and p2.Min.X < p1.Min.X - Vector.X then
			return PopoverSideModule.Left
		end
		return Bottom
	end,
	calculatePositions = function(Top, p1: number, Center, p2: number, p3, p4, p5: number, Vector)
		-- upvalues: PopoverSideModule (copy), PopoverAlignModule (copy)
		local Vector1 = { X = 0, Y = 0 }
		local config = { X = 0, Y = 0 }
		local config1 = { X = 0, Y = 0 }
		local IsTopMatch: boolean = Top == PopoverSideModule.Top or Top == PopoverSideModule.Left
		local v1 = "X"
		local v2 = "Y"
		local Height = p3.Height
		local X = p3.Min.X
		local Y = p3.Min.Y
		local Y1 = Vector.Y
		local X1 = Vector.X
		local X2 = p3.Max.X
		local Y2 = p3.Max.Y
		local Y3 = p4.Min.Y
		local Y4 = p4.Max.Y
		local X3 = p4.Min.X
		local X4 = p4.Max.X
		
		if Top == PopoverSideModule.Top or Top == PopoverSideModule.Bottom then
			v1 = "Y"
			v2 = "X"
			Height = p3.Width
			X = p3.Min.Y
			Y = p3.Min.X
			Y1 = Vector.X
			X1 = Vector.Y
			X2 = p3.Max.Y
			Y2 = p3.Max.X
			Y3 = p4.Min.X
			Y4 = p4.Max.X
			X3 = p4.Min.Y
			X4 = p4.Max.Y
		end
		local v3 = p1 + p5
		
		if IsTopMatch then
			Vector1[v1] = X - v3 - X1
			config[v1] = X1
		else
			Vector1[v1] = X2 + v3
			config[v1] = 0
		end
		if Center == PopoverAlignModule.Start then
			Vector1[v2] = Y + p2
		elseif Center == PopoverAlignModule.Center then
			Vector1[v2] = Y + Height / 2 - Y1 / 2 + p2
		else
			Vector1[v2] = Y2 + -p2
			config1[v2] = 1
		end
		local VectorEntryDelta = Vector1[v2] - config1[v2] * Y1
		local NewVectorEntryDelta = VectorEntryDelta + Y1
		
		if VectorEntryDelta < Y3 then
			config1[v2] = 0
			Vector1[v2] = Y3
		elseif Y4 < NewVectorEntryDelta then
			config1[v2] = 1
			Vector1[v2] = Y4
		end
		local VectorEntryDelta1 = Vector1[v2] - config1[v2] * Y1
		local NewVectorEntryDelta1 = VectorEntryDelta1 + Y1
		local Largest = math.max(Y, VectorEntryDelta1)
		local Smallest = math.min(Y2, NewVectorEntryDelta1)
		config[v2] = (if Largest <= Smallest then (Largest + Smallest) / 2 elseif NewVectorEntryDelta1 < Y then NewVectorEntryDelta1 - p5 else VectorEntryDelta1 + p5) - Vector1[v2]
		Vector1[v1] = math.clamp(Vector1[v1], X3, (math.max(X4 - X1 - v3, 0)))
		Vector1.X -= p4.Min.X
		Vector1.Y -= p4.Min.Y
		
		return Vector2.new(Vector1.X, Vector1.Y), Vector2.new(config.X, config.Y), Vector2.new(config1.X, config1.Y)
	end,
	calculatePopoverBounds = function(Bottom, p1, X, p2, NewVector)
		-- upvalues: PopoverSideModule (copy)
		local NewVector1 = NewVector
		
		if Bottom == PopoverSideModule.Top or Bottom == PopoverSideModule.Bottom then
			NewVector1 += Vector2.new(X, p1 + p2)
			
			return NewVector1
		else
			return NewVector1 + Vector2.new(p1 + p2, X)
		end
	end,
	calculateAlign = function(Bottom, End, p1, p2, Vector)
		-- upvalues: PopoverSideModule (copy), PopoverAlignModule (copy)
		if Bottom == PopoverSideModule.Top or Bottom == PopoverSideModule.Bottom then
			if End == PopoverAlignModule.Start then
				if p2.Max.X < p1.Min.X + Vector.X then
					return PopoverAlignModule.End
				end
			elseif End == PopoverAlignModule.End and p1.Max.X - Vector.X < p2.Min.X then
				return PopoverAlignModule.Start
			end
		elseif End == PopoverAlignModule.Start then
			if p2.Max.Y < p1.Min.Y + Vector.Y then
				return PopoverAlignModule.End
			end
		elseif End == PopoverAlignModule.End and p1.Max.Y - Vector.Y < p2.Min.Y then
			return PopoverAlignModule.Start
		end
		return End
	end
}