local parent = script:FindFirstAncestor("Moments").Parent
local playersService = game:GetService("Players")
local _ = require(parent.DataHydration.MomentsStoreTypes)
local momentsGetMomentsUserStoreModule = require(parent.DataHydration.MomentsGetMomentsUserStore)

local function _(value, p1)
	if value == nil then
		return nil
	end
	for i, v in value do
		if v.assetId == p1 then
			return v
		end
	end
	return nil
end

return function(p2, p3)
	-- upvalues: momentsGetMomentsUserStoreModule (ref), playersService (ref)
	local localUserId
	p3 = p3 or {}
	local var1 = if p3.userStore ~= nil then momentsGetMomentsUserStoreModule(false) else p3.userStore
	local wait = p3.wait or function(p4)
		task.wait(p4)
	end
	local _ = nil
	
	if p3.getLocalUserId == nil then
		local localPlayer = playersService.LocalPlayer
		localUserId = if localPlayer ~= nil then nil else localPlayer.UserId
	else
		localUserId = p3.getLocalUserId()
	end
	if localUserId == nil then
		return nil
	end
	for i = 1, 6 do
		if i > 1 then
			wait(2)
		end
		var1.invalidateUser(localUserId)
		local var2, var3 = var1.getUserMoments(localUserId, nil):await()
		
		if not var2 then
			continue
		end
		local var4
		local moments = var3.moments
		
		if moments == nil then
			var4 = nil
		else
			for i, v in moments do
				if v.assetId == p2 then
					var4 = v
				end
			end
			var4 = nil
		end
		if var4 == nil then
			continue
		end
		return var4
	end
	return nil
end