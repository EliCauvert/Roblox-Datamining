local var1 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var1.DataSources.DataSourceMethods)
local _ = require(var1.DataSources)
local _ = require(script.Parent)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)
local t = {}

function t.getCanvasSize(p1, p2, p3, p4)
	-- upvalues: dataSourceMethodsModule (ref), t (ref), exhaustiveMatchModule (ref)
	local var2 = dataSourceMethodsModule.back(p2)
	
	if var2 == nil then
		return UDim2.new()
	end
	local uDimRect = t.getUDimRect(p1, var2, dataSourceMethodsModule.length(p2), p3, p4)
	
	return if p4 == "x" then UDim2.fromOffset(uDimRect.position.X.Offset + uDimRect.size.X.Offset, 0) elseif p4 == "y" then UDim2.fromOffset(0, uDimRect.position.Y.Offset + uDimRect.size.Y.Offset) else exhaustiveMatchModule(p4)
end

local function _(p1, p2)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p2 == "x" then UDim2.new(0, p1, 1, 0) elseif p2 == "y" then UDim2.new(1, 0, 0, p1) else exhaustiveMatchModule(p2)
end

local _ = function(p1, p2, p3)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p3 == "x" then UDim2.fromOffset(p1 * (p2 - 1), 0) elseif p3 == "y" then UDim2.fromOffset(0, p1 * (p2 - 1)) else exhaustiveMatchModule(p3)
end

local function getPositionForConsistentUDim2(p1, p2, p3, p4)
	-- upvalues: t (ref), exhaustiveMatchModule (ref)
	local amountPerNonDominantInGrid = t.getAmountPerNonDominantInGrid(p1, p3, p4)
	
	return if p4 == "x" then UDim2.new(0, (math.ceil(p2 / amountPerNonDominantInGrid) - 1) * p1.X.Offset, p1.Y.Scale * ((p2 - 1) % amountPerNonDominantInGrid), p1.Y.Offset * ((p2 - 1) % amountPerNonDominantInGrid)) elseif p4 == "y" then UDim2.new(p1.X.Scale * ((p2 - 1) % amountPerNonDominantInGrid), p1.X.Offset * ((p2 - 1) % amountPerNonDominantInGrid), 0, (math.ceil(p2 / amountPerNonDominantInGrid) - 1) * p1.Y.Offset) else exhaustiveMatchModule(p4)
end

function t.getAmountPerNonDominantInGrid(a, b, p1)
	-- upvalues: exhaustiveMatchModule (ref)
	return if p1 == "x" then b.Y // (a.Y.Offset + a.Y.Scale * b.Y) elseif p1 == "y" then b.X // (a.X.Offset + a.X.Scale * b.X) else exhaustiveMatchModule(p1)
end

function t.getDominantAxis(a, b)
	-- upvalues: exhaustiveMatchModule (ref)
	return if b == "x" then a.X elseif b == "y" then a.Y else exhaustiveMatchModule(b)
end

function t.getUDimRect(p1, p2, p3, p4, p5)
	-- upvalues: exhaustiveMatchModule (ref), getPositionForConsistentUDim2 (ref)
	if p1.type == "consistentSize" then
		local t = {}
		local size = p1.size
		t.size = if p5 == "x" then UDim2.new(0, size, 1, 0) elseif p5 == "y" then UDim2.new(1, 0, 0, size) else exhaustiveMatchModule(p5)
		local size_1 = p1.size
		t.position = if p5 == "x" then UDim2.fromOffset(size_1 * (p3 - 1), 0) elseif p5 == "y" then UDim2.fromOffset(0, size_1 * (p3 - 1)) else exhaustiveMatchModule(p5)
		
		return t
	elseif p1.type == "consistentUDim2" then
		return {
			size = p1.udim2,
			position = getPositionForConsistentUDim2(p1.udim2, p3, p4, p5)
		}
	elseif p1.type == "getter" then
		return p1.callback(p2, p3)
	elseif p1.type ~= "spaced" then
		return exhaustiveMatchModule(p1.type)
	elseif p1.inner.type == "consistentSize" then
		local t = {}
		local size = p1.inner.size
		t.size = if p5 == "x" then UDim2.new(0, size, 1, 0) elseif p5 == "y" then UDim2.new(1, 0, 0, size) else exhaustiveMatchModule(p5)
		local var2 = p1.inner.size + p1.spacing
		t.position = if p5 == "x" then UDim2.fromOffset(var2 * (p3 - 1), 0) elseif p5 == "y" then UDim2.fromOffset(0, var2 * (p3 - 1)) else exhaustiveMatchModule(p5)
		
		return t
	elseif p1.inner.type == "consistentUDim2" then
		return {
			size = p1.inner.udim2,
			position = getPositionForConsistentUDim2(p1.inner.udim2 + UDim2.fromOffset(if p5 == "x" then p1.spacing else 0, if p5 == "y" then p1.spacing else 0), p3, p4, p5)
		}
	elseif p1.inner.type == "getter" or p1.inner.type == "spaced" then
		error("Unsupported spaced dimensions")
		
		return
	end
	return exhaustiveMatchModule(p1.inner.type)
end

local function getElementsDisplayedForUDim2(p1, p2, p3)
	-- upvalues: t (ref), exhaustiveMatchModule (ref)
	local amountPerNonDominantInGrid = t.getAmountPerNonDominantInGrid(p1, p2, p3)
	
	return if p3 == "x" then amountPerNonDominantInGrid * (p2.X // p1.Y.Offset + 2) elseif p3 == "y" then amountPerNonDominantInGrid * (p2.Y // p1.X.Offset + 2) else exhaustiveMatchModule(p3)
end

function t.elementsDisplayedHint(p1, p2, p3)
	-- upvalues: t (ref), getElementsDisplayedForUDim2 (ref), exhaustiveMatchModule (ref)
	if p1.type == "consistentSize" then
		return t.getDominantAxis(p2, p3) // p1.size + 2
	elseif p1.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p1.udim2, p2, p3)
	elseif p1.type == "getter" then
		return nil
	elseif p1.type ~= "spaced" then
		return exhaustiveMatchModule(p1.type)
	elseif p1.inner.type == "consistentSize" then
		return t.getDominantAxis(p2, p3) // (p1.inner.size + p1.spacing) + 2
	elseif p1.inner.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p1.inner.udim2 + UDim2.fromOffset(if p3 == "x" then p1.spacing else 0, if p3 == "y" then p1.spacing else 0), p2, p3)
	elseif p1.inner.type == "spaced" or p1.inner.type == "getter" then
		error("Unsupported spaced dimensions")
		
		return
	end
	return exhaustiveMatchModule(p1.inner.type)
end

function t.equals(p1, p2)
	-- upvalues: exhaustiveMatchModule (ref)
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
	end
	return exhaustiveMatchModule(p1.type)
end

return t