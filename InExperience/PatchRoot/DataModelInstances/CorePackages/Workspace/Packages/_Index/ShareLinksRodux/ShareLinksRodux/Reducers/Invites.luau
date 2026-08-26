local parent = script.Parent.Parent
local actions = parent.Actions
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
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