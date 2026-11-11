local PromiseModule = require(script:FindFirstAncestor("PeopleService").Parent.Promise)

return function(Player: Player, p1, p2, Source, _, p3)
	-- upvalues: PromiseModule (copy)
	p1:trackBlockUserButtonClick(Player.UserId, p2, Source)
	local ResolvePromise = nil
	
	return {
		useToastFlow = true,
		modalProps = {
			player = Player,
			closeModal = function() end,
			analytics = {
				action = function(_, _, p4, _)
					-- upvalues: p1 (copy), Player (copy), p2 (copy), Source (copy)
					if p4 == "blockUser" then
						p1:trackBlockUser(Player.UserId, p2, Source)
						
						return
					end
					if p4 == "unblockUser" then
						p1:trackUnblockUser(Player.UserId, p2, Source)
						
						return
					end
					if p4 == "blockUserButtonClick" then
						p1:trackBlockUserButtonClick(Player.UserId, p2, Source)
					end
				end
			},
			source = Source,
			onBlockingSuccess = p3 and p3.onBlockingSuccess or nil
		},
		promise = PromiseModule.new(function(p4)
			-- upvalues: ResolvePromise (ref)
			ResolvePromise = p4
		end),
		resolvePromise = ResolvePromise
	}
end