local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local signalsModule = require(parent.Signals)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local var1 = createDataCacheModule()
local t = {}
local var2 = getLocalPlayerUserId()
playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: getLocalPlayerUserId (ref), var2 (write), t (ref)
	local var3 = getLocalPlayerUserId()
	
	if var3 ~= var2 then
		var2 = var3
		table.clear(t)
	end
end)
local var3 = nil

local function _()
	-- upvalues: var3 (write), parent (ref)
	if not var3 then
		var3 = require(parent.UserProfiles.Stores).UserProfileStore
	end
	return var3
end

local _ = function(p1)
	-- upvalues: var3 (write), parent (ref)
	if not var3 then
		var3 = require(parent.UserProfiles.Stores).UserProfileStore
	end
	return var3.get().getProfileByUserId(p1)
end

local function getStatusAndFetch(p1)
	-- upvalues: var1 (ref), var3 (write), parent (ref)
	local item, item_1 = var1.getItem(p1)
	
	if item_1 then
		if not var3 then
			var3 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		var3.get().fetchNamesByUserIds({ p1 }, function(p2)
			-- upvalues: var1 (copy), p1 (ref)
			if p2.status == "success" then
				var1.replaceItem(p1, true)
				
				return
			elseif p2.status == "failed" then
				var1.markItemsAsFailed({ p1 })
			end
		end)
	end
	return item, item_1
end

local function resolveUserProfileField(p1, p2, p3)
	return if p2 == "userId" then tonumber(p1.userId) elseif p2 == "username" then p1.names.getUsername(p3) elseif p2 == "displayName" then p1.names.getDisplayName(p3) elseif p2 == "isVerified" then if p1.getIsVerified == nil then nil else p1.getIsVerified(p3) else nil
end

return {
	resolveField = function(_, p1, p2, p3, _)
		-- upvalues: getStatusAndFetch (ref), dataHydrationTypesModule (ref), var3 (write), parent (ref), resolveUserProfileField (ref)
		if #p1 < 2 then
			return nil, nil
		end
		local var4 = tostring(p2)
		local var5 = getStatusAndFetch(var4).status(p3)
		
		if var5 ~= dataHydrationTypesModule.DataStatus.Ready then
			return nil, var5
		elseif not var3 then
			var3 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		local profileByUserId = var3.get().getProfileByUserId(var4)
		
		if profileByUserId then
			return resolveUserProfileField(profileByUserId, p1[2], p3), var5
		end
		return nil, var5
	end,
	updateFromHydration = function(p1)
		-- upvalues: var3 (write), parent (ref), var1 (ref)
		if not var3 then
			var3 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		var3.get().updateFromHydration(p1)
		local t = {}
		
		for i, v in p1 do
			t[if v.userId ~= nil then i else tostring(v.userId)] = true
		end
		var1.replaceItems(t)
	end,
	getAndFetchUserInfo = function(p2)
		-- upvalues: t (ref), signalsModule (ref), getStatusAndFetch (ref), dataHydrationTypesModule (ref), var3 (write), parent (ref)
		local var4 = tostring(p2)
		local var5 = t[var4]
		
		if var5 == nil then
			local var6 = signalsModule.createComputed(function(p3)
				-- upvalues: getStatusAndFetch (copy), var4 (ref)
				return getStatusAndFetch(var4).status(p3)
			end)
			local t_1 = {
				info = signalsModule.createComputed(function(p3)
					-- upvalues: var6 (ref), dataHydrationTypesModule (copy), var4 (ref), var3 (copy), parent (copy)
					if var6(p3) ~= dataHydrationTypesModule.DataStatus.Ready then
						return nil
					end
					local var7 = var4
					
					if not var3 then
						var3 = require(parent.UserProfiles.Stores).UserProfileStore
					end
					local profileByUserId = var3.get().getProfileByUserId(var7)
					
					return if profileByUserId == nil then nil else {
						userId = tonumber(var4),
						displayName = profileByUserId.names.getDisplayName(p3),
						username = profileByUserId.names.getUsername(p3),
						hasVerifiedBadge = if profileByUserId.getIsVerified ~= nil then false else profileByUserId.getIsVerified(p3)
					}
				end),
				status = var6
			}
			t[var4] = t_1
			
			return t_1
		end
		return var5
	end
}