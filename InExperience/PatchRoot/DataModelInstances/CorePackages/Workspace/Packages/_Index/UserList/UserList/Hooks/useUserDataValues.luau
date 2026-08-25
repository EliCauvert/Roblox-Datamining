local parent = script:FindFirstAncestor("UserList").Parent
local signalsModule = require(parent.Signals)
local useSignalState = require(parent.SignalsReact).useSignalState
local userProfilesModule = require(parent.UserProfiles)
local reactModule = require(parent.React)

local function _(p0, p1, p2)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref), p0 (ref), p2 (ref)
		if p1(p3) then
			return ""
		end
		local var3 = p0(p3)
		
		return if var3.data and #var3.data ~= 0 then p2(var3.data[1].names) or "" else ""
	end)
end

return function(p4)
	-- upvalues: userProfilesModule (ref), signalsModule (ref), useSignalState (ref), reactModule (ref)
	local var4 = if p4 and p4 ~= "" then userProfilesModule.Stores.UserProfileStore.get().fetchNamesByUserIds({ p4 }) else nil
	local var5 = signalsModule.createComputed(function(p5)
		-- upvalues: var4 (ref)
		return if var4 then var4(p5).status ~= "success" else true
	end)
	local var6 = useSignalState(var5)
	
	local var7 = function(p6)
		return p6.getDisplayName(false) or p6.getUsername(false)
	end
	
	var7 = useSignalState(signalsModule.createComputed(function(p7)
		-- upvalues: var5 (ref), var4 (ref), var7 (ref)
		if var5(p7) then
			return ""
		end
		local var3 = var4(p7)
		
		return if var3.data and #var3.data ~= 0 then var7(var3.data[1].names) or "" else ""
	end))
	
	local var8 = function(p8)
		return p8.getUsername(false)
	end
	
	var8 = useSignalState(signalsModule.createComputed(function(p9)
		-- upvalues: var5 (ref), var4 (ref), var8 (ref)
		if var5(p9) then
			return ""
		end
		local var3 = var4(p9)
		
		return if var3.data and #var3.data ~= 0 then var8(var3.data[1].names) or "" else ""
	end))
	
	local var9 = function(p10)
		return p10.getCombinedName(false)
	end
	
	var9 = useSignalState(signalsModule.createComputed(function(p11)
		-- upvalues: var5 (ref), var4 (ref), var9 (ref)
		if var5(p11) then
			return ""
		end
		local var3 = var4(p11)
		
		return if var3.data and #var3.data ~= 0 then var9(var3.data[1].names) or "" else ""
	end))
	
	return reactModule.useMemo(function()
		-- upvalues: var6 (ref), var7 (ref), var9 (ref), var8 (ref)
		return {
			isLoading = var6 or false,
			displayName = var7 or "",
			combinedName = var9 or "",
			username = var8 or ""
		}
	end, {
		p4,
		var6,
		var7,
		var9,
		var8
	})
end