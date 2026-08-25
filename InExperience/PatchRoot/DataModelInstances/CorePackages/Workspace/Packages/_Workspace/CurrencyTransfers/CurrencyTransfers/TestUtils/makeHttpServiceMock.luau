local httpService = game:GetService("HttpService")

return function(p0, p1)
	-- upvalues: httpService (ref)
	return {
		lastRequestParams = nil,
		lastEncodedBody = nil,
		RequestInternal = function(p2, p3)
			-- upvalues: httpService (copy), p1 (ref), p0 (ref)
			p2.lastRequestParams = p3
			
			return {
				Start = function(_, p4)
					-- upvalues: httpService (copy), p1 (copy), p0 (copy)
					task.defer(function()
						-- upvalues: httpService (copy), p1 (copy), p0 (copy), p4 (ref)
						p4(true, { Body = httpService:JSONEncode(p1 or {}), StatusCode = p0 })
					end)
				end
			}
		end,
		JSONEncode = function(p5, p6)
			-- upvalues: httpService (copy)
			p5.lastEncodedBody = p6
			
			return httpService:JSONEncode(p6)
		end,
		JSONDecode = function(_, p7)
			-- upvalues: httpService (copy)
			return httpService:JSONDecode(p7)
		end
	}
end