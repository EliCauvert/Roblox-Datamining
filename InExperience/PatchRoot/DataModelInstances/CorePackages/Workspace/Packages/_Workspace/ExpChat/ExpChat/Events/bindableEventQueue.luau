local dispatchBindableEventModule = require(script:FindFirstAncestor("ExpChat").DispatchBindableEvent)

return {
	queue = {},
	add = function(p1, p2)
		p1.queue[#p1.queue + 1] = p2
	end,
	flush = function(p1)
		-- upvalues: dispatchBindableEventModule (ref)
		if #p1.queue then
			for i, v in pairs(p1.queue) do
				dispatchBindableEventModule:Fire(v)
			end
		end
	end
}