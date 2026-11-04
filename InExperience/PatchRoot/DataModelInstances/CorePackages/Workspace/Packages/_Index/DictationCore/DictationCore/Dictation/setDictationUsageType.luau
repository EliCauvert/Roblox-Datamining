return function(p1, p2)
	return (pcall(function()
		-- upvalues: p1 (copy), p2 (copy)
		p1.UsageType = if p2 then "continuous" else "dictation"
	end))
end