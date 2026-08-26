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

function t.GetFriendCountAsync(_, p1)
	-- upvalues: text (ref), httpRbxApiService (ref), httpService (ref)
	local count = nil
	local ok, status = pcall(function()
		-- upvalues: text (copy), p1 (ref), httpRbxApiService (copy)
		return httpRbxApiService:GetAsyncFullUrl(string.gsub(text, "{userId}", tostring(p1)))
	end)
	
	if not ok then
		print(text, "failed because", status)
		
		return nil
	end
	local var1 = httpService:JSONDecode(status)
	
	if var1.count then
		count = var1.count
	end
	return count
end

function t.MaxFriendCount(_)
	-- upvalues: fFlagRemoveHardCodedFriendLimitPromptModule (ref)
	assert(not fFlagRemoveHardCodedFriendLimitPromptModule, "Should not call MaxFriendCount when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	
	return 200
end

local bindableEvent = Instance.new("BindableEvent")
local bindableEvent_1 = Instance.new("BindableEvent")
localPlayer.FriendStatusChanged:connect(function(p1, p2)
	-- upvalues: bindableEvent (ref), bindableEvent_1 (ref)
	if p2 == Enum.FriendStatus.Friend then
		bindableEvent:Fire(p1)
		
		return
	elseif p2 == Enum.FriendStatus.NotFriend then
		bindableEvent_1:Fire(p1)
	end
end)
starterGuiService:RegisterGetCore("PlayerFriendedEvent", function()
	-- upvalues: bindableEvent (ref)
	return bindableEvent
end)
starterGuiService:RegisterGetCore("PlayerUnfriendedEvent", function()
	-- upvalues: bindableEvent_1 (ref)
	return bindableEvent_1
end)

return t