local RunService = game:GetService("RunService")
local RequestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(AvatarCreationFee): boolean --[[ Line: 11 | Named "isMockingPurchases" ]]
	-- upvalues: RunService (copy), RequestTypeModule (copy)
	return RunService:IsStudio() and AvatarCreationFee ~= RequestTypeModule.AvatarCreationFee
end