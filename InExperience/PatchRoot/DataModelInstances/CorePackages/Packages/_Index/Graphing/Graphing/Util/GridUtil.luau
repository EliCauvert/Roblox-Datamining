local Graphing = script:FindFirstAncestor("Graphing")
local MathUtilModule = require(Graphing.Util.MathUtil)
local TypesModule = require(Graphing.Types)
local GridUtil = {
	getUniformValues = function(Direction, X, X1, p1)
		if X1 < X then
			local X2 = X
			X = X1
			X1 = X2
		end
		local Direction1: number = Direction.Unit
		local Offset = Direction.Offset or 0
		local List = {}
		
		for i = math.ceil((X - Offset) / Direction1 - Direction1 * 0.000000001), math.floor((X1 - Offset) / Direction1 + Direction1 * 0.000000001) do
			local NewOffset = Offset + i * Direction1
			
			if not p1[NewOffset] then
				table.insert(List, NewOffset)
			end
		end
		return List
	end,
	getLogarithmicValues = function(Direction, X, X1, p2)
		-- upvalues: MathUtilModule (copy)
		if X1 < X then
			local X2 = X
			X = X1
			X1 = X2
		end
		local Base: number = Direction.Base
		local Subdivision = Direction.Subdivision or 0
		local Largest = math.max(Direction.MinExponent or -10, MathUtilModule.log(Base, X))
		local List = {}
		local v1 = 0
		
		for i = math.floor(Largest), math.ceil((math.max(Largest, MathUtilModule.log(Base, X1)))) do
			for i1 = math.pow(Base, i), math.pow(Base, i + 1), math.pow(Base, i + 1 - Subdivision) do
				if X1 < i1 then break end
				local IsIBelow = i1 < X or i1 == v1
				
				if not IsIBelow then
					v1 = i1
					IsIBelow = p2[i1]
				end
				if not IsIBelow then
					table.insert(List, i1)
				end
			end
		end
		return List
	end,
	getValuesValues = function(Direction, X, X1, p3)
		local List = {}
		
		for _, value in Direction.Values do
			if X <= value and value <= X1 and not p3[value] then
				table.insert(List, value)
			end
		end
		return List
	end
}

function GridUtil.getValues(AXISX, Direction, p4, List)
	-- upvalues: TypesModule (copy), GridUtil (copy)
	local LogarithmicValues = {}
	local t = {}
	
	if List then
		for _, value in List do
			t[value] = true
		end
	end
	local ViewportRect = p4.getViewportRect()
	local X = if AXISX == TypesModule.AXIS_X then ViewportRect.Min.X else ViewportRect.Min.Y
	local X1 = if AXISX == TypesModule.AXIS_X then ViewportRect.Max.X else ViewportRect.Max.Y
	
	if Direction.Type == TypesModule.SCALE_UNIFORM then
		LogarithmicValues = GridUtil.getUniformValues(Direction, X, X1, t)
		
		return LogarithmicValues
	elseif Direction.Type == TypesModule.SCALE_LOGARITHMIC then
		LogarithmicValues = GridUtil.getLogarithmicValues(Direction, X, X1, t)
		
		return LogarithmicValues
	elseif Direction.Type == TypesModule.SCALE_VALUES then
		LogarithmicValues = GridUtil.getValuesValues(Direction, X, X1, t)
		
		return LogarithmicValues
	else
		assert(false, `Axis schema {Direction.Type} not supported`)
		
		return LogarithmicValues
	end
end

function GridUtil.trimRoundingError(p5)
	local _00 = string.format("%.10f", p5):gsub("^0*(.-)%.?0*$", "%1")
	
	if _00 == "" or _00:sub(1, 1) == "." then
		_00 = "0" .. _00
	end
	return _00
end

function GridUtil.getAnchorPointForSide(SIDEBOTTOM): Vector2?
	-- upvalues: TypesModule (copy)
	if SIDEBOTTOM == TypesModule.SIDE_LEFT then
		return Vector2.new(1, 0.5)
	elseif SIDEBOTTOM == TypesModule.SIDE_RIGHT then
		return Vector2.new(0, 0.5)
	elseif SIDEBOTTOM == TypesModule.SIDE_TOP then
		return Vector2.new(0.5, 1)
	elseif SIDEBOTTOM == TypesModule.SIDE_BOTTOM then
		return Vector2.new(0.5, 0)
	else
		assert(false, `Side {SIDEBOTTOM} not supported`)
	end
end

function GridUtil.getTextAlignmentsFromAnchorPoint(Vector)
	local Left = if Vector.X == 0 then Enum.TextXAlignment.Left elseif Vector.X == 1 then Enum.TextXAlignment.Right else Enum.TextXAlignment.Center
	
	if Vector.Y == 0 then
		return Left, Enum.TextYAlignment.Top
	elseif Vector.Y == 1 then
		return Left, Enum.TextYAlignment.Bottom
	else
		return Left, Enum.TextYAlignment.Center
	end
end

return GridUtil