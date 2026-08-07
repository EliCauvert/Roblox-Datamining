-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local mapBindableModule = require(foundation.Utility.mapBindable)
local _ = require(foundation.Components.Types)

local function _(p0) --[[ line: 16 | named "toUDim" ]]
	-- upvalues: mapBindableModule (ref)
	return if p0 == nil then nil else mapBindableModule(p0, function(p1) --[[ line: 20 ]]
		return if typeof(p1) == "number" then UDim.new(0, p1) else p1
	end)
end

local function getCornerRadius(p2) --[[ line: 28 ]]
	-- upvalues: reactIsModule (ref), mapBindableModule (ref)
	if reactIsModule.isBinding(p2) then
		return {
			TopLeftRadius = p2,
			TopRightRadius = p2,
			BottomRightRadius = p2,
			BottomLeftRadius = p2
		}
	elseif typeof(p2) == "number" then
		return {
			TopLeftRadius = UDim.new(0, p2),
			TopRightRadius = UDim.new(0, p2),
			BottomRightRadius = UDim.new(0, p2),
			BottomLeftRadius = UDim.new(0, p2)
		}
	elseif typeof(p2) == "UDim" then
		return {
			TopLeftRadius = p2,
			TopRightRadius = p2,
			BottomRightRadius = p2,
			BottomLeftRadius = p2
		}
	elseif typeof(p2) == "table" then
		local t = {}
		local topLeft = p2.topLeft
		t.TopLeftRadius = if topLeft == nil then nil else mapBindableModule(topLeft, function(p3) --[[ line: 20 ]]
			return if typeof(p3) == "number" then UDim.new(0, p3) else p3
		end)
		local topRight = p2.topRight
		t.TopRightRadius = if topRight == nil then nil else mapBindableModule(topRight, function(p4) --[[ line: 20 ]]
			return if typeof(p4) == "number" then UDim.new(0, p4) else p4
		end)
		local bottomRight = p2.bottomRight
		t.BottomRightRadius = if bottomRight == nil then nil else mapBindableModule(bottomRight, function(p5) --[[ line: 20 ]]
			return if typeof(p5) == "number" then UDim.new(0, p5) else p5
		end)
		local bottomLeft = p2.bottomLeft
		t.BottomLeftRadius = if bottomLeft == nil then nil else mapBindableModule(bottomLeft, function(p6) --[[ line: 20 ]]
			return if typeof(p6) == "number" then UDim.new(0, p6) else p6
		end)
		
		return t
	end
	return {}
end

return reactModule.memo(function(p7) --[[ line: 73 | named "CornerRadius" ]]
	-- upvalues: getCornerRadius (ref), reactModule (ref), getTestIdTagModule (ref)
	local var7 = getCornerRadius(p7.value)
	
	return reactModule.createElement("UICorner", {
		TopLeftRadius = var7.TopLeftRadius,
		TopRightRadius = var7.TopRightRadius,
		BottomRightRadius = var7.BottomRightRadius,
		BottomLeftRadius = var7.BottomLeftRadius,
		[reactModule.Tag] = getTestIdTagModule(p7.testId)
	})
end)