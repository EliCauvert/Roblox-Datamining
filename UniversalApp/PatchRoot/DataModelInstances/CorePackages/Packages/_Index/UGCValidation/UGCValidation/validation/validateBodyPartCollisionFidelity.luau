local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local _ = require(parent.util.Types)
local UGCValidationBodyPartCollisionFidelity = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default")

return function(p0, p1) --[[ line: 10 | named "validateBodyPartCollisionFidelity" ]]
	-- upvalues: UGCValidationBodyPartCollisionFidelity (ref), analyticsModule (ref)
	local descendants = p0:GetDescendants()
	table.insert(descendants, 1, p0)
	local default = Enum.CollisionFidelity.Default
	pcall(function() --[[ line: 18 ]]
		-- upvalues: default (write), UGCValidationBodyPartCollisionFidelity (copy)
		default = Enum.CollisionFidelity[UGCValidationBodyPartCollisionFidelity]
	end)
	local t = {}
	
	for i, v in descendants do
		if v:IsA("MeshPart") and v.CollisionFidelity ~= default then
			table.insert(t, `Expected {v:GetFullName()}.CollisionFidelity to be {default.Name}`)
		end
	end
	if #t == 0 then
		return true
	end
	analyticsModule.reportFailure(analyticsModule.ErrorType.validateBodyPartCollisionFidelity, nil, p1)
	
	return false, t
end