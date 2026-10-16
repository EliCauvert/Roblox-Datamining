local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)

return {
	getPassOwnership = function(_, _)
		-- upvalues: promiseModule (ref)
		return promiseModule.resolve(nil)
	end
}