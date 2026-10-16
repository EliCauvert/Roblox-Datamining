local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)
local t = {}
local t1 = {}

return {
	fetchGamePassTrialAvailabilities = function(_) --[[ Line: 12 ]]
		-- upvalues: t (copy), t1 (copy), PromiseModule (copy)
		local config = { available = {}, active = {} }
		
		for _, value in t do
			config.available[value] = true
		end
		for _, value1 in t1 do
			config.active[value1] = true
		end
		return PromiseModule.resolve(config)
	end
}