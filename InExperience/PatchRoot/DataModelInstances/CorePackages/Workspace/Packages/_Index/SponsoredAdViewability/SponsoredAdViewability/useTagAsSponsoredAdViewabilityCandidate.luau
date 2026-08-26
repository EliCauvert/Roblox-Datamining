local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local _ = require(parent.DiscoveryTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(value, p1)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), reactModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	local var1 = if p1 then p1.encryptedAdTrackingData else nil
	local var2 = if p1 then p1.tileType else nil
	local var3 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 then p1.mediaType else nil
	local var4 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 then p1.videoPlaybackStateRef else nil
	local var5 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 then p1.videoSource else nil
	local var6 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1 then p1.isFullscreen else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var2 (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), var3 (ref), value (ref), sponsoredAdViewabilityRegistryModule (copy), var4 (ref), var5 (ref), var6 (ref)
		if var1 == nil or var2 == nil or fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var3 == nil then return end
		local current = value.current
		
		if current == nil then return end
		return if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then sponsoredAdViewabilityRegistryModule.bind(current, {
			encryptedAdTrackingData = var1,
			tileType = var2,
			mediaType = var3,
			videoPlaybackStateRef = var4,
			videoSource = var5,
			isFullscreen = var6
		}) else sponsoredAdViewabilityRegistryModule.bind(current, { encryptedAdTrackingData = var1, tileType = var2 })
	end, {
		var1, var2, value,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var3 else nil,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var4 else nil,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var5 else nil,
		if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then var6 else nil
	})
end