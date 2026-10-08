return function(value, p1)
	return pcall(function()
		-- upvalues: value (ref), p1 (ref)
		value.UsageType = if p1 then "continuous" else "dictation"
	end)
end