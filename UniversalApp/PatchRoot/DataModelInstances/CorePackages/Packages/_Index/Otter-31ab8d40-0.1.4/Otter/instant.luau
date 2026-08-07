local function step(p0, _, _) --[[ line: 1 ]]
	return { complete = true, value = p0.__targetValue }
end

return function(p1) --[[ line: 8 | named "instant" ]]
	-- upvalues: step (ref)
	return { __targetValue = p1, step = step }
end