local GetTextSizeOffsetFunction = require(script.Parent.Parent.Parent.Foundation).Utility.getTextSizeOffset

return function(_)
	-- upvalues: GetTextSizeOffsetFunction (copy)
	local TextSizeOffset = GetTextSizeOffsetFunction()
	
	return TextSizeOffset ~= nil, TextSizeOffset
end