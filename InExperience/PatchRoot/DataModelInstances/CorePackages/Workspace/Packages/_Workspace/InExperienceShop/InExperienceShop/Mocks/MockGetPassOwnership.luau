local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	getPassOwnership = function(_, _)
		-- upvalues: PromiseModule (copy)
		return PromiseModule.resolve(false)
	end
}