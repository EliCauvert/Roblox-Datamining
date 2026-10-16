return function(p1) --[[ Line: 16 | Named "processDecelerationRate" ]]
	return if p1 == "normal" then 0.985 elseif p1 == "fast" then 0.9 else p1
end