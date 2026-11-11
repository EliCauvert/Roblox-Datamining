local CryoModule = require(script:FindFirstAncestor("HttpRequest").Parent.Cryo)

return function(Url, Method, p1)
	-- upvalues: CryoModule (copy)
	return {
		Start = function(_, Callback: (any, any) -> ())
			-- upvalues: p1 (copy), CryoModule (upval), Url (copy), Method (copy)
			Callback(p1.success, (CryoModule.Dictionary.join({ Url = Url, Method = Method }, if type(p1.mockResponse) == "function" then p1.mockResponse() elseif p1.mockResponse then p1.mockResponse else {})))
		end,
		Cancel = function()
			-- upvalues: p1 (copy)
			if p1.cancel then
				p1.cancel()
			end
		end
	}
end