local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local useSignalBinding = require(parent.SignalsReact).useSignalBinding
local userProfilesModule = require(parent.UserProfiles)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local useFoundationPresenceModule = require(script.Parent.useFoundationPresence)

local function _(p1, p2, p3)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p4)
		-- upvalues: p2 (ref), p1 (ref), p3 (ref)
		if p2(p4) then
			return ""
		end
		local var1 = p1(p4)
		
		return if var1.data and #var1.data ~= 0 then p3(var1.data[1].names) or "" else ""
	end)
end

return function(p1)
	-- upvalues: userProfilesModule (ref), signalsModule (ref), useSignalBinding (ref), useFoundationPresenceModule (ref), reactModule (ref)
	local var1 = if p1 and p1 ~= "" then userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ p1 }) else nil
	local var2 = signalsModule.createComputed(function(p2)
		-- upvalues: var1 (ref)
		return if var1 then var1(p2).status ~= "success" else true
	end)
	local var3 = useSignalBinding(var2)
	
	local var4 = function(p2)
		return p2.getDisplayName(false) or p2.getUsername(false)
	end
	
	var4 = useSignalBinding(signalsModule.createComputed(function(p2)
		-- upvalues: var2 (ref), var1 (ref), var4 (ref)
		if var2(p2) then
			return ""
		end
		local var5 = var1(p2)
		
		return if var5.data and #var5.data ~= 0 then var4(var5.data[1].names) or "" else ""
	end))
	
	local var5 = function(p2)
		return p2.getUsername(false)
	end
	
	var5 = useSignalBinding(signalsModule.createComputed(function(p2)
		-- upvalues: var2 (ref), var1 (ref), var5 (ref)
		if var2(p2) then
			return ""
		end
		local var6 = var1(p2)
		
		return if var6.data and #var6.data ~= 0 then var5(var6.data[1].names) or "" else ""
	end))
	
	local var6 = function(p2)
		return p2.getCombinedName(false)
	end
	
	var6 = useSignalBinding(signalsModule.createComputed(function(p2)
		-- upvalues: var2 (ref), var1 (ref), var6 (ref)
		if var2(p2) then
			return ""
		end
		local var7 = var1(p2)
		
		return if var7.data and #var7.data ~= 0 then var6(var7.data[1].names) or "" else ""
	end))
	local var7 = useFoundationPresenceModule(p1)
	
	return reactModule.useMemo(function()
		-- upvalues: var3 (ref), p1 (ref), var4 (ref), var6 (ref), var5 (ref), var7 (ref)
		return {
			isLoading = var3,
			id = tonumber(p1) or -1,
			displayName = var4,
			combinedName = var6,
			username = var5,
			presenceText = var7.presenceText,
			presence = var7.presence
		}
	end, { p1, var7 })
end