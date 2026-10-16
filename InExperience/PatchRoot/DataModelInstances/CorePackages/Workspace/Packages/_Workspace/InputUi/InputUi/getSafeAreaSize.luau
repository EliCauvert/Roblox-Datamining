local parent = script.Parent.Parent
local argCheckModule = require(parent.ArgCheck)
local displayModule = require(parent.Display)
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

return function(p1, p2)
	-- upvalues: argCheckModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), displayModule (ref)
	assert(typeof(p1) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2")
	assert(type(p2) == "table", "getSafeAreaSize expects guiInset to be a table")
	argCheckModule.isNonNegativeNumber(p2.left, "getSafeAreaSize: guiInset.left")
	argCheckModule.isNonNegativeNumber(p2.right, "getSafeAreaSize: guiInset.right")
	argCheckModule.isNonNegativeNumber(p2.top, "getSafeAreaSize: guiInset.top")
	argCheckModule.isNonNegativeNumber(p2.bottom, "getSafeAreaSize: guiInset.bottom")
	local var1 = p1.X - p2.left - p2.right
	local var2 = p1.Y - p2.top - p2.bottom
	
	if fFlagExtendScrollingFramesBySafeInsets then
		local deviceSafePadding = displayModule.GetDisplayStore().getDeviceSafePadding()
		var1 -= deviceSafePadding.left + deviceSafePadding.right
		var2 -= deviceSafePadding.top + deviceSafePadding.bottom
	end
	argCheckModule.isNonNegativeNumber(var1, "getSafeAreaSize: safeAreaWidth")
	argCheckModule.isNonNegativeNumber(var2, "getSafeAreaSize: safeAreaHeight")
	
	return UDim2.new(0, var1, 0, var2)
end