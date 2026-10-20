local UltimateList = script:FindFirstAncestor("ultimate-list")
local DataSourceMethodsModule = require(UltimateList.DataSources.DataSourceMethods)
local _ = require(UltimateList.DataSources)
local _ = require(script.Parent)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local DimensionsMethodsModule = {}

function DimensionsMethodsModule.getCanvasSize(p1, p2, p3, p4)
	-- upvalues: DataSourceMethodsModule (copy), DimensionsMethodsModule (copy), ExhaustiveMatchModule (copy)
	local BackResult = DataSourceMethodsModule.back(p2)
	
	if BackResult == nil then
		return UDim2.new()
	else
		local UDimRect = DimensionsMethodsModule.getUDimRect(p1, BackResult, DataSourceMethodsModule.length(p2), p3, p4)
		
		return if p4 == "x" then UDim2.fromOffset(UDimRect.position.X.Offset + UDimRect.size.X.Offset, 0) elseif p4 == "y" then UDim2.fromOffset(0, UDimRect.position.Y.Offset + UDimRect.size.Y.Offset) else ExhaustiveMatchModule(p4)
	end
end

local function _(XOffset, p1)
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p1 == "x" then UDim2.new(0, XOffset, 1, 0) elseif p1 == "y" then UDim2.new(1, 0, 0, XOffset) else ExhaustiveMatchModule(p1)
end

local _ = function(p1, p2: number, p3)
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p3 == "x" then UDim2.fromOffset(p1 * (p2 - 1), 0) elseif p3 == "y" then UDim2.fromOffset(0, p1 * (p2 - 1)) else ExhaustiveMatchModule(p3)
end

local function getPositionForConsistentUDim2(Vector, p1: number, Vector1, p2)
	-- upvalues: DimensionsMethodsModule (copy), ExhaustiveMatchModule (copy)
	local AmountPerNonDominantInGrid: number = DimensionsMethodsModule.getAmountPerNonDominantInGrid(Vector, Vector1, p2)
	
	return if p2 == "x" then UDim2.new(0, (math.ceil(p1 / AmountPerNonDominantInGrid) - 1) * Vector.X.Offset, Vector.Y.Scale * ((p1 - 1) % AmountPerNonDominantInGrid), Vector.Y.Offset * ((p1 - 1) % AmountPerNonDominantInGrid)) elseif p2 == "y" then UDim2.new(Vector.X.Scale * ((p1 - 1) % AmountPerNonDominantInGrid), Vector.X.Offset * ((p1 - 1) % AmountPerNonDominantInGrid), 0, (math.ceil(p1 / AmountPerNonDominantInGrid) - 1) * Vector.Y.Offset) else ExhaustiveMatchModule(p2)
end

function DimensionsMethodsModule.getAmountPerNonDominantInGrid(Vector, Vector1, p1)
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p1 == "x" then Vector1.Y // (Vector.Y.Offset + Vector.Y.Scale * Vector1.Y) elseif p1 == "y" then Vector1.X // (Vector.X.Offset + Vector.X.Scale * Vector1.X) else ExhaustiveMatchModule(p1)
end

function DimensionsMethodsModule.getDominantAxis(Vector, p1)
	-- upvalues: ExhaustiveMatchModule (copy)
	return if p1 == "x" then Vector.X elseif p1 == "y" then Vector.Y else ExhaustiveMatchModule(p1)
end

function DimensionsMethodsModule.getUDimRect(p1, BackResult, LengthResult: number, p2, p3)
	-- upvalues: ExhaustiveMatchModule (copy), getPositionForConsistentUDim2 (copy)
	if p1.type == "consistentSize" then
		local Size = p1.size
		local _UDim2 = if p3 == "x" then UDim2.new(0, Size, 1, 0) elseif p3 == "y" then UDim2.new(1, 0, 0, Size) else ExhaustiveMatchModule(p3)
		local Size1 = p1.size
		
		return {
			size = _UDim2,
			position = if p3 == "x" then UDim2.fromOffset(Size1 * (LengthResult - 1), 0) elseif p3 == "y" then UDim2.fromOffset(0, Size1 * (LengthResult - 1)) else ExhaustiveMatchModule(p3)
		}
	elseif p1.type == "consistentUDim2" then
		return {
			size = p1.udim2,
			position = getPositionForConsistentUDim2(p1.udim2, LengthResult, p2, p3)
		}
	elseif p1.type == "getter" then
		return p1.callback(BackResult, LengthResult)
	elseif p1.type ~= "spaced" then
		return ExhaustiveMatchModule(p1.type)
	elseif p1.inner.type == "consistentSize" then
		local Size = p1.inner.size
		local _UDim2 = if p3 == "x" then UDim2.new(0, Size, 1, 0) elseif p3 == "y" then UDim2.new(1, 0, 0, Size) else ExhaustiveMatchModule(p3)
		local NewSize = p1.inner.size + p1.spacing
		
		return {
			size = _UDim2,
			position = if p3 == "x" then UDim2.fromOffset(NewSize * (LengthResult - 1), 0) elseif p3 == "y" then UDim2.fromOffset(0, NewSize * (LengthResult - 1)) else ExhaustiveMatchModule(p3)
		}
	elseif p1.inner.type == "consistentUDim2" then
		return {
			size = p1.inner.udim2,
			position = getPositionForConsistentUDim2(p1.inner.udim2 + UDim2.fromOffset(if p3 == "x" then p1.spacing else 0, if p3 == "y" then p1.spacing else 0), LengthResult, p2, p3)
		}
	elseif p1.inner.type == "getter" or p1.inner.type == "spaced" then
		error("Unsupported spaced dimensions")
		
		return
	else
		return ExhaustiveMatchModule(p1.inner.type)
	end
end

local function getElementsDisplayedForUDim2(Vector, Vector1, p1)
	-- upvalues: DimensionsMethodsModule (copy), ExhaustiveMatchModule (copy)
	local AmountPerNonDominantInGrid = DimensionsMethodsModule.getAmountPerNonDominantInGrid(Vector, Vector1, p1)
	
	return if p1 == "x" then AmountPerNonDominantInGrid * (Vector1.X // Vector.Y.Offset + 2) elseif p1 == "y" then AmountPerNonDominantInGrid * (Vector1.Y // Vector.X.Offset + 2) else ExhaustiveMatchModule(p1)
end

function DimensionsMethodsModule.elementsDisplayedHint(p1, Vector, p2)
	-- upvalues: DimensionsMethodsModule (copy), getElementsDisplayedForUDim2 (copy), ExhaustiveMatchModule (copy)
	if p1.type == "consistentSize" then
		return DimensionsMethodsModule.getDominantAxis(Vector, p2) // p1.size + 2
	elseif p1.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p1.udim2, Vector, p2)
	elseif p1.type == "getter" then
		return nil
	elseif p1.type ~= "spaced" then
		return ExhaustiveMatchModule(p1.type)
	elseif p1.inner.type == "consistentSize" then
		return DimensionsMethodsModule.getDominantAxis(Vector, p2) // (p1.inner.size + p1.spacing) + 2
	elseif p1.inner.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p1.inner.udim2 + UDim2.fromOffset(if p2 == "x" then p1.spacing else 0, if p2 == "y" then p1.spacing else 0), Vector, p2)
	elseif p1.inner.type == "spaced" or p1.inner.type == "getter" then
		error("Unsupported spaced dimensions")
		
		return
	else
		return ExhaustiveMatchModule(p1.inner.type)
	end
end

function DimensionsMethodsModule.equals(p1, p2)
	-- upvalues: ExhaustiveMatchModule (copy)
	if p1.type ~= p2.type then
		return false
	elseif p1.type == "getter" then
		assert(p2.type == "getter", "Luau")
		
		return p1.callback == p2.callback
	elseif p1.type == "consistentSize" then
		assert(p2.type == "consistentSize", "Luau")
		
		return p1.size == p2.size
	elseif p1.type == "consistentUDim2" then
		assert(p2.type == "consistentUDim2", "Luau")
		
		return p1.udim2 == p2.udim2
	elseif p1.type == "spaced" then
		assert(p2.type == "spaced", "Luau")
		
		return p1.spacing == p2.spacing
	else
		return ExhaustiveMatchModule(p1.type)
	end
end

return DimensionsMethodsModule