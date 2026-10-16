local function step(p1, _, _) --[[ Line: 1 ]]
	return { complete = true, value = p1.__targetValue }
end

return function(p1) --[[ Line: 8 | Named "instant" ]]
	-- upvalues: step (copy)
	return { __targetValue = p1, step = step }
end