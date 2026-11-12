local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local GetAllInstancesIsAModule = require(Parent.util.getAllInstancesIsA)
local GetFFlagUGCValidateCurveAnimSingleRootModule = require(Parent.flags.getFFlagUGCValidateCurveAnimSingleRoot)

return {
	getData = function(p1, p2)
		-- upvalues: GetAllInstancesIsAModule (copy), GetFFlagUGCValidateCurveAnimSingleRootModule (copy)
		local List = {}
		
		for _, Animation in GetAllInstancesIsAModule(p1, "Animation") do
			local AnimationId = Animation.AnimationId
			
			if AnimationId ~= "" then
				local PreloadedCurveAnimation = p2 and p2.preloadedCurveAnimations[AnimationId]
				
				if PreloadedCurveAnimation then
					table.insert(List, PreloadedCurveAnimation)
					continue
				end
				local Success, Result = pcall(function()
					-- upvalues: AnimationId (copy)
					return game:GetObjectsAllOrNone(AnimationId)
				end)
				
				if not Success or Result == nil then
					return nil
				end
				if not GetFFlagUGCValidateCurveAnimSingleRootModule() then
					for _, CurveAnimation in Result do
						if CurveAnimation:IsA("CurveAnimation") then
							table.insert(List, CurveAnimation)
						end
					end
				elseif #Result ~= 1 or not Result[1]:IsA("CurveAnimation") then
					return nil
				else
					table.insert(List, Result[1])
				end
			end
		end
		return List
	end
}