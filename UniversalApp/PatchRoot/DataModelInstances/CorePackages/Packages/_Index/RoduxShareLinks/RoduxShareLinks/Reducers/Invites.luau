local roduxShareLinks = script:FindFirstAncestor("RoduxShareLinks")
local parent = roduxShareLinks.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local actions = roduxShareLinks.Actions
local setShareInviteLinkModule = require(actions.SetShareInviteLink)
local clearShareInviteLinkModule = require(actions.ClearShareInviteLink)
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), cryoModule (ref), setShareInviteLinkModule (ref), clearShareInviteLinkModule (ref)
	return roduxModule.createReducer(t, {
		[p1.shareLinksNetworking.GenerateLink.Succeeded.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { ShareInviteLink = p3.responseBody })
		end,
		[setShareInviteLinkModule.name] = function(p2, p3)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { ShareInviteLink = p3.shareInviteLink })
		end,
		[clearShareInviteLinkModule.name] = function(p2, _)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p2, { ShareInviteLink = cryoModule.None })
		end
	})
end