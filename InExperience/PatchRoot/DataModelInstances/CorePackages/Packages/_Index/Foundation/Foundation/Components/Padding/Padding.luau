local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local getTestIdTagModule = require(foundation.Utility.getTestIdTag)
local _ = require(foundation.Components.Types)

local function getPadding(p1)
	-- upvalues: reactIsModule (ref)
	return if reactIsModule.isBinding(p1) then {
		PaddingTop = p1,
		PaddingBottom = p1,
		PaddingLeft = p1,
		PaddingRight = p1
	} elseif typeof(p1) == "table" then {
		PaddingTop = p1.top,
		PaddingBottom = p1.bottom,
		PaddingLeft = p1.left,
		PaddingRight = p1.right
	} elseif typeof(p1) == "number" then {
		PaddingTop = UDim.new(0, p1),
		PaddingBottom = UDim.new(0, p1),
		PaddingLeft = UDim.new(0, p1),
		PaddingRight = UDim.new(0, p1)
	} elseif typeof(p1) == "Vector2" then {
		PaddingTop = UDim.new(0, p1.Y),
		PaddingBottom = UDim.new(0, p1.Y),
		PaddingLeft = UDim.new(0, p1.X),
		PaddingRight = UDim.new(0, p1.X)
	} elseif typeof(p1) == "UDim" then {
		PaddingTop = p1,
		PaddingBottom = p1,
		PaddingLeft = p1,
		PaddingRight = p1
	} elseif typeof(p1) == "UDim2" then {
		PaddingTop = p1.Y,
		PaddingBottom = p1.Y,
		PaddingLeft = p1.X,
		PaddingRight = p1.X
	} else {}
end

return reactModule.memo(function(p1)
	-- upvalues: getPadding (ref), reactModule (ref), getTestIdTagModule (ref)
	local var1 = getPadding(p1.value)
	
	return reactModule.createElement("UIPadding", {
		PaddingTop = var1.PaddingTop,
		PaddingBottom = var1.PaddingBottom,
		PaddingLeft = var1.PaddingLeft,
		PaddingRight = var1.PaddingRight,
		[reactModule.Tag] = getTestIdTagModule(p1.testId)
	})
end)