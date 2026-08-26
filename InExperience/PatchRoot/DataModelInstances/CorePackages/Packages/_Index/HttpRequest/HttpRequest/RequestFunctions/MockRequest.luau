local cryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)

return function(p1, p2, p3)
	-- upvalues: cryoModule (ref)
	return {
		Start = function(_, p4)
			-- upvalues: p3 (ref), cryoModule (copy), p1 (ref), p2 (ref)
			local t = {}
			
			if type(p3.mockResponse) == "function" then
				t = p3.mockResponse()
			elseif p3.mockResponse then
				t = p3.mockResponse
			end
			p4(p3.success, cryoModule.Dictionary.join({ Url = p1, Method = p2 }, t))
		end,
		Cancel = function()
			-- upvalues: p3 (ref)
			if p3.cancel then
				p3.cancel()
			end
		end
	}
end