local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local inExperienceAppChatModalModule = require(parent.AppChat.InExperienceAppChatModal)
local getFriendsTabVisibilityStoreModule = require(script.Parent.Parent.GetFriendsTabVisibilityStore)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), getFriendsTabVisibilityStoreModule (ref), inExperienceAppChatModalModule (ref)
	local var3, var4 = createSignal(0)
	local var5 = 0
	local var6 = false
	local var7 = createComputed(function(p0)
		-- upvalues: getFriendsTabVisibilityStoreModule (copy), var3 (ref)
		return if getFriendsTabVisibilityStoreModule(p0).getIsFriendsTabVisible(p0) then var3(p0) else 0
	end)
	
	local function establishBaseline(p1)
		-- upvalues: var6 (write), var5 (write), var4 (ref)
		var6 = true
		var5 = p1
		var4(0)
	end
	
	local function recordCanonicalCount(p2)
		-- upvalues: var6 (write), getFriendsTabVisibilityStoreModule (copy), var5 (write), var4 (ref), var3 (ref)
		if var6 and getFriendsTabVisibilityStoreModule(false).getIsFriendsTabVisible(false) then
			local var11 = p2 - var5
			
			if var11 > 0 then
				var4(var3(false) + var11)
			end
		end
		var5 = p2
	end
	
	local function clearDisplayCount()
		-- upvalues: var4 (ref)
		var4(0)
	end
	
	local default = inExperienceAppChatModalModule.default
	
	if default.hasReceivedInitialUnreadCount then
		var6 = true
		var5 = default.unreadCount or 0
		var4(0)
	end
	default.initialUnreadCountSignal.Event:Connect(establishBaseline)
	default.unreadCountSignal.Event:Connect(recordCanonicalCount)
	
	return {
		getUnreadCountToDisplay = var7,
		clearDisplayCount = clearDisplayCount
	}
end