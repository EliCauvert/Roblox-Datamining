local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return {
	getPassOwnership = function(_, _) --[[ Line: 8 ]]
		-- upvalues: PromiseModule (copy)
		return PromiseModule.resolve(false)
	end
}