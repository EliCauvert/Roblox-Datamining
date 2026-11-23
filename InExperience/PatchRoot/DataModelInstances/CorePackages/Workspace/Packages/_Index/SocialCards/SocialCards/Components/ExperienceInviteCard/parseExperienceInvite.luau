local _ = require(script.Parent.InviteTypes)
local ToIdModule = require(script.Parent.toId)
local ToNonEmptyStringModule = require(script.Parent.toNonEmptyString)

return function(p1)
	-- upvalues: ToIdModule (copy), ToNonEmptyStringModule (copy)
	local IdModule = ToIdModule(p1.universe_id)
	local IdModule1 = ToIdModule(p1.inviter_user_id)
	
	return if IdModule == nil or IdModule1 == nil then nil else {
		universeId = IdModule,
		actorId = IdModule1,
		shareLinkId = ToNonEmptyStringModule(p1.share_link_id)
	}
end