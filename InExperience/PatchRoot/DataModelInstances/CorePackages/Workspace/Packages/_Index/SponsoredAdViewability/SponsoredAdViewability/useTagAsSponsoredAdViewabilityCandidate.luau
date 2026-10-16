local Parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DiscoveryTypes)
local SponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local FFlagLuaAppSponsoredAdVideoViewabilityEnabled = require(Parent.SharedFlags).FFlagLuaAppSponsoredAdVideoViewabilityEnabled

return function(p1, p2) --[[ Line: 18 | Named "useTagAsSponsoredAdViewabilityCandidate" ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), ReactModule (copy), SponsoredAdViewabilityRegistryModule (copy)
	local EncryptedAdTrackingData = if p2 then p2.encryptedAdTrackingData else nil
	local TileType = if p2 then p2.tileType else nil
	local MediaType = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 then p2.mediaType else nil
	local VideoPlaybackStateRef = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 then p2.videoPlaybackStateRef else nil
	local VideoSource = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 then p2.videoSource else nil
	local IsFullscreen = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and p2 then p2.isFullscreen else nil
	ReactModule.useEffect(function() --[[ Line: 33 ]]
		-- upvalues: EncryptedAdTrackingData (copy), TileType (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (upval), MediaType (copy), p1 (copy), SponsoredAdViewabilityRegistryModule (upval), VideoPlaybackStateRef (copy), VideoSource (copy), IsFullscreen (copy)
		if EncryptedAdTrackingData == nil or TileType == nil or FFlagLuaAppSponsoredAdVideoViewabilityEnabled and MediaType == nil then return end
		local Current = p1.current
		
		if Current == nil then return end
		return if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then SponsoredAdViewabilityRegistryModule.bind(Current, {
			encryptedAdTrackingData = EncryptedAdTrackingData,
			tileType = TileType,
			mediaType = MediaType,
			videoPlaybackStateRef = VideoPlaybackStateRef,
			videoSource = VideoSource,
			isFullscreen = IsFullscreen
		}) else SponsoredAdViewabilityRegistryModule.bind(Current, {
			encryptedAdTrackingData = EncryptedAdTrackingData,
			tileType = TileType
		})
	end, {
		EncryptedAdTrackingData, TileType, p1,
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then MediaType else nil,
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then VideoPlaybackStateRef else nil,
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then VideoSource else nil,
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then IsFullscreen else nil
	})
end