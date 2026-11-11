local DispatchBindableEventModule = require(script:FindFirstAncestor("ExpChat").DispatchBindableEvent)

return {
	queue = {},
	add = function(p1, p2)
		p1.queue[#p1.queue + 1] = p2
	end,
	flush = function(p1)
		-- upvalues: DispatchBindableEventModule (copy)
		if #p1.queue then
			for _, value in pairs(p1.queue) do
				DispatchBindableEventModule:Fire(value)
			end
		end
	end
}