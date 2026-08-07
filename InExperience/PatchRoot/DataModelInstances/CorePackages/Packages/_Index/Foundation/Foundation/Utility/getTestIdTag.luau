return function(p0, p1) --[[ line: 9 | named "getTestIdTag" ]]
	return if p0 == nil then nil elseif p1 then `data-testid={p0}--{p1}` else `data-testid={p0}`
end