local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PromiseModule = require(Modules.LuaApp.Promise)
local HttpErrorModule = require(Modules.LuaApp.Http.HttpError)
local HttpResponseModule = require(Modules.LuaApp.Http.HttpResponse)
local StatusCodes = require(game:GetService("CorePackages").Workspace.Packages.Http).StatusCodes

local function makeRequest(p1, HttpGetAsync, p2)
	-- upvalues: StatusCodes (copy), HttpResponseModule (copy)
	local CurrentTime = tick()
	local Success, Result = pcall(HttpGetAsync, unpack(p2))
	local ScaledCurrentTime = (tick() - CurrentTime) * 1000
	local OK = nil
	
	if Success then
		OK = StatusCodes.OK
	else
		OK = StatusCodes.UNKNOWN_ERROR
		local Match: string? = string.match(Result, ".*%((.*)%)")
		
		if Match then
			local FoundAt: number? = string.find(Match, "%d%d%d")
			
			if FoundAt then
				OK = tonumber((string.sub(Match, FoundAt, FoundAt + 2)))
				Result = string.sub(Match, FoundAt + 4)
			end
		end
	end
	return HttpResponseModule.new(p1, Result, ScaledCurrentTime, OK)
end

local function _(p1)
	-- upvalues: HttpErrorModule (copy), StatusCodes (copy)
	local Unknown = HttpErrorModule.Kind.Unknown
	local ResponseBody = p1.responseBody
	
	if p1.responseCode ~= StatusCodes.UNKNOWN_ERROR then
		local ResponseCode: number = p1.responseCode
		
		if ResponseCode >= 500 then
			Unknown = HttpErrorModule.Kind.RequireExternalRetry
		else
			Unknown = HttpErrorModule.Kind.RequestFailure
			ResponseBody = tostring(ResponseCode)
		end
	end
	return HttpErrorModule.new(p1.requestUrl, Unknown, ResponseBody)
end

return function(p1)
	-- upvalues: PromiseModule (copy), makeRequest (copy), StatusCodes (copy), HttpErrorModule (copy)
	if not p1 then
		p1 = game
	end
	return function(p2, Text: string, p3)
		-- upvalues: p1 (ref), PromiseModule (upval), makeRequest (upval), StatusCodes (upval), HttpErrorModule (upval)
		assert(type(p2) == "string", "Expected url to be a string")
		assert(type(Text) == "string", "Expected requestMethod to be a string")
		local Uppered = string.upper(Text)
		
		if p3 then
			assert(type(p3) == "table", "Expected extra args to be a table")
		end
		if Uppered == "POST" then
			assert(p3.postBody, "Expected a postBody to be specified with this request")
			
			if not p3.contentType then
				p3.contentType = "application/json"
			end
		end
		local HttpGetAsync = nil
		local List = nil
		
		if Uppered == "GET" then
			HttpGetAsync = p1.HttpGetAsync
			List = { p1, p2 }
		elseif Uppered == "POST" then
			HttpGetAsync = p1.HttpPostAsync
			List = { p1, p2, p3.postBody, p3.contentType }
		else
			error(string.format("Unsupported requestMethod : %s", Uppered or "nil"))
		end
		return (PromiseModule.new(function(Callback, Callback1)
			-- upvalues: makeRequest (upval), p2 (copy), HttpGetAsync (ref), List (ref), StatusCodes (upval), HttpErrorModule (upval)
			spawn(function()
				-- upvalues: makeRequest (upval), p2 (upval), HttpGetAsync (upval), List (upval), StatusCodes (upval), Callback (copy), HttpErrorModule (upval), Callback1 (copy)
				local Request = makeRequest(p2, HttpGetAsync, List)
				
				if Request.responseCode == StatusCodes.OK then
					Callback(Request)
					
					return
				end
				local Unknown = HttpErrorModule.Kind.Unknown
				local ResponseBody = Request.responseBody
				
				if Request.responseCode ~= StatusCodes.UNKNOWN_ERROR then
					local ResponseCode: number = Request.responseCode
					
					if ResponseCode >= 500 then
						Unknown = HttpErrorModule.Kind.RequireExternalRetry
					else
						Unknown = HttpErrorModule.Kind.RequestFailure
						ResponseBody = tostring(ResponseCode)
					end
				end
				Callback1((HttpErrorModule.new(Request.requestUrl, Unknown, ResponseBody)))
			end)
		end))
	end
end