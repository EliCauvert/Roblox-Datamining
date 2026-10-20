local Parent = script.Parent.Parent
local Actions = Parent.Actions
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local RoduxModule = require(Parent1.Rodux)
local SetShareInviteLinkModule = require(Actions.SetShareInviteLink)
local ClearShareInviteLinkModule = require(Actions.ClearShareInviteLink)
local t = {}

return function(p1)
	-- upvalues: RoduxModule (copy), t (copy), CryoModule (copy), SetShareInviteLinkModule (copy), ClearShareInviteLinkModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.shareLinksNetworking.GenerateLink.Succeeded.name] = function(p2, p3)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = p3.responseBody })
		end,
		[SetShareInviteLinkModule.name] = function(p2, p3)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = p3.shareInviteLink })
		end,
		[ClearShareInviteLinkModule.name] = function(p2, _)
			-- upvalues: CryoModule (upval)
			return CryoModule.Dictionary.join(p2, { ShareInviteLink = CryoModule.None })
		end
	})
end