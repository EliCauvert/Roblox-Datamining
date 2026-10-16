local RoduxShareLinks = script:FindFirstAncestor("RoduxShareLinks")
local Parent = RoduxShareLinks.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local Actions = RoduxShareLinks.Actions
local SetShareInviteLinkModule = require(Actions.SetShareInviteLink)
local ClearShareInviteLinkModule = require(Actions.ClearShareInviteLink)
local t = {}

return function(p1) --[[ Line: 13 ]]
	-- upvalues: RoduxModule (copy), t (copy), CryoModule (copy), SetShareInviteLinkModule (copy), ClearShareInviteLinkModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.shareLinksNetworking.GenerateLink.Succeeded.name] = function(p2, p3) --[[ Line: 17 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = p3.responseBody })
		end,
		[SetShareInviteLinkModule.name] = function(p2, p3) --[[ Line: 21 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = p3.shareInviteLink })
		end,
		[ClearShareInviteLinkModule.name] = function(p2, _) --[[ Line: 25 ]]
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = CryoModule.None })
		end
	})
end