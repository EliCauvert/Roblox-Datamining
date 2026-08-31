return function(value, p1)
	return if value then "loading" elseif p1 then "error" else "ready"
end