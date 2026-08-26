local runService = game:GetService("RunService")
local requestTypeModule = require(script.Parent.Parent.Enums.RequestType)

return function(p1)
	-- upvalues: runService (ref), requestTypeModule (ref)
	return runService:IsStudio() and p1 ~= requestTypeModule.AvatarCreationFee
end