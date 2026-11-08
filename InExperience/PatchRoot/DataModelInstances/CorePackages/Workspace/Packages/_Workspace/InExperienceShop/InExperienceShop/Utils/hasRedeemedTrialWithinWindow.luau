local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local _ = require(InExperienceShop.Types)
local FIntRedeemedTrialBlueDotMaxSecondsUntilEndModule = require(InExperienceShop.Flags.FIntRedeemedTrialBlueDotMaxSecondsUntilEnd)

return function(List): boolean
	-- upvalues: FIntRedeemedTrialBlueDotMaxSecondsUntilEndModule (copy)
	local UnixTimestamp = DateTime.now().UnixTimestamp
	
	for _, value in List do
		local EndTime = value.endTime
		
		if EndTime ~= nil and UnixTimestamp < EndTime.UnixTimestamp + FIntRedeemedTrialBlueDotMaxSecondsUntilEndModule then
			return true
		end
	end
	return false
end