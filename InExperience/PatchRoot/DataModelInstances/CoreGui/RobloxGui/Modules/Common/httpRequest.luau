local HttpService = game:GetService("HttpService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local Extreme = Enum.ThrottlingPriority.Extreme
local ApplicationJson = Enum.HttpContentType.ApplicationJson

return function(HttpRbxApiService) --[[ Line: 10 ]]
	-- upvalues: HttpService (copy), ApplicationJson (copy), Extreme (copy), PromiseModule (copy)
	local function doHttpPost(ApiUrl, p1) --[[ Line: 12 ]]
		-- upvalues: HttpService (upval), ApplicationJson (upval), Extreme (upval), HttpRbxApiService (copy)
		local Json = nil
		assert(p1.postBody, "Expected a postBody to be specified with this request")
		
		if type(p1.postBody) == "table" then
			Json = HttpService:JSONEncode(p1.postBody)
		elseif type(p1.postBody) == "string" then
			Json = p1.postBody
		else
			error("Expected postBody to be a string or table")
		end
		if not p1.contentType then
			p1.contentType = ApplicationJson
		end
		if not p1.throttlingPriority then
			p1.throttlingPriority = Extreme
		end
		return function() --[[ Line: 31 ]]
			-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), Json (ref), p1 (copy)
			return HttpRbxApiService:PostAsyncFullUrl(ApiUrl, Json, p1.throttlingPriority, p1.contentType)
		end
	end
	
	local function _(p1) --[[ Line: 41 | Named "doHttpGet" ]]
		-- upvalues: HttpRbxApiService (copy), Extreme (upval)
		return function() --[[ Line: 42 ]]
			-- upvalues: HttpRbxApiService (upval), p1 (copy), Extreme (upval)
			return HttpRbxApiService:GetAsyncFullUrl(p1, Extreme)
		end
	end
	
	return function(ApiUrl, Text: string, p1) --[[ Line: 55 ]]
		-- upvalues: doHttpPost (copy), HttpRbxApiService (copy), Extreme (upval), PromiseModule (upval), HttpService (upval)
		assert(type(ApiUrl) == "string", "Expected url to be a string")
		assert(type(Text) == "string", "Expected requestMethod to be a string")
		assert(not p1 or type(p1) == "table", "Expected options to be a table")
		local Uppered = string.upper(Text)
		local v1: (() -> any)? = nil
		
		if Uppered == "POST" then
			v1 = doHttpPost(ApiUrl, p1)
		elseif Uppered == "GET" then
			v1 = function() --[[ Line: 42 ]]
				-- upvalues: HttpRbxApiService (upval), ApiUrl (copy), Extreme (upval)
				return HttpRbxApiService:GetAsyncFullUrl(ApiUrl, Extreme)
			end
		else
			error(string.format("Unsupported requestMethod : %s", Uppered or "nil"))
		end
		return PromiseModule.new(function(Callback1, Callback: () -> ()) --[[ Line: 70 ]]
			-- upvalues: v1 (ref), HttpService (upval)
			if v1 then
				spawn(function() --[[ Line: 72 ]]
					-- upvalues: v1 (upval), HttpService (upval), Callback1 (copy), Callback (copy)
					local Success, Result = pcall(v1)
					
					if not Success then
						Callback(Result)
						
						return
					end
					local Success1, Result1 = pcall(function() --[[ Line: 76 ]]
						-- upvalues: HttpService (upval), Result (copy)
						return HttpService:JSONDecode(Result)
					end)
					
					if Success1 then
						Callback1({ responseBody = Result1 })
						
						return
					else
						Callback(Result1)
					end
				end)
				
				return
			else
				Callback()
			end
		end)
	end
end