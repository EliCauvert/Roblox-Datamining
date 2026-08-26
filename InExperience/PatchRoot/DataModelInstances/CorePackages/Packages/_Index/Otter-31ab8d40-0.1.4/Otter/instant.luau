local function step(p1, _, _)
	return { complete = true, value = p1.__targetValue }
end

return function(p1)
	-- upvalues: step (ref)
	return { __targetValue = p1, step = step }
end