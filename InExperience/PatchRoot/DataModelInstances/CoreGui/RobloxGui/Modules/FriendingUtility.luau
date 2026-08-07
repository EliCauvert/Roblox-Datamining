local httpService = game:GetService("HttpService")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local starterGuiService = game:GetService("StarterGui")
local playersService = game:GetService("Players")
local fFlagRemoveHardCodedFriendLimitPromptModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
local t = {}
t.__index = t
local text = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "http:", "https:"), "www", "friends") .. "v1/users/{userId}/friends/count"

function t.GetFriendCountAsync(_, p0) --[[ line: 25 ]]
	-- upvalues: text (ref), httpRbxApiService (ref), httpService (ref)
	local count = nil
	local ok, status = pcall(function() --[[ line: 28 ]]
		-- upvalues: text (copy), p0 (ref), httpRbxApiService (copy)
		return httpRbxApiService:GetAsyncFullUrl(string.gsub(text, "{userId}", tostring(p0)))
	end)
	
	if not ok then
		print(text, "failed because", status)
		
		return nil
	end
	local var9 = httpService:JSONDecode(status)
	
	if var9.count then
		count = var9.count
	end
	return count
end

function t.MaxFriendCount(_) --[[ line: 46 ]]
	-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (ref)
	assert(not fFlagRemoveHardCodedFriendLimitPromptModule, "Should not call MaxFriendCount when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	
	return 200
end

local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
localPlayer.FriendStatusChanged:connect(function(p1, p2) --[[ line: 54 ]]
	-- upvalues: bindableEvent (ref), bindableEvent_1 (ref)
	if p2 == Enum.FriendStatus.Friend then
		bindableEvent:Fire(p1)
		
		return
	elseif p2 == Enum.FriendStatus.NotFriend then
		bindableEvent_1:Fire(p1)
	end
end)
starterGuiService:RegisterGetCore("PlayerFriendedEvent", function() --[[ line: 62 ]]
	-- upvalues: bindableEvent (ref)
	return bindableEvent
end)
starterGuiService:RegisterGetCore("PlayerUnfriendedEvent", function() --[[ line: 63 ]]
	-- upvalues: bindableEvent_1 (ref)
	return bindableEvent_1
end)

return t