local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local promiseModule = require(inExperienceShop.Parent.Promise)
local _ = require(inExperienceShop.Types)
local list = { "1804642568", "11839038" }
local list_1 = { "1804340575" }

return {
	fetchGamePassTrialAvailabilities = function(_)
		-- upvalues: list (ref), list_1 (ref), promiseModule (ref)
		local t = { available = {}, active = {} }
		
		for i, v in list do
			t.available[v] = true
		end
		for i, v_1 in list_1 do
			t.active[v_1] = true
		end
		return promiseModule.resolve(t)
	end
}