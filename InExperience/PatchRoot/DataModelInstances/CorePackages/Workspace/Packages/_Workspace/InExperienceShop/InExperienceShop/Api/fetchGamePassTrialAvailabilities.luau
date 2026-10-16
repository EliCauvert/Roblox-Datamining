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
	parseResponse = function(p1)
		-- upvalues: emptyAvailabilities (ref)
		local var1 = emptyAvailabilities()
		
		if typeof(p1) ~= "table" or typeof(p1.trialAvailabilities) ~= "table" then
			return var1
		end
		for i, v in p1.trialAvailabilities do
			if typeof(v) == "table" and v.gamePassId ~= nil then
				local var2 = tostring(v.gamePassId)
				
				if v.status == "FREE_TRIAL_AVAILABLE" then
					var1.available[var2] = true
				elseif v.status == "ACTIVE" then
					var1.active[var2] = true
				end
			end
		end
		return var1
	end
}