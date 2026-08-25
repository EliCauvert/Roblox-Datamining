local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(_)
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(false)
end