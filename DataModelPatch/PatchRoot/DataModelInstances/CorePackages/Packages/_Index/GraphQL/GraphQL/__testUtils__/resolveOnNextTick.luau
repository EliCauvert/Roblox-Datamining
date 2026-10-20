local PromiseModule = require(script.Parent.Parent.Parent.Promise)

return function()
	-- upvalues: PromiseModule (copy)
	return PromiseModule.defer(function(Callback: (any) -> ())
		Callback(nil)
	end)
end