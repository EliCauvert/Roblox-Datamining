local EnumsModule = require(script:FindFirstAncestor("ProfilePlatform").Common.Enums)

return function(p1, p2): boolean
	-- upvalues: EnumsModule (copy)
	local Components = p1.components
	
	if Components == nil then
		return false
	else
		local Component = Components[EnumsModule.Components.CommunityProfileHeader]
		local OwnerUserId = if type(Component) == "table" then Component.ownerUserId else nil
		
		return type(OwnerUserId) == "number" and tostring(OwnerUserId) == p2 and (Components[EnumsModule.Components.CommunityLocked] == nil and Components[EnumsModule.Components.CommunityDeactivated] == nil)
	end
end