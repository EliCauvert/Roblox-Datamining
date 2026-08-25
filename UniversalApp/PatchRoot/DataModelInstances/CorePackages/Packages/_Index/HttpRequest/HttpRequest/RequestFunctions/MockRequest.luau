local cryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)

return function(p0, p1, p2)
	-- upvalues: cryoModule (ref)
	return {
		Start = function(_, p3)
			-- upvalues: p2 (ref), cryoModule (copy), p0 (ref), p1 (ref)
			local t = {}
			
			if type(p2.mockResponse) == "function" then
				t = p2.mockResponse()
			elseif p2.mockResponse then
				t = p2.mockResponse
			end
			p3(p2.success, cryoModule.Dictionary.join({ Url = p0, Method = p1 }, t))
		end,
		Cancel = function()
			-- upvalues: p2 (ref)
			if p2.cancel then
				p2.cancel()
			end
		end
	}
end