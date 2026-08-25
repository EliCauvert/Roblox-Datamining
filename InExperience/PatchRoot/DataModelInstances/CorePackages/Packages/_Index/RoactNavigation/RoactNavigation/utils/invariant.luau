local var0 = if _G.__DEV__ then function(p0)
	if p0 == nil then
		error("invariant requires an error message argument")
	end
end else function(_) end

return function(p1, p2, ...)
	-- upvalues: var0 (write)
	var0(p2)
	
	if not p1 then
		if p2 == nil then
			error("Minified exception occurred; use the non-minified dev environment for the full error message and additional helpful warnings.", 2)
			
			return
		end
		error(string.format(p2, ...), 2)
	end
end