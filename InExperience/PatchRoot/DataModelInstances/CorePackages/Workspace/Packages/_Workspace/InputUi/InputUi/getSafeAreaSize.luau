local parent = script.Parent.Parent
local argCheckModule = require(parent.ArgCheck)
local displayModule = require(parent.Display)
local fFlagExtendScrollingFramesBySafeInsets = require(parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

return function(p0, p1)
	-- upvalues: argCheckModule (ref), fFlagExtendScrollingFramesBySafeInsets (ref), displayModule (ref)
	assert(typeof(p0) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2")
	assert(type(p1) == "table", "getSafeAreaSize expects guiInset to be a table")
	argCheckModule.isNonNegativeNumber(p1.left, "getSafeAreaSize: guiInset.left")
	argCheckModule.isNonNegativeNumber(p1.right, "getSafeAreaSize: guiInset.right")
	argCheckModule.isNonNegativeNumber(p1.top, "getSafeAreaSize: guiInset.top")
	argCheckModule.isNonNegativeNumber(p1.bottom, "getSafeAreaSize: guiInset.bottom")
	local var2 = p0.X - p1.left - p1.right
	local var3 = p0.Y - p1.top - p1.bottom
	
	if fFlagExtendScrollingFramesBySafeInsets then
		local deviceSafePadding = displayModule.GetDisplayStore().getDeviceSafePadding()
		var2 -= deviceSafePadding.left + deviceSafePadding.right
		var3 -= deviceSafePadding.top + deviceSafePadding.bottom
	end
	argCheckModule.isNonNegativeNumber(var2, "getSafeAreaSize: safeAreaWidth")
	argCheckModule.isNonNegativeNumber(var3, "getSafeAreaSize: safeAreaHeight")
	
	return UDim2.new(0, var2, 0, var3)
end