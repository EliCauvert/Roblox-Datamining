local collectionService = game:GetService("CollectionService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local t = {}
local var1 = 0

return {
	bind = function(p1, p2)
		-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var1 (write), t (ref), constantsModule (ref), collectionService (ref)
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			local isVideo = p2.mediaType == "video"
			
			if p2.mediaType ~= "image" and not isVideo then
				return function() end
			elseif isVideo ~= (p2.videoPlaybackStateRef ~= nil) then
				return function() end
			elseif p2.isFullscreen == true and not isVideo then
				return function() end
			end
		end
		var1 += 1
		local var2 = tostring(var1)
		t[var2] = p2
		p1:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, var2)
		collectionService:AddTag(p1, constantsModule.CandidateTag)
		
		return function()
			-- upvalues: p1 (ref), constantsModule (copy), var2 (ref), collectionService (copy), t (copy)
			if p1:GetAttribute(constantsModule.ViewabilityTargetIdAttribute) == var2 then
				collectionService:RemoveTag(p1, constantsModule.CandidateTag)
				p1:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, nil)
			end
			t[var2] = nil
		end
	end,
	get = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	_clear = function()
		-- upvalues: t (ref)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function()
		-- upvalues: t (ref)
		local var2 = 0
		
		for i in t do
			var2 += 1
		end
		return var2
	end
}