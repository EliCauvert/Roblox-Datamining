return function(p0) --[[ line: 1 | named "parseBooleanString" ]]
	return if p0 == nil then nil elseif p0 ~= "true" then if p0 ~= "True" then p0 == "1" else true else true
end