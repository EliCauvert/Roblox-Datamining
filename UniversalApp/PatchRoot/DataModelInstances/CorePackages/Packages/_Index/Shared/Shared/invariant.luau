local ErrorFunction = require(script.Parent.Parent.LuauPolyfill).Error

return function(p1, Template: string, ...) --[[ Line: 25 | Named "invariant" ]]
	-- upvalues: ErrorFunction (copy)
	if not p1 then
		error(ErrorFunction(string.format(Template, ...)))
	end
end