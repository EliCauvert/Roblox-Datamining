local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local mapBindableModule = require(foundation.Utility.mapBindable)
local _ = require(foundation.Components.Types)

local function _(p1)
	-- upvalues: mapBindableModule (ref)
	return if p1 == nil then nil else mapBindableModule(p1, function(p2)
		return if typeof(p2) == "number" then UDim.new(0, p2) else p2
	end)
end

local function getCornerRadius(p1)
	-- upvalues: reactIsModule (ref), mapBindableModule (ref)
	if reactIsModule.isBinding(p1) then
		return {
			TopLeftRadius = p1,
			TopRightRadius = p1,
			BottomRightRadius = p1,
			BottomLeftRadius = p1
		}
	elseif typeof(p1) == "number" then
		return {
			TopLeftRadius = UDim.new(0, p1),
			TopRightRadius = UDim.new(0, p1),
			BottomRightRadius = UDim.new(0, p1),
			BottomLeftRadius = UDim.new(0, p1)
		}
	elseif typeof(p1) == "UDim" then
		return {
			TopLeftRadius = p1,
			TopRightRadius = p1,
			BottomRightRadius = p1,
			BottomLeftRadius = p1
		}
	elseif typeof(p1) == "table" then
		local t = {}
		local topLeft = p1.topLeft
		t.TopLeftRadius = if topLeft == nil then nil else mapBindableModule(topLeft, function(p2)
			return if typeof(p2) == "number" then UDim.new(0, p2) else p2
		end)
		local topRight = p1.topRight
		t.TopRightRadius = if topRight == nil then nil else mapBindableModule(topRight, function(p2)
			return if typeof(p2) == "number" then UDim.new(0, p2) else p2
		end)
		local bottomRight = p1.bottomRight
		t.BottomRightRadius = if bottomRight == nil then nil else mapBindableModule(bottomRight, function(p2)
			return if typeof(p2) == "number" then UDim.new(0, p2) else p2
		end)
		local bottomLeft = p1.bottomLeft
		t.BottomLeftRadius = if bottomLeft == nil then nil else mapBindableModule(bottomLeft, function(p2)
			return if typeof(p2) == "number" then UDim.new(0, p2) else p2
		end)
		
		return t
	end
	return {}
end

return reactModule.memo(function(p1)
	-- upvalues: getCornerRadius (ref), reactModule (ref), getTestIdTagModule (ref)
	local var1 = getCornerRadius(p1.value)
	
	return reactModule.createElement("UICorner", {
		TopLeftRadius = var1.TopLeftRadius,
		TopRightRadius = var1.TopRightRadius,
		BottomRightRadius = var1.BottomRightRadius,
		BottomLeftRadius = var1.BottomLeftRadius,
		[reactModule.Tag] = getTestIdTagModule(p1.testId)
	})
end)