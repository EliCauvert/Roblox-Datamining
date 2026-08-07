local roduxShareLinks = script:FindFirstAncestor("RoduxShareLinks")
local parent = roduxShareLinks.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local actions = roduxShareLinks.Actions
local setShareInviteLinkModule = require(actions.SetShareInviteLink)
local clearShareInviteLinkModule = require(actions.ClearShareInviteLink)
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: roduxModule (ref), t (ref), cryoModule (ref), setShareInviteLinkModule (ref), clearShareInviteLinkModule (ref)
	return roduxModule.createReducer(t, {
		[p0.shareLinksNetworking.GenerateLink.Succeeded.name] = function(p1, p2) --[[ line: 17 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p1, { ShareInviteLink = p2.responseBody })
		end,
		[setShareInviteLinkModule.name] = function(p3, p4) --[[ line: 21 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p3, { ShareInviteLink = p4.shareInviteLink })
		end,
		[clearShareInviteLinkModule.name] = function(p5, _) --[[ line: 25 ]]
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p5, { ShareInviteLink = cryoModule.None })
		end
	})
end