local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local GetTestIdTagModule = require(Foundation.Utility.getTestIdTag)
local _ = require(Foundation.Components.Types)

local function getPadding(Offset) --[[ Line: 14 ]]
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(Offset) then {
		PaddingTop = Offset,
		PaddingBottom = Offset,
		PaddingLeft = Offset,
		PaddingRight = Offset
	} elseif typeof(Offset) == "table" then {
		PaddingTop = Offset.top,
		PaddingBottom = Offset.bottom,
		PaddingLeft = Offset.left,
		PaddingRight = Offset.right
	} elseif typeof(Offset) == "number" then {
		PaddingTop = UDim.new(0, Offset),
		PaddingBottom = UDim.new(0, Offset),
		PaddingLeft = UDim.new(0, Offset),
		PaddingRight = UDim.new(0, Offset)
	} elseif typeof(Offset) == "Vector2" then {
		PaddingTop = UDim.new(0, Offset.Y),
		PaddingBottom = UDim.new(0, Offset.Y),
		PaddingLeft = UDim.new(0, Offset.X),
		PaddingRight = UDim.new(0, Offset.X)
	} elseif typeof(Offset) == "UDim" then {
		PaddingTop = Offset,
		PaddingBottom = Offset,
		PaddingLeft = Offset,
		PaddingRight = Offset
	} elseif typeof(Offset) == "UDim2" then {
		PaddingTop = Offset.Y,
		PaddingBottom = Offset.Y,
		PaddingLeft = Offset.X,
		PaddingRight = Offset.X
	} else {}
end

return ReactModule.memo(function(p1) --[[ Line: 73 | Named "Padding" ]]
	-- upvalues: getPadding (copy), ReactModule (copy), GetTestIdTagModule (copy)
	local Padding = getPadding(p1.value)
	
	return ReactModule.createElement("UIPadding", {
		PaddingTop = Padding.PaddingTop,
		PaddingBottom = Padding.PaddingBottom,
		PaddingLeft = Padding.PaddingLeft,
		PaddingRight = Padding.PaddingRight,
		[ReactModule.Tag] = GetTestIdTagModule(p1.testId)
	})
end)