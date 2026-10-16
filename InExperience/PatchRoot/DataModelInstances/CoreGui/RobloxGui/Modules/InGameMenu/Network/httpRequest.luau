local HttpService = game:GetService("HttpService")
local PromiseModule = require(script.Parent.Parent.Utility.Promise)
local Extreme = Enum.ThrottlingPriority.Extreme
local ApplicationJson = Enum.HttpContentType.ApplicationJson

return function(HttpRbxApiService) --[[ Line: 9 ]]
	-- upvalues: ApplicationJson (copy), Extreme (copy), PromiseModule (copy), HttpService (copy)
	local function _(p1, p2) --[[ Line: 11 | Named "doHttpPost" ]]
		-- upvalues: ApplicationJson (upval), Extreme (upval), HttpRbxApiService (copy)
		assert(p2.postBody, "Expected a postBody to be specified with this request")
		assert(type(p2.postBody) == "string", "Expected postBody to be a string")
		
		if not p2.contentType then
			p2.contentType = ApplicationJson
		end
		if not p2.throttlingPriority then
			p2.throttlingPriority = Extreme
		end
		return function() --[[ Line: 23 ]]
			-- upvalues: HttpRbxApiService (upval), p1 (copy), p2 (copy)
			return HttpRbxApiService:PostAsyncFullUrl(p1, p2.postBody, p2.throttlingPriority, p2.contentType)
		end
	end
	
	local _ = function(p1) --[[ Line: 33 | Named "doHttpGet" ]]
		-- upvalues: HttpRbxApiService (copy), Extreme (upval)
		return function() --[[ Line: 34 ]]
			-- upvalues: HttpRbxApiService (upval), p1 (copy), Extreme (upval)
			return HttpRbxApiService:GetAsyncFullUrl(p1, Extreme)
		end
	end
	
	return function(ApiUrl, Text: string, p1) --[[ Line: 47 ]]
		-- upvalues: ApplicationJson (upval), Extreme (upval), HttpRbxApiService (copy), PromiseModule (upval), HttpService (upval)
		assert(type(ApiUrl) == "string", "Expected url to be a string")
		assert(type(Text) == "string", "Expected requestMethod to be a string")
		assert(not p1 or type(p1) == "table", "Expected options to be a table")
		local Uppered = string.upper(Text)
		local v1: (() -> any)? = nil
		
		if Uppered == "POST" then
			assert(p1.postBody, "Expected a postBody to be specified with this request")
			assert(type(p1.postBody) == "string", "Expected postBody to be a string")
			
			if not p1.contentType then
				p1.contentType = ApplicationJson
			end
			if not p1.throttlingPriority then
				p1.throttlingPriority = Extreme
			end
			v1 = function() --[[ Line: 23 ]]
				-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), p1 (copy)
				return HttpRbxApiService:PostAsyncFullUrl(ApiUrl, p1.postBody, p1.throttlingPriority, p1.contentType)
			end
		elseif Uppered == "GET" then
			v1 = function() --[[ Line: 34 ]]
				-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), Extreme (upval)
				return HttpRbxApiService:GetAsyncFullUrl(ApiUrl, Extreme)
			end
		else
			error(string.format("Unsupported requestMethod : %s", Uppered or "nil"))
		end
		return PromiseModule.new(function(Callback1, Callback: () -> ()) --[[ Line: 62 ]]
			-- upvalues: v1 (ref), HttpService (upval)
			if v1 then
				coroutine.wrap(function() --[[ Line: 64 ]]
					-- upvalues: v1 (upval), HttpService (upval), Callback1 (copy), Callback (copy)
					local Success, Result = pcall(v1)
					
					if not Success then
						Callback(Result)
						
						return
					end
					local Success1, Result1 = pcall(function() --[[ Line: 68 ]]
						-- upvalues: HttpService (upval), Result (copy)
						return HttpService:JSONDecode(Result)
					end)
					
					if Success1 then
						Callback1({ responseBody = Result1 })
						
						return
					else
						Callback(Result1)
					end
				end)()
				
				return
			else
				Callback()
			end
		end)
	end
end