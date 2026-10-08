local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.Signals)
local _ = require(parent.MomentsCommon)
local _ = require(moments.Components.Feed.FeedTypes)
local fFlagMomentsModeratedMomentPageModule = require(moments.Flags.FFlagMomentsModeratedMomentPage)
local toMediaItemModule = require(script.Parent.toMediaItem)

local function _(p1)
	if p1.kind ~= "moment" then
		return false
	end
	local moment = p1.moment
	
	return moment ~= nil and moment.metadata ~= nil
end

return function(p1, p2, p3)
	-- upvalues: toMediaItemModule (ref), fFlagMomentsModeratedMomentPageModule (ref)
	return {
		getActiveIndex = if fFlagMomentsModeratedMomentPageModule then function(p4)
			-- upvalues: p1 (ref)
			local items = p1.getItems(p4)
			local currentIndex = p1.getCurrentIndex(p4)
			local var1 = 0
			
			for i = 1, math.min(currentIndex - 1, #items) do
				local var2
				local var3 = items[i]
				
				if var3.kind == "moment" then
					local moment = var3.moment
					var2 = moment ~= nil and moment.metadata ~= nil
				else
					var2 = false
				end
				if var2 then
					var1 += 1
				end
			end
			local var4 = items[currentIndex]
			
			if var4 ~= nil then
				local var5
				if var4.kind == "moment" then
					local moment = var4.moment
					var5 = moment ~= nil and moment.metadata ~= nil
				else
					var5 = false
				end
				return if var5 then var1 + 1 else var1 + 0.5
			end
		end else p1.getCurrentIndex,
		getItems = function(p5)
			-- upvalues: p1 (ref), toMediaItemModule (copy)
			local t = {}
			
			for i, v in p1.getItems(p5) do
				local var6 = toMediaItemModule(v, { includeLocalTts = true })
				
				if var6 ~= nil then
					table.insert(t, var6)
				end
			end
			return t
		end,
		getPlaybackActive = p2,
		getCanAutoPlay = p3
	}
end