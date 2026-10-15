local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local fFlagMomentsModeratedMomentPageModule = require(moments.Flags.FFlagMomentsModeratedMomentPage)
local fFlagMomentsServeEDPVideos = require(parent.SharedFlags).FFlagMomentsServeEDPVideos
local var1 = if fFlagMomentsServeEDPVideos then require(parent.DataHydration.GameGetPlayabilityStore) else nil
local var2 = if fFlagMomentsServeEDPVideos then require(parent.VideoUtils).isVideoEligibleForPlayability else nil
local toMediaItemModule = require(script.Parent.toMediaItem)

local function _(p1)
	if p1.kind ~= "moment" then
		return false
	end
	local moment = p1.moment
	
	return moment ~= nil and moment.metadata ~= nil
end

return function(p1, p2, p3)
	-- upvalues: fFlagMomentsServeEDPVideos (ref), var1 (ref), var2 (ref), toMediaItemModule (ref), fFlagMomentsModeratedMomentPageModule (ref)
	local var3 = if fFlagMomentsServeEDPVideos then {} else nil
	local var4 = if fFlagMomentsServeEDPVideos then function(p4, p5)
		-- upvalues: var3 (ref), var1 (copy), var2 (copy)
		local var5
		if p4.kind == "moment" then
			local moment = p4.moment
			var5 = moment ~= nil and moment.metadata ~= nil
		else
			var5 = false
		end
		if not var5 then
			return false
		end
		local moment = p4.moment
		
		if moment.entityType ~= "edpVideo" then
			return true
		end
		local universeId = moment.metadata.universeId
		
		if universeId == nil or universeId <= 0 then
			return false
		end
		local var6 = tostring(universeId)
		local var7 = var3[var6]
		
		if var7 == nil then
			var7 = var1(false).getPlayability(var6)
			var3[var6] = var7
		end
		return var2(var7.status(p5) == "Ready", var7.data(p5))
	end else nil
	
	return {
		getActiveIndex = if fFlagMomentsModeratedMomentPageModule or fFlagMomentsServeEDPVideos then function(p4)
			-- upvalues: p1 (ref), fFlagMomentsServeEDPVideos (copy), var4 (ref)
			local items = p1.getItems(p4)
			local currentIndex = p1.getCurrentIndex(p4)
			local var5 = 0
			
			for i = 1, math.min(currentIndex - 1, #items) do
				local var6
				if fFlagMomentsServeEDPVideos then
					var6 = var4(items[i], p4)
				else
					local var7 = items[i]
					
					if var7.kind == "moment" then
						local moment = var7.moment
						var6 = moment ~= nil and moment.metadata ~= nil
					else
						var6 = false
					end
				end
				if var6 then
					var5 += 1
				end
			end
			local var8 = items[currentIndex]
			
			if var8 ~= nil then
				local var9
				if fFlagMomentsServeEDPVideos then
					var9 = var4(var8, p4)
				elseif var8.kind == "moment" then
					local moment = var8.moment
					var9 = moment ~= nil and moment.metadata ~= nil
				else
					var9 = false
				end
				return if var9 then var5 + 1 else var5 + 0.5
			end
		end else p1.getCurrentIndex,
		getItems = function(p5)
			-- upvalues: p1 (ref), fFlagMomentsServeEDPVideos (copy), var4 (ref), toMediaItemModule (copy)
			local t = {}
			
			for i, v in p1.getItems(p5) do
				if not fFlagMomentsServeEDPVideos or var4(v, p5) then
					local var10 = toMediaItemModule(v, { includeLocalTts = true })
					
					if var10 ~= nil then
						table.insert(t, var10)
					end
				end
			end
			return t
		end,
		getPlaybackActive = p2,
		getCanAutoPlay = p3
	}
end