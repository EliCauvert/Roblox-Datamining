local _ = require(script.Parent.FaceChatUtils)

return function(p1): string
	if not p1.ignoreCoreGui and not p1.coreGuiEnabled then
		return "unavailable"
	elseif p1.isUnsupportedInCloudPlay then
		return "available"
	else
		local Permissions = p1.permissions
		
		if Permissions then
			local PlaceCamEnabled = Permissions.placeCamEnabled or Permissions.placeMicEnabled
			local UserCamEligible = Permissions.userCamEligible or Permissions.userMicEligible
			
			return if PlaceCamEnabled and UserCamEligible then "available" else "unavailable"
		else
			return "unavailable"
		end
	end
end