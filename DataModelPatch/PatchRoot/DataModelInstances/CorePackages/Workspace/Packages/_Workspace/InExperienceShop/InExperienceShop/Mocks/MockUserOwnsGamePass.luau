local PromiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(_)
	-- upvalues: PromiseModule (copy)
	return PromiseModule.resolve(false)
end