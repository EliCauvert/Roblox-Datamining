return function(a, b)
	local maxValue = math.max(0, math.floor(b))
	local charCount = utf8.len(a)
	
	return if charCount == nil then if maxValue < #a then string.sub(a, 1, maxValue) else a elseif charCount <= maxValue then a else string.sub(a, 1, utf8.offset(a, maxValue + 1) - 1)
end