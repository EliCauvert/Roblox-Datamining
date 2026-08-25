local function step(p0, _, _)
	return { complete = true, value = p0.__targetValue }
end

return function(p1)
	-- upvalues: step (ref)
	return { __targetValue = p1, step = step }
end