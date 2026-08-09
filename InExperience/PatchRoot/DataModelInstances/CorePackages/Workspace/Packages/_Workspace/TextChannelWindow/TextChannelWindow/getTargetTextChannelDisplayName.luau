local playersService = game:GetService("Players")
local localPlayer = playersService.LocalPlayer

local function getOtherDisplayNameInWhisperChannel(p0) --[[ line: 5 ]]
	-- upvalues: playersService (ref), localPlayer (ref)
	for i, v in p0:GetChildren() do
		if v:IsA("TextSource") then
			local userIdPlayerByUserId = playersService:GetPlayerByUserId(v.UserId)
			
			if userIdPlayerByUserId and userIdPlayerByUserId ~= localPlayer then
				return userIdPlayerByUserId.DisplayName
			end
		end
	end
	return nil
end

return function(p1) --[[ line: 18 | named "getTargetTextChannelDisplayName" ]]
	-- upvalues: getOtherDisplayNameInWhisperChannel (ref)
	if not p1 then
		return nil
	elseif string.match(p1.Name, "RBXTeam") then
		return "Team"
	elseif not string.match(p1.Name, "RBXWhisper") then
		return nil
	end
	local var3 = getOtherDisplayNameInWhisperChannel(p1)
	
	return if var3 then "To " .. var3 else nil
end