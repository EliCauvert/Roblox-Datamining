local Callback = if _G.__DEV__ then function(p1)
	if p1 == nil then
		error("invariant requires an error message argument")
	end
end else function(_) end

return function(p1, Template: string, ...)
	-- upvalues: Callback (ref)
	Callback(Template)
	
	if not p1 then
		if Template == nil then
			error("Minified exception occurred; use the non-minified dev environment for the full error message and additional helpful warnings.", 2)
			
			return
		end
		error(string.format(Template, ...), 2)
	end
end