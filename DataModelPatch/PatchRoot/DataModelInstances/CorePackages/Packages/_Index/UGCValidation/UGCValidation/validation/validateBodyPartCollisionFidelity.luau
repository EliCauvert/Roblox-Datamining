local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local _ = require(Parent.util.Types)
local UGCValidationBodyPartCollisionFidelity = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default")

return function(Object, p1)
	-- upvalues: UGCValidationBodyPartCollisionFidelity (copy), AnalyticsModule (copy)
	local Descendants = Object:GetDescendants()
	table.insert(Descendants, 1, Object)
	local Default = Enum.CollisionFidelity.Default
	pcall(function()
		-- upvalues: Default (ref), UGCValidationBodyPartCollisionFidelity (upval)
		Default = Enum.CollisionFidelity[UGCValidationBodyPartCollisionFidelity]
	end)
	local List = {}
	
	for _, Part in Descendants do
		if Part:IsA("MeshPart") and Part.CollisionFidelity ~= Default then
			table.insert(List, `Expected {Part:GetFullName()}.CollisionFidelity to be {Default.Name}`)
		end
	end
	if #List == 0 then
		return true
	else
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateBodyPartCollisionFidelity, nil, p1)
		
		return false, List
	end
end