local dispatchBindableEventModule = require(script:FindFirstAncestor("ExpChat").DispatchBindableEvent)

return {
	queue = {},
	add = function(p0, p1)
		p0.queue[#p0.queue + 1] = p1
	end,
	flush = function(p2)
		-- upvalues: dispatchBindableEventModule (ref)
		if #p2.queue then
			for i, v in pairs(p2.queue) do
				dispatchBindableEventModule:Fire(v)
			end
		end
	end
}