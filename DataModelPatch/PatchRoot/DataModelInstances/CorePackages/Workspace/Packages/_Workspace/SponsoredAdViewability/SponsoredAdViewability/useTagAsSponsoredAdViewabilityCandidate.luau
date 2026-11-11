local Parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.DiscoveryTypes)
local SponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)

return function(p1, p2)
	-- upvalues: ReactModule (copy), SponsoredAdViewabilityRegistryModule (copy)
	local EncryptedAdTrackingData = if p2 then p2.encryptedAdTrackingData else nil
	local TileType = if p2 then p2.tileType else nil
	ReactModule.useEffect(function()
		-- upvalues: EncryptedAdTrackingData (copy), TileType (copy), p1 (copy), SponsoredAdViewabilityRegistryModule (upval)
		if EncryptedAdTrackingData == nil or TileType == nil then return end
		local Current = p1.current
		
		if Current == nil then return end
		return SponsoredAdViewabilityRegistryModule.bind(Current, {
			encryptedAdTrackingData = EncryptedAdTrackingData,
			tileType = TileType
		})
	end, { EncryptedAdTrackingData, TileType, p1 })
end