local collectionService = game:GetService("CollectionService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local t = {}
local var4 = 0

return {
	bind = function(p0, p1) --[[ line: 23 ]]
		-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var4 (write), t (ref), constantsModule (ref), collectionService (ref)
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			assert(if p1.mediaType ~= "image" then p1.mediaType == "video" else true, "ad media type must be image or video")
			assert(p1.mediaType == "video" == (p1.videoPlaybackStateRef ~= nil), "video metadata must include playback state and image metadata must not")
		end
		var4 += 1
		local var5 = tostring(var4)
		t[var5] = p1
		p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, var5)
		collectionService:AddTag(p0, constantsModule.CandidateTag)
		
		return function() --[[ line: 37 ]]
			-- upvalues: p0 (ref), constantsModule (copy), var5 (ref), collectionService (copy), t (copy)
			if p0:GetAttribute(constantsModule.ViewabilityTargetIdAttribute) == var5 then
				collectionService:RemoveTag(p0, constantsModule.CandidateTag)
				p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, nil)
			end
			t[var5] = nil
		end
	end,
	get = function(p2) --[[ line: 47 ]]
		-- upvalues: t (ref)
		return t[p2]
	end,
	_clear = function() --[[ line: 51 ]]
		-- upvalues: t (ref)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function() --[[ line: 57 ]]
		-- upvalues: t (ref)
		local var6 = 0
		
		for i in t do
			var6 += 1
		end
		return var6
	end
}