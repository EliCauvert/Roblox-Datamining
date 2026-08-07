return function(p0) --[[ line: 16 | named "processDecelerationRate" ]]
	return if p0 == "normal" then 0.985 elseif p0 == "fast" then 0.9 else p0
end