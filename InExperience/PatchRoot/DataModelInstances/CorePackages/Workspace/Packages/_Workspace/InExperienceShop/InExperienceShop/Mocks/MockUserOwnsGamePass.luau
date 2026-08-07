local promiseModule = require(script:FindFirstAncestor("InExperienceShop").Parent.Promise)

return function(_) --[[ line: 15 | named "userOwnsGamePass" ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.resolve(false)
end