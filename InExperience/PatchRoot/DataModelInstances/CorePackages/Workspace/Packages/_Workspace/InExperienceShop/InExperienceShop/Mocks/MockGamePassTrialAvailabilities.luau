local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local t = {}
local t_1 = {}

return {
	fetchGamePassTrialAvailabilities = function(_)
		-- upvalues: t (ref), t_1 (ref), promiseModule (ref)
		local t_2 = { available = {}, active = {} }
		
		for i, v in t do
			t_2.available[v] = true
		end
		for i, v_1 in t_1 do
			t_2.active[v_1] = true
		end
		return promiseModule.resolve(t_2)
	end
}