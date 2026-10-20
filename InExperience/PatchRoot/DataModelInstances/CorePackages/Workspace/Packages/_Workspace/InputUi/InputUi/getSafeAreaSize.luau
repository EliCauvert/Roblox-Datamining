local Parent = script.Parent.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local DisplayModule = require(Parent.Display)
local FFlagExtendScrollingFramesBySafeInsets = require(Parent.SharedFlags).FFlagExtendScrollingFramesBySafeInsets

return function(Vector, p1, p2): UDim2
	-- upvalues: ArgCheckModule (copy), FFlagExtendScrollingFramesBySafeInsets (copy), DisplayModule (copy)
	assert(typeof(Vector) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2")
	assert(type(p1) == "table", "getSafeAreaSize expects guiInset to be a table")
	ArgCheckModule.isNonNegativeNumber(p1.left, "getSafeAreaSize: guiInset.left")
	ArgCheckModule.isNonNegativeNumber(p1.right, "getSafeAreaSize: guiInset.right")
	ArgCheckModule.isNonNegativeNumber(p1.top, "getSafeAreaSize: guiInset.top")
	ArgCheckModule.isNonNegativeNumber(p1.bottom, "getSafeAreaSize: guiInset.bottom")
	local XDelta = Vector.X - p1.left - p1.right
	local YDelta = Vector.Y - p1.top - p1.bottom
	
	if p2 then
		ArgCheckModule.isNonNegativeNumber(XDelta, "getSafeAreaSize: safeAreaWidth")
		ArgCheckModule.isNonNegativeNumber(YDelta, "getSafeAreaSize: safeAreaHeight")
		
		return UDim2.new(0, XDelta, 0, YDelta)
	end
	if FFlagExtendScrollingFramesBySafeInsets then
		local DeviceSafePadding = DisplayModule.GetDisplayStore().getDeviceSafePadding()
		XDelta -= DeviceSafePadding.left + DeviceSafePadding.right
		YDelta -= DeviceSafePadding.top + DeviceSafePadding.bottom
	end
	ArgCheckModule.isNonNegativeNumber(XDelta, "getSafeAreaSize: safeAreaWidth")
	ArgCheckModule.isNonNegativeNumber(YDelta, "getSafeAreaSize: safeAreaHeight")
	
	return UDim2.new(0, XDelta, 0, YDelta)
end