local PromiseModule = require(script.Parent.Parent.Parent.Promise)

return {
	isPromise = function(p1) --[[ Line: 17 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.is(p1)
	end
}