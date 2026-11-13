local OwnerModule = require("../ownership/owner")
local _ = require("../runtime/children")
local _ = require("../host")
local SupportModule = require("./support")
local _ = require("../reactive/types")

return function(p1, p2, p3)
	-- upvalues: SupportModule (copy), OwnerModule (copy)
	local Switch = SupportModule.sourceOf(p1, "switch", "source")
	
	if type(p2) ~= "table" then
		SupportModule.optionsOf(p2, "switch", "a table of branches keyed by value")
	end
	return function(p4)
		-- upvalues: SupportModule (upval), OwnerModule (upval), Switch (copy), p2 (copy), p3 (copy)
		local Switch1 = SupportModule.ownerFor("switch")
		SupportModule.mountPointOf(p4, "switch")
		local Switch2 = nil
		local v1 = nil
		local Flag = false
		OwnerModule.watch(Switch1, function(p5)
			-- upvalues: Switch (upval), Flag (ref), v1 (ref), Switch2 (ref), p2 (upval), p3 (upval), SupportModule (upval), p4 (copy), Switch1 (copy)
			local SwitchResult = Switch(p5)
			
			if Flag and SwitchResult == v1 then return end
			Flag = true
			v1 = SwitchResult
			
			if Switch2 ~= nil then
				Switch2()
				Switch2 = nil
			end
			local v2 = p2[SwitchResult]
			
			if v2 == nil then
				v2 = p3
			end
			if v2 ~= nil then
				Switch2 = SupportModule.mountBuilder(p4, Switch1, v2, "switch")
				
				return
			end
		end)
	end
end