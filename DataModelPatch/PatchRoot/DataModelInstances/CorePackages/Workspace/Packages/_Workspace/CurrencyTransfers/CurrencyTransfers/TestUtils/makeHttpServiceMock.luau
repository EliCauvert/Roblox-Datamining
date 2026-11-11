local HttpService = game:GetService("HttpService")

return function(StatusCode, p1)
	-- upvalues: HttpService (copy)
	return {
		lastRequestParams = nil,
		lastEncodedBody = nil,
		RequestInternal = function(p2, LastRequestParams)
			-- upvalues: HttpService (upval), p1 (copy), StatusCode (copy)
			p2.lastRequestParams = LastRequestParams
			
			return {
				Start = function(_, Callback)
					-- upvalues: HttpService (upval), p1 (upval), StatusCode (upval)
					task.defer(function()
						-- upvalues: HttpService (upval), p1 (upval), StatusCode (upval), Callback (copy)
						Callback(true, {
							Body = HttpService:JSONEncode(p1 or {}),
							StatusCode = StatusCode
						})
					end)
				end
			}
		end,
		JSONEncode = function(p2, LastEncodedBody)
			-- upvalues: HttpService (upval)
			p2.lastEncodedBody = LastEncodedBody
			
			return HttpService:JSONEncode(LastEncodedBody)
		end,
		JSONDecode = function(_, Input)
			-- upvalues: HttpService (upval)
			return HttpService:JSONDecode(Input)
		end
	}
end