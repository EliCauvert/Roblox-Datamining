local CommunityVisibilityModule = require(script.Parent.Parent.Enums.CommunityVisibility)
local CommunityInfoModule = {
	new = function()
		-- upvalues: CommunityVisibilityModule (copy)
		return {
			communityId = "",
			name = "",
			description = "",
			visibility = CommunityVisibilityModule.Private
		}
	end
}

function CommunityInfoModule.mock(p1)
	-- upvalues: CommunityInfoModule (copy), CommunityVisibilityModule (copy)
	local P0 = p1 or {}
	local NewCommunityInfo = CommunityInfoModule.new()
	NewCommunityInfo.communityId = P0.communityId or "abcd" .. tostring(math.random(1000, 9999))
	NewCommunityInfo.name = P0.name or "my community"
	NewCommunityInfo.description = P0.description or "description of the community"
	NewCommunityInfo.visibility = P0.visibility or CommunityVisibilityModule.Public
	
	return NewCommunityInfo
end

function CommunityInfoModule.fromJsonData(p1)
	-- upvalues: CommunityInfoModule (copy)
	local NewCommunityInfo = CommunityInfoModule.new()
	NewCommunityInfo.communityId = p1.communityId
	NewCommunityInfo.name = p1.name
	NewCommunityInfo.description = p1.description
	NewCommunityInfo.visibility = p1.visibility
	
	return NewCommunityInfo
end

return CommunityInfoModule