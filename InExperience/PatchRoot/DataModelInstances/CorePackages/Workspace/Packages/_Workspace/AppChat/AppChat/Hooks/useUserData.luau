local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local signalsModule = require(parent.Signals)
local useSignalBinding = require(parent.SignalsReact).useSignalBinding
local userProfilesModule = require(parent.UserProfiles)
local reactModule = require(parent.React)
local _ = require(appChat.types)
local useFoundationPresenceModule = require(script.Parent.useFoundationPresence)

local function _(p0, p1, p2)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref), p0 (ref), p2 (ref)
		if p1(p3) then
			return ""
		end
		local var5 = p0(p3)
		
		return if var5.data and #var5.data ~= 0 then p2(var5.data[1].names) or "" else ""
	end)
end

return function(p4)
	-- upvalues: userProfilesModule (ref), signalsModule (ref), useSignalBinding (ref), useFoundationPresenceModule (ref), reactModule (ref)
	local var6 = if p4 and p4 ~= "" then userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ p4 }) else nil
	local var7 = signalsModule.createComputed(function(p5)
		-- upvalues: var6 (ref)
		return if var6 then var6(p5).status ~= "success" else true
	end)
	local var8 = useSignalBinding(var7)
	
	local var9 = function(p6)
		return p6.getDisplayName(false) or p6.getUsername(false)
	end
	
	var9 = useSignalBinding(signalsModule.createComputed(function(p7)
		-- upvalues: var7 (ref), var6 (ref), var9 (ref)
		if var7(p7) then
			return ""
		end
		local var5 = var6(p7)
		
		return if var5.data and #var5.data ~= 0 then var9(var5.data[1].names) or "" else ""
	end))
	
	local var10 = function(p8)
		return p8.getUsername(false)
	end
	
	var10 = useSignalBinding(signalsModule.createComputed(function(p9)
		-- upvalues: var7 (ref), var6 (ref), var10 (ref)
		if var7(p9) then
			return ""
		end
		local var5 = var6(p9)
		
		return if var5.data and #var5.data ~= 0 then var10(var5.data[1].names) or "" else ""
	end))
	
	local var11 = function(p10)
		return p10.getCombinedName(false)
	end
	
	var11 = useSignalBinding(signalsModule.createComputed(function(p11)
		-- upvalues: var7 (ref), var6 (ref), var11 (ref)
		if var7(p11) then
			return ""
		end
		local var5 = var6(p11)
		
		return if var5.data and #var5.data ~= 0 then var11(var5.data[1].names) or "" else ""
	end))
	local var12 = useFoundationPresenceModule(p4)
	
	return reactModule.useMemo(function()
		-- upvalues: var8 (ref), p4 (ref), var9 (ref), var11 (ref), var10 (ref), var12 (ref)
		return {
			isLoading = var8,
			id = tonumber(p4) or -1,
			displayName = var9,
			combinedName = var11,
			username = var10,
			presenceText = var12.presenceText,
			presence = var12.presence
		}
	end, { p4, var12 })
end