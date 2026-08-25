local parent = script:FindFirstAncestor("Moments").Parent
local playersService = game:GetService("Players")
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)

local function _(value, p0)
	if value == nil then
		return nil
	end
	for i, v in value do
		if v.assetId == p0 then
			return v
		end
	end
	return nil
end

return function(p1, p2)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), playersService (ref)
	local localUserId
	p2 = p2 or {}
	local var3 = if p2.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p2.userStore
	local wait = p2.wait or function(p3)
		task.wait(p3)
	end
	local _ = nil
	
	if p2.getLocalUserId == nil then
		local localPlayer = playersService.LocalPlayer
		localUserId = if localPlayer ~= nil then nil else localPlayer.UserId
	else
		localUserId = p2.getLocalUserId()
	end
	if localUserId == nil then
		return nil
	end
	for i = 1, 6 do
		if i > 1 then
			wait(2)
		end
		var3.invalidateUser(localUserId)
		local var6, var7 = var3.getUserMoments(localUserId, nil):await()
		
		if not var6 then
			continue
		end
		local var8
		local moments = var7.moments
		
		if moments == nil then
			var8 = nil
		else
			for i, v in moments do
				if v.assetId == p1 then
					var8 = v
				end
			end
			var8 = nil
		end
		if var8 == nil then
			continue
		end
		return var8
	end
	return nil
end