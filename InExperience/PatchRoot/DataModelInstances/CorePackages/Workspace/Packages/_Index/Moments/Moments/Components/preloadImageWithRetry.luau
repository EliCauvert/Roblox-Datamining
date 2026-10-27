local ContentProvider = game:GetService("ContentProvider")
local list = { 0.5, 1, 2 }

local function _(AssetFetchStatus): boolean
	return AssetFetchStatus == Enum.AssetFetchStatus.Failure or AssetFetchStatus == Enum.AssetFetchStatus.TimedOut
end

return function(ContentId, p1, p2)
	-- upvalues: ContentProvider (copy), list (copy)
	local ContentProvider1 = if p2 and p2.contentProvider then p2.contentProvider else ContentProvider
	local RetryDelays = if p2 and p2.retryDelays then p2.retryDelays else list
	local Wait: (any) -> () = if p2 and p2.wait then p2.wait else task.wait
	for i = 1, #RetryDelays + 1 do
		local AssetFetchStatus = nil
		pcall(function()
			-- upvalues: ContentProvider1 (copy), ContentId (copy), AssetFetchStatus (ref)
			ContentProvider1:PreloadAsync({ ContentId }, function(ContentId1, p3)
				-- upvalues: ContentId (upval), AssetFetchStatus (upval)
				if ContentId1 == ContentId then
					AssetFetchStatus = p3
				end
			end)
		end)
		
		if not p1.isCurrent() then return end
		local AssetFetchStatus1 = ContentProvider1:GetAssetFetchStatus(ContentId)
		
		if AssetFetchStatus == Enum.AssetFetchStatus.Success or AssetFetchStatus1 == Enum.AssetFetchStatus.Success then
			p1.onSuccess()
			
			return
		end
		local AssetFetchStatus2 = AssetFetchStatus
		
		if AssetFetchStatus2 ~= Enum.AssetFetchStatus.Failure and AssetFetchStatus2 ~= Enum.AssetFetchStatus.TimedOut and (AssetFetchStatus1 ~= Enum.AssetFetchStatus.Failure and AssetFetchStatus1 ~= Enum.AssetFetchStatus.TimedOut) then return end
		local RetryDelay = RetryDelays[i]
		
		if RetryDelay == nil then break end
		Wait(RetryDelay)
		
		if not p1.isCurrent() then return end
	end
	p1.onGiveUp()
end