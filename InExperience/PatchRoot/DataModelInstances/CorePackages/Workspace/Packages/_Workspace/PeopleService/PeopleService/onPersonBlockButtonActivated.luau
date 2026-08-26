local promiseModule = require(script:FindFirstAncestor("PeopleService").Parent.Promise)

return function(p1, p2, p3, p4, _, p5)
	-- upvalues: promiseModule (ref)
	p2:trackBlockUserButtonClick(p1.UserId, p3, p4)
	local var1 = nil
	
	return {
		useToastFlow = true,
		modalProps = {
			player = p1,
			closeModal = function() end,
			analytics = {
				action = function(_, _, p6, _)
					-- upvalues: p2 (ref), p1 (ref), p3 (ref), p4 (ref)
					if p6 == "blockUser" then
						p2:trackBlockUser(p1.UserId, p3, p4)
						
						return
					elseif p6 == "unblockUser" then
						p2:trackUnblockUser(p1.UserId, p3, p4)
						
						return
					elseif p6 == "blockUserButtonClick" then
						p2:trackBlockUserButtonClick(p1.UserId, p3, p4)
					end
				end
			},
			source = p4,
			onBlockingSuccess = if p5 then p5.onBlockingSuccess else nil
		},
		promise = promiseModule.new(function(p6)
			-- upvalues: var1 (write)
			var1 = p6
		end),
		resolvePromise = var1
	}
end