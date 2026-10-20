local Parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DiscoveryTypes)
local SponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SponsoredAdViewabilityRegistryModule (copy)
	local EncryptedAdTrackingData = if p2 then p2.encryptedAdTrackingData else nil
	local TileType = if p2 then p2.tileType else nil
	local MediaType = if p2 then p2.mediaType else nil
	local VideoPlaybackStateRef = if p2 then p2.videoPlaybackStateRef else nil
	local VideoSource = if p2 then p2.videoSource else nil
	local IsFullscreen = if p2 then p2.isFullscreen else nil
	ReactModule.useEffect(function()
		-- upvalues: EncryptedAdTrackingData (copy), TileType (copy), MediaType (copy), p1 (copy), SponsoredAdViewabilityRegistryModule (upval), VideoPlaybackStateRef (copy), VideoSource (copy), IsFullscreen (copy)
		if EncryptedAdTrackingData == nil or TileType == nil or MediaType == nil then return end
		local Current = p1.current
		
		if Current == nil then return end
		return SponsoredAdViewabilityRegistryModule.bind(Current, {
			encryptedAdTrackingData = EncryptedAdTrackingData,
			tileType = TileType,
			mediaType = MediaType,
			videoPlaybackStateRef = VideoPlaybackStateRef,
			videoSource = VideoSource,
			isFullscreen = IsFullscreen
		})
	end, {
		EncryptedAdTrackingData, TileType, p1, MediaType, VideoPlaybackStateRef,
		VideoSource, IsFullscreen
	})
end