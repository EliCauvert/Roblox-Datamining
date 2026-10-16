local Parent = script:FindFirstAncestor("UserList").Parent
local SignalsModule = require(Parent.Signals)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UserProfilesModule = require(Parent.UserProfiles)
local ReactModule = require(Parent.React)

local function _(p1, p2, p3) --[[ Line: 17 | Named "createUserProfileNameGetter" ]]
	-- upvalues: SignalsModule (copy)
	return SignalsModule.createComputed(function(p4) --[[ Line: 18 ]]
		-- upvalues: p2 (copy), p1 (copy), p3 (copy)
		if p2(p4) then
			return ""
		else
			local v1 = p1(p4)
			
			return v1.data and #v1.data ~= 0 and p3(v1.data[1].names) or ""
		end
	end)
end

return function(p1) --[[ Line: 31 | Named "useUserDataValues" ]]
	-- upvalues: UserProfilesModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), ReactModule (copy)
	local GetResult = UserProfilesModule.Stores.UserProfileStore.get()
	local NamesByUserIds = if p1 and p1 ~= "" then GetResult.fetchNamesByUserIds({ p1 }) else nil
	local Computed = SignalsModule.createComputed(function(p2): boolean --[[ Line: 35 ]]
		-- upvalues: NamesByUserIds (copy)
		return not NamesByUserIds or NamesByUserIds(p2).status ~= "success"
	end)
	local UseSignalStateResult = UseSignalStateFunction(Computed)
	
	local function v10(p2) --[[ Line: 44 ]]
		local Username = p2.getUsername(false)
		
		return p2.getDisplayName(false) or Username
	end
	
	local UseSignalStateResult1 = UseSignalStateFunction((SignalsModule.createComputed(function(p2) --[[ Line: 18 ]]
		-- upvalues: Computed (copy), NamesByUserIds (copy), v10 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v10(v1.data[1].names) or ""
		end
	end)))
	
	local function v12(p2) --[[ Line: 51 ]]
		return p2.getUsername(false)
	end
	
	local UseSignalStateResult2 = UseSignalStateFunction((SignalsModule.createComputed(function(p2) --[[ Line: 18 ]]
		-- upvalues: Computed (copy), NamesByUserIds (copy), v12 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v12(v1.data[1].names) or ""
		end
	end)))
	
	local function v14(Names) --[[ Line: 56 ]]
		return Names.getCombinedName(false)
	end
	
	local UseSignalStateResult3 = UseSignalStateFunction((SignalsModule.createComputed(function(p2) --[[ Line: 18 ]]
		-- upvalues: Computed (copy), NamesByUserIds (copy), v14 (copy)
		if Computed(p2) then
			return ""
		else
			local v1 = NamesByUserIds(p2)
			
			return v1.data and #v1.data ~= 0 and v14(v1.data[1].names) or ""
		end
	end)))
	
	return ReactModule.useMemo(function() --[[ Line: 62 ]]
		-- upvalues: UseSignalStateResult (copy), UseSignalStateResult1 (copy), UseSignalStateResult3 (copy), UseSignalStateResult2 (copy)
		return {
			isLoading = UseSignalStateResult or false,
			displayName = UseSignalStateResult1 or "",
			combinedName = UseSignalStateResult3 or "",
			username = UseSignalStateResult2 or ""
		}
	end, {
		p1,
		UseSignalStateResult,
		UseSignalStateResult1,
		UseSignalStateResult3,
		UseSignalStateResult2
	})
end