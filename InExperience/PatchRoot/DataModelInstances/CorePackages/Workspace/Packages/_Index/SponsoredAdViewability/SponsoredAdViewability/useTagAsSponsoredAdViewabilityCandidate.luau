local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local _ = require(parent.DiscoveryTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(value, p0) --[[ line: 18 | named "useTagAsSponsoredAdViewabilityCandidate" ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), reactModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	local var3 = if p0 then p0.encryptedAdTrackingData else nil
	local var4 = if p0 then p0.tileType else nil
	local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p0 then p0.mediaType else nil
	local var6 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p0 then p0.videoPlaybackStateRef else nil
	local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p0 then p0.videoSource else nil
	reactModule.useEffect(function() --[[ line: 30 ]]
		-- upvalues: var3 (ref), var4 (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), var5 (ref), value (ref), sponsoredAdViewabilityRegistryModule (copy), var6 (ref), var7 (ref)
		if var3 == nil or var4 == nil or fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var5 == nil then return end
		local current = value.current
		
		if current == nil then return end
		return if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then sponsoredAdViewabilityRegistryModule.bind(current, {
			encryptedAdTrackingData = var3,
			tileType = var4,
			mediaType = var5,
			videoPlaybackStateRef = var6,
			videoSource = var7
		}) else sponsoredAdViewabilityRegistryModule.bind(current, { encryptedAdTrackingData = var3, tileType = var4 })
	end, {
		var3, var4, value,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var5 else nil,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var6 else nil,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var7 else nil
	})
end