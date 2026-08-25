local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local dataHydrationTypesModule = require(dataHydration.DataHydrationTypes)
local signalsModule = require(parent.Signals)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local var5 = createDataCacheModule()
local t = {}
local var7 = getLocalPlayerUserId()
playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
	-- upvalues: getLocalPlayerUserId (ref), var7 (write), t (ref)
	local var11 = getLocalPlayerUserId()
	
	if var11 ~= var7 then
		var7 = var11
		table.clear(t)
	end
end)
local var8 = nil

local function _()
	-- upvalues: var8 (write), parent (ref)
	if not var8 then
		var8 = require(parent.UserProfiles.Stores).UserProfileStore
	end
	return var8
end

local _ = function(p0)
	-- upvalues: var8 (write), parent (ref)
	if not var8 then
		var8 = require(parent.UserProfiles.Stores).UserProfileStore
	end
	return var8.get().getProfileByUserId(p0)
end

local function getStatusAndFetch(p1)
	-- upvalues: var5 (ref), var8 (write), parent (ref)
	local item, item_1 = var5.getItem(p1)
	
	if item_1 then
		if not var8 then
			var8 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		var8.get().fetchNamesByUserIds({ p1 }, function(p2)
			-- upvalues: var5 (copy), p1 (ref)
			if p2.status == "success" then
				var5.replaceItem(p1, true)
				
				return
			elseif p2.status == "failed" then
				var5.markItemsAsFailed({ p1 })
			end
		end)
	end
	return item, item_1
end

local function resolveUserProfileField(p3, p4, p5)
	return if p4 == "userId" then tonumber(p3.userId) elseif p4 == "username" then p3.names.getUsername(p5) elseif p4 == "displayName" then p3.names.getDisplayName(p5) elseif p4 == "isVerified" then if p3.getIsVerified == nil then nil else p3.getIsVerified(p5) else nil
end

return {
	resolveField = function(_, p6, p7, p8, _)
		-- upvalues: getStatusAndFetch (ref), dataHydrationTypesModule (ref), var8 (write), parent (ref), resolveUserProfileField (ref)
		if #p6 < 2 then
			return nil, nil
		end
		local var14 = tostring(p7)
		local var15 = getStatusAndFetch(var14).status(p8)
		
		if var15 ~= dataHydrationTypesModule.DataStatus.Ready then
			return nil, var15
		elseif not var8 then
			var8 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		local profileByUserId = var8.get().getProfileByUserId(var14)
		
		if profileByUserId then
			return resolveUserProfileField(profileByUserId, p6[2], p8), var15
		end
		return nil, var15
	end,
	updateFromHydration = function(p9)
		-- upvalues: var8 (write), parent (ref), var5 (ref)
		if not var8 then
			var8 = require(parent.UserProfiles.Stores).UserProfileStore
		end
		var8.get().updateFromHydration(p9)
		local t = {}
		
		for i, v in p9 do
			t[if v.userId ~= nil then i else tostring(v.userId)] = true
		end
		var5.replaceItems(t)
	end,
	getAndFetchUserInfo = function(p10)
		-- upvalues: t (ref), signalsModule (ref), getStatusAndFetch (ref), dataHydrationTypesModule (ref), var8 (write), parent (ref)
		local var18 = tostring(p10)
		local var19 = t[var18]
		
		if var19 == nil then
			local var20 = signalsModule.createComputed(function(p11)
				-- upvalues: getStatusAndFetch (copy), var18 (ref)
				return getStatusAndFetch(var18).status(p11)
			end)
			local t_1 = {
				info = signalsModule.createComputed(function(p12)
					-- upvalues: var20 (ref), dataHydrationTypesModule (copy), var18 (ref), var8 (copy), parent (copy)
					if var20(p12) ~= dataHydrationTypesModule.DataStatus.Ready then
						return nil
					end
					local var22 = var18
					
					if not var8 then
						var8 = require(parent.UserProfiles.Stores).UserProfileStore
					end
					local profileByUserId = var8.get().getProfileByUserId(var22)
					
					return if profileByUserId == nil then nil else {
						userId = tonumber(var18),
						displayName = profileByUserId.names.getDisplayName(p12),
						username = profileByUserId.names.getUsername(p12),
						hasVerifiedBadge = if profileByUserId.getIsVerified ~= nil then false else profileByUserId.getIsVerified(p12)
					}
				end),
				status = var20
			}
			t[var18] = t_1
			
			return t_1
		end
		return var19
	end
}