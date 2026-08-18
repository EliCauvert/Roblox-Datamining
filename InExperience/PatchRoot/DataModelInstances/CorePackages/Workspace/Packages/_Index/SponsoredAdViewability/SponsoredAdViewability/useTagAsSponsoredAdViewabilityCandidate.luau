local parent = script:FindFirstAncestor("SponsoredAdViewability").Parent
local reactModule = require(parent.React)
local _ = require(parent.DiscoveryTypes)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)

return function(value, p0) --[[ line: 13 | named "useTagAsSponsoredAdViewabilityCandidate" ]]
	-- upvalues: reactModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	local var2 = if p0 then p0.encryptedAdTrackingData else nil
	local var3 = if p0 then p0.tileType else nil
	reactModule.useEffect(function() --[[ line: 17 ]]
		-- upvalues: var2 (ref), var3 (ref), value (ref), sponsoredAdViewabilityRegistryModule (copy)
		if var2 == nil or var3 == nil then return end
		local current = value.current
		
		if current == nil then
			return
		end
		return sponsoredAdViewabilityRegistryModule.bind(current, { encryptedAdTrackingData = var2, tileType = var3 })
	end, { var2, var3, value })
end