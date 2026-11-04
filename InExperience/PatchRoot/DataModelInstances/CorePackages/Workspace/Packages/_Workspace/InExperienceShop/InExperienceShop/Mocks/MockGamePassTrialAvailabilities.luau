local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)
local t = {}
local t1 = {}
local t2 = {}

return {
	fetchGamePassTrialAvailabilities = function(_)
		-- upvalues: t (copy), t1 (copy), t2 (copy), PromiseModule (copy)
		local config = { available = {}, active = {}, redeemed = {} }
		
		for _, value in t do
			config.available[value] = true
		end
		for _, value1 in t1 do
			config.active[value1] = true
		end
		for _, value2 in t2 do
			config.redeemed[value2.gamePassId] = { gamePassId = value2.gamePassId, endTime = value2.endTime }
		end
		return PromiseModule.resolve(config)
	end
}