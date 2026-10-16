return function(p1, p2) --[[ Line: 1 | Named "setDictationUsageType" ]]
	return (pcall(function() --[[ Line: 3 ]]
		-- upvalues: p1 (copy), p2 (copy)
		p1.UsageType = if p2 then "continuous" else "dictation"
	end))
end