local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)

local function emptyAvailabilities()
	return { available = {}, active = {} }
end

return {
	fetchGamePassTrialAvailabilities = function(_)
		-- upvalues: promiseModule (ref), emptyAvailabilities (ref)
		return promiseModule.resolve(emptyAvailabilities())
	end,
	parseResponse = function(p0)
		-- upvalues: emptyAvailabilities (ref)
		local var3 = emptyAvailabilities()
		
		if typeof(p0) ~= "table" or typeof(p0.trialAvailabilities) ~= "table" then
			return var3
		end
		for i, v in p0.trialAvailabilities do
			if typeof(v) == "table" and v.gamePassId ~= nil then
				local var4 = tostring(v.gamePassId)
				
				if v.status == "FREE_TRIAL_AVAILABLE" then
					var3.available[var4] = true
				elseif v.status == "ACTIVE" then
					var3.active[var4] = true
				end
			end
		end
		return var3
	end
}