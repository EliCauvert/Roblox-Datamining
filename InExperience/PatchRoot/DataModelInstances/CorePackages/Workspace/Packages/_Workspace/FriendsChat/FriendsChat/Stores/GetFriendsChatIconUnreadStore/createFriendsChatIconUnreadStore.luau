local Parent = script:FindFirstAncestor("FriendsChat").Parent
local SignalsModule = require(Parent.Signals)
local InExperienceAppChatModalModule = require(Parent.AppChat.InExperienceAppChatModal)
local GetFriendsTabVisibilityStoreModule = require(script.Parent.Parent.GetFriendsTabVisibilityStore)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function() --[[ Line: 41 ]]
	-- upvalues: CreateSignalFunction (copy), CreateComputedFunction (copy), GetFriendsTabVisibilityStoreModule (copy), InExperienceAppChatModalModule (copy)
	local Signal, Signal2 = CreateSignalFunction(0)
	local UnreadCount = 0
	local Flag = false
	local Computed = CreateComputedFunction(function(p1) --[[ Line: 50 ]]
		-- upvalues: GetFriendsTabVisibilityStoreModule (upval), Signal (copy)
		return if GetFriendsTabVisibilityStoreModule(p1).getIsFriendsTabVisible(p1) then Signal(p1) else 0
	end)
	
	local function establishBaseline(p1) --[[ Line: 57 ]]
		-- upvalues: Flag (ref), UnreadCount (ref), Signal2 (copy)
		Flag = true
		UnreadCount = p1
		Signal2(0)
	end
	
	local function recordCanonicalCount(p1) --[[ Line: 63 ]]
		-- upvalues: Flag (ref), GetFriendsTabVisibilityStoreModule (upval), UnreadCount (ref), Signal2 (copy), Signal (copy)
		if Flag and GetFriendsTabVisibilityStoreModule(false).getIsFriendsTabVisible(false) then
			local v1 = p1 - UnreadCount
			
			if v1 > 0 then
				Signal2(Signal(false) + v1)
			end
		end
		UnreadCount = p1
	end
	
	local function clearDisplayCount() --[[ Line: 75 ]]
		-- upvalues: Signal2 (copy)
		Signal2(0)
	end
	
	local Default = InExperienceAppChatModalModule.default
	
	if Default.hasReceivedInitialUnreadCount then
		Flag = true
		UnreadCount = Default.unreadCount or 0
		Signal2(0)
	end
	Default.initialUnreadCountSignal.Event:Connect(establishBaseline)
	Default.unreadCountSignal.Event:Connect(recordCanonicalCount)
	
	return {
		getUnreadCountToDisplay = Computed,
		clearDisplayCount = clearDisplayCount
	}
end