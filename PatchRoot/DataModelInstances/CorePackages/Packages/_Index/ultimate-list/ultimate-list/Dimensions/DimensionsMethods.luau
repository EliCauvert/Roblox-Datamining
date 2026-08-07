-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local var0 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var0.DataSources.DataSourceMethods)
local _ = require(var0.DataSources)
local _ = require(script.Parent)
local exhaustiveMatchModule = require(var0.Util.exhaustiveMatch)
local t = {}

function t.getCanvasSize(p0, p1, p2, p3) --[[ line: 11 ]]
	-- upvalues: dataSourceMethodsModule (ref), t (ref), exhaustiveMatchModule (ref)
	local var6 = dataSourceMethodsModule.back(p1)
	
	if var6 == nil then
		return UDim2.new()
	end
	local uDimRect = t.getUDimRect(p0, var6, dataSourceMethodsModule.length(p1), p2, p3)
	
	return if p3 == "x" then UDim2.fromOffset(uDimRect.position.X.Offset + uDimRect.size.X.Offset, 0) elseif p3 == "y" then UDim2.fromOffset(0, uDimRect.position.Y.Offset + uDimRect.size.Y.Offset) else exhaustiveMatchModule(p3)
end

local function _(p4, p5) --[[ line: 30 | named "getUDimSizeForConsistentSize" ]]
	-- upvalues: exhaustiveMatchModule (ref)
	return if p5 == "x" then UDim2.new(0, p4, 1, 0) elseif p5 == "y" then UDim2.new(1, 0, 0, p4) else exhaustiveMatchModule(p5)
end

local _ = function(p6, p7, p8) --[[ line: 40 | named "getPositionForConsistentSize" ]]
	-- upvalues: exhaustiveMatchModule (ref)
	return if p8 == "x" then UDim2.fromOffset(p6 * (p7 - 1), 0) elseif p8 == "y" then UDim2.fromOffset(0, p6 * (p7 - 1)) else exhaustiveMatchModule(p8)
end

local function getPositionForConsistentUDim2(p9, p10, p11, p12) --[[ line: 50 ]]
	-- upvalues: t (ref), exhaustiveMatchModule (ref)
	local amountPerNonDominantInGrid = t.getAmountPerNonDominantInGrid(p9, p11, p12)
	
	return if p12 == "x" then UDim2.new(0, (math.ceil(p10 / amountPerNonDominantInGrid) - 1) * p9.X.Offset, p9.Y.Scale * ((p10 - 1) % amountPerNonDominantInGrid), p9.Y.Offset * ((p10 - 1) % amountPerNonDominantInGrid)) elseif p12 == "y" then UDim2.new(p9.X.Scale * ((p10 - 1) % amountPerNonDominantInGrid), p9.X.Offset * ((p10 - 1) % amountPerNonDominantInGrid), 0, (math.ceil(p10 / amountPerNonDominantInGrid) - 1) * p9.Y.Offset) else exhaustiveMatchModule(p12)
end

function t.getAmountPerNonDominantInGrid(a, b, p13) --[[ line: 79 ]]
	-- upvalues: exhaustiveMatchModule (ref)
	return if p13 == "x" then b.Y // (a.Y.Offset + a.Y.Scale * b.Y) elseif p13 == "y" then b.X // (a.X.Offset + a.X.Scale * b.X) else exhaustiveMatchModule(p13)
end

function t.getDominantAxis(a, b) --[[ line: 93 ]]
	-- upvalues: exhaustiveMatchModule (ref)
	return if b == "x" then a.X elseif b == "y" then a.Y else exhaustiveMatchModule(b)
end

function t.getUDimRect(p14, p15, p16, p17, p18) --[[ line: 103 ]]
	-- upvalues: exhaustiveMatchModule (ref), getPositionForConsistentUDim2 (ref)
	if p14.type == "consistentSize" then
		local t = {}
		local size = p14.size
		t.size = if p18 == "x" then UDim2.new(0, size, 1, 0) elseif p18 == "y" then UDim2.new(1, 0, 0, size) else exhaustiveMatchModule(p18)
		local size_1 = p14.size
		t.position = if p18 == "x" then UDim2.fromOffset(size_1 * (p16 - 1), 0) elseif p18 == "y" then UDim2.fromOffset(0, size_1 * (p16 - 1)) else exhaustiveMatchModule(p18)
		
		return t
	elseif p14.type == "consistentUDim2" then
		return {
			size = p14.udim2,
			position = getPositionForConsistentUDim2(p14.udim2, p16, p17, p18)
		}
	elseif p14.type == "getter" then
		return p14.callback(p15, p16)
	elseif p14.type ~= "spaced" then
		return exhaustiveMatchModule(p14.type)
	elseif p14.inner.type == "consistentSize" then
		local t = {}
		local size = p14.inner.size
		t.size = if p18 == "x" then UDim2.new(0, size, 1, 0) elseif p18 == "y" then UDim2.new(1, 0, 0, size) else exhaustiveMatchModule(p18)
		local var11 = p14.inner.size + p14.spacing
		t.position = if p18 == "x" then UDim2.fromOffset(var11 * (p16 - 1), 0) elseif p18 == "y" then UDim2.fromOffset(0, var11 * (p16 - 1)) else exhaustiveMatchModule(p18)
		
		return t
	elseif p14.inner.type == "consistentUDim2" then
		return {
			size = p14.inner.udim2,
			position = getPositionForConsistentUDim2(p14.inner.udim2 + UDim2.fromOffset(if p18 == "x" then p14.spacing else 0, if p18 == "y" then p14.spacing else 0), p16, p17, p18)
		}
	elseif p14.inner.type == "getter" or p14.inner.type == "spaced" then
		error("Unsupported spaced dimensions")
		
		return
	end
	return exhaustiveMatchModule(p14.inner.type)
end

local function getElementsDisplayedForUDim2(p19, p20, p21) --[[ line: 152 ]]
	-- upvalues: t (ref), exhaustiveMatchModule (ref)
	local amountPerNonDominantInGrid = t.getAmountPerNonDominantInGrid(p19, p20, p21)
	
	return if p21 == "x" then amountPerNonDominantInGrid * (p20.X // p19.Y.Offset + 2) elseif p21 == "y" then amountPerNonDominantInGrid * (p20.Y // p19.X.Offset + 2) else exhaustiveMatchModule(p21)
end

function t.elementsDisplayedHint(p22, p23, p24) --[[ line: 165 ]]
	-- upvalues: t (ref), getElementsDisplayedForUDim2 (ref), exhaustiveMatchModule (ref)
	if p22.type == "consistentSize" then
		return t.getDominantAxis(p23, p24) // p22.size + 2
	elseif p22.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p22.udim2, p23, p24)
	elseif p22.type == "getter" then
		return nil
	elseif p22.type ~= "spaced" then
		return exhaustiveMatchModule(p22.type)
	elseif p22.inner.type == "consistentSize" then
		return t.getDominantAxis(p23, p24) // (p22.inner.size + p22.spacing) + 2
	elseif p22.inner.type == "consistentUDim2" then
		return getElementsDisplayedForUDim2(p22.inner.udim2 + UDim2.fromOffset(if p24 == "x" then p22.spacing else 0, if p24 == "y" then p22.spacing else 0), p23, p24)
	elseif p22.inner.type == "spaced" or p22.inner.type == "getter" then
		error("Unsupported spaced dimensions")
		
		return
	end
	return exhaustiveMatchModule(p22.inner.type)
end

function t.equals(p25, p26) --[[ line: 203 ]]
	-- upvalues: exhaustiveMatchModule (ref)
	if p25.type ~= p26.type then
		return false
	elseif p25.type == "getter" then
		assert(p26.type == "getter", "Luau")
		
		return p25.callback == p26.callback
	elseif p25.type == "consistentSize" then
		assert(p26.type == "consistentSize", "Luau")
		
		return p25.size == p26.size
	elseif p25.type == "consistentUDim2" then
		assert(p26.type == "consistentUDim2", "Luau")
		
		return p25.udim2 == p26.udim2
	elseif p25.type == "spaced" then
		assert(p26.type == "spaced", "Luau")
		
		return p25.spacing == p26.spacing
	end
	return exhaustiveMatchModule(p25.type)
end

return t