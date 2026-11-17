local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local ReactModule = require(Parent.React)
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local FStringTrustedFriendCandidatesSectionIxpLayerModule = require(FriendsLanding.Flags.FStringTrustedFriendCandidatesSectionIxpLayer)

return function(p1)
	-- upvalues: ReactModule (copy), IXPServiceWrapper (copy), FStringTrustedFriendCandidatesSectionIxpLayerModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), IXPServiceWrapper (upval), FStringTrustedFriendCandidatesSectionIxpLayerModule (upval)
		if p1 then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringTrustedFriendCandidatesSectionIxpLayerModule)
		end
	end, { p1 })
end