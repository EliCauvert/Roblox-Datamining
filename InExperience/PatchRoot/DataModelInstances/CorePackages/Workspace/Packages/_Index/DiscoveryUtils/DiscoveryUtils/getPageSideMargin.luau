return function(p0) --[[ line: 1 | named "getPageSideMargin" ]]
	return if p0 > 600 then 48 elseif p0 > 320 then 24 else 12
end