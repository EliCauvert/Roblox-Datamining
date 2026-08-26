local parent = script:FindFirstAncestor("FriendsChat").Parent
local signalsModule = require(parent.Signals)
local inExperienceAppChatModalModule = require(parent.AppChat.InExperienceAppChatModal)
local getFriendsTabVisibilityStoreModule = require(script.Parent.Parent.GetFriendsTabVisibilityStore)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), createComputed (ref), getFriendsTabVisibilityStoreModule (ref), inExperienceAppChatModalModule (ref)
	local var1, var2 = createSignal(0)
	local var3 = 0
	local var4 = false
	local var5 = createComputed(function(p1)
		-- upvalues: getFriendsTabVisibilityStoreModule (copy), var1 (ref)
		return if getFriendsTabVisibilityStoreModule(p1).getIsFriendsTabVisible(p1) then var1(p1) else 0
	end)
	
	local function establishBaseline(p1)
		-- upvalues: var4 (write), var3 (write), var2 (ref)
		var4 = true
		var3 = p1
		var2(0)
	end
	
	local function recordCanonicalCount(p1)
		-- upvalues: var4 (write), getFriendsTabVisibilityStoreModule (copy), var3 (write), var2 (ref), var1 (ref)
		if var4 and getFriendsTabVisibilityStoreModule(false).getIsFriendsTabVisible(false) then
			local var6 = p1 - var3
			
			if var6 > 0 then
				var2(var1(false) + var6)
			end
		end
		var3 = p1
	end
	
	local function clearDisplayCount()
		-- upvalues: var2 (ref)
		var2(0)
	end
	
	local default = inExperienceAppChatModalModule.default
	
	if default.hasReceivedInitialUnreadCount then
		var4 = true
		var3 = default.unreadCount or 0
		var2(0)
	end
	default.initialUnreadCountSignal.Event:Connect(establishBaseline)
	default.unreadCountSignal.Event:Connect(recordCanonicalCount)
	
	return {
		getUnreadCountToDisplay = var5,
		clearDisplayCount = clearDisplayCount
	}
end