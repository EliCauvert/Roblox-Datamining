local parent = script.Parent.Parent
local actions = parent.Actions
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local roduxModule = require(parent_1.Rodux)
local setShareInviteLinkModule = require(actions.SetShareInviteLink)
local clearShareInviteLinkModule = require(actions.ClearShareInviteLink)
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), cryoModule (ref), setShareInviteLinkModule (ref), clearShareInviteLinkModule (ref)
	return roduxModule.createReducer(t, {
		[p0.shareLinksNetworking.GenerateLink.Succeeded.name] = function(p1, p2)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p1, { ShareInviteLink = p2.responseBody })
		end,
		[setShareInviteLinkModule.name] = function(p3, p4)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p3, { ShareInviteLink = p4.shareInviteLink })
		end,
		[clearShareInviteLinkModule.name] = function(p5, _)
			-- upvalues: cryoModule (copy)
			return cryoModule.Dictionary.join(p5, { ShareInviteLink = cryoModule.None })
		end
	})
end