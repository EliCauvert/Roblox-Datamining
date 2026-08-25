local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

local function getPadding(p0)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p0) then {
		PaddingTop = p0,
		PaddingBottom = p0,
		PaddingLeft = p0,
		PaddingRight = p0
	} elseif typeof(p0) == "table" then {
		PaddingTop = p0.top,
		PaddingBottom = p0.bottom,
		PaddingLeft = p0.left,
		PaddingRight = p0.right
	} elseif typeof(p0) == "number" then {
		PaddingTop = UDim.new(0, p0),
		PaddingBottom = UDim.new(0, p0),
		PaddingLeft = UDim.new(0, p0),
		PaddingRight = UDim.new(0, p0)
	} elseif typeof(p0) == "Vector2" then {
		PaddingTop = UDim.new(0, p0.Y),
		PaddingBottom = UDim.new(0, p0.Y),
		PaddingLeft = UDim.new(0, p0.X),
		PaddingRight = UDim.new(0, p0.X)
	} elseif typeof(p0) == "UDim" then {
		PaddingTop = p0,
		PaddingBottom = p0,
		PaddingLeft = p0,
		PaddingRight = p0
	} elseif typeof(p0) == "UDim2" then {
		PaddingTop = p0.Y,
		PaddingBottom = p0.Y,
		PaddingLeft = p0.X,
		PaddingRight = p0.X
	} else {}
end

return reactModule.memo(function(p1)
	-- upvalues: getPadding (ref), reactModule (ref), getTestIdTagModule (ref)
	local var5 = getPadding(p1.value)
	
	return reactModule.createElement("UIPadding", {
		PaddingTop = var5.PaddingTop,
		PaddingBottom = var5.PaddingBottom,
		PaddingLeft = var5.PaddingLeft,
		PaddingRight = var5.PaddingRight,
		[reactModule.Tag] = getTestIdTagModule(p1.testId)
	})
end)