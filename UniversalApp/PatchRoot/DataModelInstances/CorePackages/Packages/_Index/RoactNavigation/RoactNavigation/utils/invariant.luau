local var1 = if _G.__DEV__ then function(p1)
	if p1 == nil then
		error("invariant requires an error message argument")
	end
end else function(_) end

return function(p1, p2, ...)
	-- upvalues: var1 (write)
	var1(p2)
	
	if not p1 then
		if p2 == nil then
			error("Minified exception occurred; use the non-minified dev environment for the full error message and additional helpful warnings.", 2)
			
			return
		end
		error(string.format(p2, ...), 2)
	end
end