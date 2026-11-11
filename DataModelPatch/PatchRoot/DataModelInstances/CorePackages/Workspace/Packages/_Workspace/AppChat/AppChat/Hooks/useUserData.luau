local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SignalsModule = require(Parent.Signals)
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local UserProfilesModule = require(Parent.UserProfiles)
local ReactModule = require(Parent.React)
local _ = require(AppChat.types)
local UseFoundationPresenceModule = require(script.Parent.useFoundationPresence)

local function _(p1, p2, p3)
	-- upvalues: SignalsModule (copy)
	return SignalsModule.createComputed(function(p4)
		-- upvalues: p2 (copy), p1 (copy), p3 (copy)
		if p2(p4) then
			return ""
		else
			local v1 = p1(p4)
			
			return v1.data and #v1.data ~= 0 and p3(v1.data[1].names) or ""
		end
	end)
end

return function(p1)
	-- upvalues: UserProfilesModule (copy), SignalsModule (copy), UseSignalBindingFunction (copy), UseFoundationPresenceModule (copy), ReactModule (copy)
	local GetResult = UserProfilesModule.Stores.UserProfileStore.get()
	local NamesByUserIds = if p1 and p1 ~= "" then GetResult.fetchNamesByUserIds({ p1 }) else nil
	local Computed = SignalsModule.createComputed(function(p2): boolean
		-- upvalues: NamesByUserIds (copy)
		return not NamesByUserIds or NamesByUserIds(p2).status ~= "success"
	end)
	local UseSignalBindingResult = UseSignalBindingFunction(Computed)
	
	local function v13(p2)
		local Username = p2.getUsername(false)
		
		return p2.getDisplayName(false) or Username
	end
	
	local UseSignalBindingResult1 = UseSignalBindingFunction((SignalsModule.createComputed(function(p2)
		-- upvalues: Computed (copy), NamesByUserIds (copy), v13 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v13(v1.data[1].names) or ""
		end
	end)))
	
	local function v15(p2)
		return p2.getUsername(false)
	end
	
	local UseSignalBindingResult2 = UseSignalBindingFunction((SignalsModule.createComputed(function(p2)
		-- upvalues: Computed (copy), NamesByUserIds (copy), v15 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v15(v1.data[1].names) or ""
		end
	end)))
	
	local function v17(Names)
		return Names.getCombinedName(false)
	end
	
	local UseSignalBindingResult3 = UseSignalBindingFunction((SignalsModule.createComputed(function(p2)
		-- upvalues: Computed (copy), NamesByUserIds (copy), v17 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v17(v1.data[1].names) or ""
		end
	end)))
	local UseFoundationPresenceModuleResult = UseFoundationPresenceModule(p1)
	
	return ReactModule.useMemo(function()
		-- upvalues: UseSignalBindingResult (copy), p1 (copy), UseSignalBindingResult1 (copy), UseSignalBindingResult3 (copy), UseSignalBindingResult2 (copy), UseFoundationPresenceModuleResult (copy)
		return {
			isLoading = UseSignalBindingResult,
			id = tonumber(p1) or -1,
			displayName = UseSignalBindingResult1,
			combinedName = UseSignalBindingResult3,
			username = UseSignalBindingResult2,
			presenceText = UseFoundationPresenceModuleResult.presenceText,
			presence = UseFoundationPresenceModuleResult.presence
		}
	end, { p1, UseFoundationPresenceModuleResult })
end