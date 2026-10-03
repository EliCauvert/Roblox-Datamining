local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	getPassOwnership = function(_, _)
		-- upvalues: promiseModule (ref)
		return promiseModule.resolve(false)
	end
}