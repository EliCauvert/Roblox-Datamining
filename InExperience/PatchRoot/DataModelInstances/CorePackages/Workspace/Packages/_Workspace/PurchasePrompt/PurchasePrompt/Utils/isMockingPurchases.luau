local runService = game:GetService("RunService")
local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(p0) --[[ line: 11 | named "isMockingPurchases" ]]
	-- upvalues: runService (ref), requestTypeModule (ref)
	return runService:IsStudio() and p0 ~= requestTypeModule.AvatarCreationFee
end