local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local getAllInstancesIsAModule = require(parent.util.getAllInstancesIsA)

return {
	getData = function(p0) --[[ line: 17 ]]
		-- upvalues: getAllInstancesIsAModule (ref)
		local t = {}
		
		for i, v in getAllInstancesIsAModule(p0, "Animation") do
			local animationId = v.AnimationId
			
			if animationId ~= "" then
				local ok, status = pcall(function() --[[ line: 26 ]]
					-- upvalues: animationId (ref)
					return game:GetObjectsAllOrNone(animationId)
				end)
				
				if ok and status ~= nil then
					for i_1, v_1 in status do
						if v_1:IsA("CurveAnimation") then
							table.insert(t, v_1)
						end
					end
				end
				return nil
			end
		end
		return t
	end
}