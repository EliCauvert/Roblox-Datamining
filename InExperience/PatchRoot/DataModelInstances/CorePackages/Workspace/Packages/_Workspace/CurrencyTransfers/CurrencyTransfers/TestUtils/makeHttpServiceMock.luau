local HttpService = game:GetService("HttpService")

return function(StatusCode, p1) --[[ Line: 3 | Named "makeHttpServiceMock" ]]
	-- upvalues: HttpService (copy)
	return {
		lastRequestParams = nil,
		lastEncodedBody = nil,
		RequestInternal = function(p2, LastRequestParams) --[[ Line: 9 ]]
			-- upvalues: HttpService (upval), p1 (copy), StatusCode (copy)
			p2.lastRequestParams = LastRequestParams
			
			return {
				Start = function(_, Callback) --[[ Line: 12 ]]
					-- upvalues: HttpService (upval), p1 (upval), StatusCode (upval)
					task.defer(function() --[[ Line: 13 ]]
						-- upvalues: HttpService (upval), p1 (upval), StatusCode (upval), Callback (copy)
						Callback(true, {
							Body = HttpService:JSONEncode(p1 or {}),
							StatusCode = StatusCode
						})
					end)
				end
			}
		end,
		JSONEncode = function(p2, LastEncodedBody) --[[ Line: 24 ]]
			-- upvalues: HttpService (upval)
			p2.lastEncodedBody = LastEncodedBody
			
			return HttpService:JSONEncode(LastEncodedBody)
		end,
		JSONDecode = function(_, Input) --[[ Line: 29 ]]
			-- upvalues: HttpService (upval)
			return HttpService:JSONDecode(Input)
		end
	}
end