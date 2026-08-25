local collectionService = game:GetService("CollectionService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local t = {}
local var4 = 0

return {
	bind = function(p0, p1)
		-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var4 (write), t (ref), constantsModule (ref), collectionService (ref)
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			local isVideo = p1.mediaType == "video"
			
			if p1.mediaType ~= "image" and not isVideo then
				return function() end
			elseif isVideo ~= (p1.videoPlaybackStateRef ~= nil) then
				return function() end
			elseif p1.isFullscreen == true and not isVideo then
				return function() end
			end
		end
		var4 += 1
		local var6 = tostring(var4)
		t[var6] = p1
		p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, var6)
		collectionService:AddTag(p0, constantsModule.CandidateTag)
		
		return function()
			-- upvalues: p0 (ref), constantsModule (copy), var6 (ref), collectionService (copy), t (copy)
			if p0:GetAttribute(constantsModule.ViewabilityTargetIdAttribute) == var6 then
				collectionService:RemoveTag(p0, constantsModule.CandidateTag)
				p0:SetAttribute(constantsModule.ViewabilityTargetIdAttribute, nil)
			end
			t[var6] = nil
		end
	end,
	get = function(p2)
		-- upvalues: t (ref)
		return t[p2]
	end,
	_clear = function()
		-- upvalues: t (ref)
		for i in t do
			t[i] = nil
		end
	end,
	_size = function()
		-- upvalues: t (ref)
		local var7 = 0
		
		for i in t do
			var7 += 1
		end
		return var7
	end
}