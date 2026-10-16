local PromiseModule = require(script.Parent.Parent.Parent.Promise)

return function() --[[ Line: 11 ]]
	-- upvalues: PromiseModule (copy)
	return PromiseModule.defer(function(Callback: (any) -> ()) --[[ Line: 13 ]]
		Callback(nil)
	end)
end