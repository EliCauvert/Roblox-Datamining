local HttpService = game:GetService("HttpService")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local FFlagRemoveHardCodedFriendLimitPromptModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagRemoveHardCodedFriendLimitPrompt)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
local Module = {}
Module.__index = Module
local Text = string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "http:", "https:"), "www", "friends") .. "v1/users/{userId}/friends/count"

function Module:GetFriendCountAsync(p1) --[[ Line: 25 ]]
	-- upvalues: Text (copy), HttpRbxApiService (copy), HttpService (copy)
	local Count = nil
	local Success, Result = pcall(function() --[[ Line: 28 ]]
		-- upvalues: Text (upval), p1 (copy), HttpRbxApiService (upval)
		return HttpRbxApiService:GetAsyncFullUrl((string.gsub(Text, "{userId}", (tostring(p1)))))
	end)
	
	if not Success then
		print(Text, "failed because", Result)
		
		return nil
	end
	local Data = HttpService:JSONDecode(Result)
	
	if Data.count then
		Count = Data.count
	end
	return Count
end

function Module:MaxFriendCount(): number --[[ Line: 46 ]]
	-- upvalues: FFlagRemoveHardCodedFriendLimitPromptModule (copy)
	assert(not FFlagRemoveHardCodedFriendLimitPromptModule, "Should not call MaxFriendCount when FFlagRemoveHardCodedFriendLimitPrompt is enabled")
	
	return 200
end

local BindableEvent = Instance.new("BindableEvent")
local BindableEvent1 = Instance.new("BindableEvent")
LocalPlayer.FriendStatusChanged:connect(function(Player, FriendStatus) --[[ Line: 54 ]]
	-- upvalues: BindableEvent (copy), BindableEvent1 (copy)
	if FriendStatus == Enum.FriendStatus.Friend then
		BindableEvent:Fire(Player)
		
		return
	end
	if FriendStatus == Enum.FriendStatus.NotFriend then
		BindableEvent1:Fire(Player)
	end
end)
StarterGui:RegisterGetCore("PlayerFriendedEvent", function() --[[ Line: 62 ]]
	-- upvalues: BindableEvent (copy)
	return BindableEvent
end)
StarterGui:RegisterGetCore("PlayerUnfriendedEvent", function() --[[ Line: 63 ]]
	-- upvalues: BindableEvent1 (copy)
	return BindableEvent1
end)

return Module