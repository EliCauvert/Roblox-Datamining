local Parent = script:FindFirstAncestor("Moments").Parent
local Players = game:GetService("Players")
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)

local function _(List, AssetId)
	if List == nil then
		return nil
	end
	for _, value in List do
		if value.assetId == AssetId then
			return value
		end
	end
	return nil
end

return function(AssetId, p1)
	-- upvalues: MomentsGetMomentsUserStoreModule (copy), Players (copy)
	local P3 = p1 or {}
	local MomentsGetMomentsUserStoreModuleResult = if P3.userStore == nil then MomentsGetMomentsUserStoreModule(false) else P3.userStore
	local Wait: (any) -> () = P3.wait or function(Duration)
		task.wait(Duration)
	end
	local LocalUserId = nil
	
	if P3.getLocalUserId == nil then
		local LocalPlayer = Players.LocalPlayer
		LocalUserId = if LocalPlayer == nil then nil else LocalPlayer.UserId
	else
		LocalUserId = P3.getLocalUserId()
	end
	if LocalUserId == nil then
		return nil
	end
	local v1 = nil
	for i = 1, 6 do
		if i > 1 then
			Wait(2)
		end
		MomentsGetMomentsUserStoreModuleResult.invalidateUser(LocalUserId)
		local v2, v3 = MomentsGetMomentsUserStoreModuleResult.getUserMoments(LocalUserId, nil):await()
		
		if v2 then
			local Moments = v3.moments
			
			if Moments == nil then
				v1 = nil
			else
				v1 = nil
				
				for _, moment in Moments do
					if moment.assetId == AssetId then
						v1 = moment
						break
					end
				end
			end
			if v1 ~= nil then
				return v1
			end
		end
	end
	return nil
end