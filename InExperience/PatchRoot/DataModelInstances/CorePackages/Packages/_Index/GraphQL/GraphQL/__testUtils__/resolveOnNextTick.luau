local promiseModule = require(script.Parent.Parent.Parent.Promise)

return function() --[[ line: 11 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.defer(function(p0) --[[ line: 13 ]]
		p0(nil)
	end)
end