local DependenciesModule = require(script:FindFirstAncestor("SocialTabState").dependencies)
local Llama = DependenciesModule.llama
local RoduxUsers = DependenciesModule.RoduxUsers

local function _(p1)
	-- upvalues: RoduxUsers (copy)
	return RoduxUsers.Actions.UserUpdated({
		id = p1.id,
		username = p1.name,
		displayName = p1.displayName,
		hasVerifiedBadge = p1.hasVerifiedBadge
	})
end

return function(p1, p2)
	-- upvalues: Llama (copy), RoduxUsers (copy)
	return Llama.Dictionary.values((Llama.List.reduce(p1.responseBody, function(p3, p4)
		-- upvalues: Llama (upval), p2 (copy), RoduxUsers (upval)
		return Llama.List.reduce(p4.participants, function(p5, p6)
			-- upvalues: p2 (upval), Llama (upval), RoduxUsers (upval)
			local Text = tostring(p6.targetId)
			
			if p5[Text] or p2.byUserId[Text] then
				return p5
			else
				local JoinResult = Llama.Dictionary.join(p6, { id = Text })
				
				return Llama.Dictionary.join(p5, {
					[Text] = RoduxUsers.Actions.UserUpdated({
						id = JoinResult.id,
						username = JoinResult.name,
						displayName = JoinResult.displayName,
						hasVerifiedBadge = JoinResult.hasVerifiedBadge
					})
				})
			end
		end, p3)
	end, {})))
end