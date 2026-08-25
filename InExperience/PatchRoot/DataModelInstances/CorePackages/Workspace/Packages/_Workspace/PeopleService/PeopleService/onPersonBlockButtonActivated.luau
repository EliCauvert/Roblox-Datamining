local promiseModule = require(script:FindFirstAncestor("PeopleService").Parent.Promise)

return function(p0, p1, p2, p3, _, p4)
	-- upvalues: promiseModule (ref)
	p1:trackBlockUserButtonClick(p0.UserId, p2, p3)
	local var1 = nil
	
	return {
		useToastFlow = true,
		modalProps = {
			player = p0,
			closeModal = function() end,
			analytics = {
				action = function(_, _, p5, _)
					-- upvalues: p1 (ref), p0 (ref), p2 (ref), p3 (ref)
					if p5 == "blockUser" then
						p1:trackBlockUser(p0.UserId, p2, p3)
						
						return
					elseif p5 == "unblockUser" then
						p1:trackUnblockUser(p0.UserId, p2, p3)
						
						return
					elseif p5 == "blockUserButtonClick" then
						p1:trackBlockUserButtonClick(p0.UserId, p2, p3)
					end
				end
			},
			source = p3,
			onBlockingSuccess = if p4 then p4.onBlockingSuccess else nil
		},
		promise = promiseModule.new(function(p6)
			-- upvalues: var1 (write)
			var1 = p6
		end),
		resolvePromise = var1
	}
end