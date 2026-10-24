local _ = require(script.Parent.Types.model)
local AcpProtocolModule = require(script.Parent.Acp.AcpProtocol)

local function _(p1: number): boolean
	return typeof(p1) == "number" and p1 >= 0 and p1 <= 9007199254740991
end

return function(p1)
	-- upvalues: AcpProtocolModule (copy)
	if typeof(p1) ~= "table" or p1.code ~= AcpProtocolModule.ErrorCodes.OutOfCredits then
		return nil, nil
	end
	local Message = p1.message
	
	if Message == "FreeTrialExhausted" then
		return Message, nil
	end
	if Message ~= "InsufficientRobuxBalance" and Message ~= "DailyLimitReached" then
		return nil, nil
	end
	local Data = p1.data
	
	if typeof(Data) == "table" and (Data.model == "default" or Data.model == "advanced") then
		local RequiredRobux: number = Data.requiredRobux
		
		if typeof(RequiredRobux) == "number" and (RequiredRobux >= 0 and RequiredRobux <= 9007199254740991) then
			local AvailableRobux: number = Data.availableRobux
			
			if typeof(AvailableRobux) == "number" and (AvailableRobux >= 0 and AvailableRobux <= 9007199254740991) then
				return Message, {
					model = Data.model,
					requiredRobux = Data.requiredRobux,
					availableRobux = Data.availableRobux
				}
			end
		end
	end
	return Message, nil
end