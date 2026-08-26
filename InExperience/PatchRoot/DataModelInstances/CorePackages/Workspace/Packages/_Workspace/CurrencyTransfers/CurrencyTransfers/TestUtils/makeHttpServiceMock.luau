local httpService = game:GetService("HttpService")

return function(p1, p2)
	-- upvalues: httpService (ref)
	return {
		lastRequestParams = nil,
		lastEncodedBody = nil,
		RequestInternal = function(p3, p4)
			-- upvalues: httpService (copy), p2 (ref), p1 (ref)
			p3.lastRequestParams = p4
			
			return {
				Start = function(_, p5)
					-- upvalues: httpService (copy), p2 (copy), p1 (copy)
					task.defer(function()
						-- upvalues: httpService (copy), p2 (copy), p1 (copy), p5 (ref)
						p5(true, { Body = httpService:JSONEncode(p2 or {}), StatusCode = p1 })
					end)
				end
			}
		end,
		JSONEncode = function(p3, p4)
			-- upvalues: httpService (copy)
			p3.lastEncodedBody = p4
			
			return httpService:JSONEncode(p4)
		end,
		JSONDecode = function(_, p3)
			-- upvalues: httpService (copy)
			return httpService:JSONDecode(p3)
		end
	}
end