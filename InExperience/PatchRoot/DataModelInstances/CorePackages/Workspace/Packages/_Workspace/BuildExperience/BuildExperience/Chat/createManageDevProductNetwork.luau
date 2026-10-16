local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.HttpClient)
local CreatorApiHttpModule = require(Parent.DataHydration.CreatorApiHttp)
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local FFlagBuildExperienceManageDevProductModule = require(BuildExperience.Flags.FFlagBuildExperienceManageDevProduct) or FFlagBuildExperienceMonetizationNativeUIModule

local function getHeader(Headers, Text: string) --[[ Line: 21 ]]
	if Headers == nil then
		return nil
	end
	for i, header in Headers do
		if string.lower(i) == string.lower(Text) then
			return header
		end
	end
	return nil
end

local function _(p1) --[[ Line: 33 | Named "getCsrfToken" ]]
	-- upvalues: getHeader (copy)
	return (getHeader(p1.headers, "x-csrf-token"))
end

local _ = function(Text: string): string --[[ Line: 37 | Named "withoutQuery" ]]
	return string.match(Text, "^[^?]+") or Text
end

local _ = function(p1) --[[ Line: 41 | Named "getRequestId" ]]
	-- upvalues: getHeader (copy)
	return getHeader(p1.headers, "x-request-id") or getHeader(p1.headers, "x-correlation-id")
end

local _ = function(Text: string) --[[ Line: 45 | Named "getResponseCode" ]]
	return if typeof(Text) == "table" then Text.statusCode else tonumber(string.match(Text, "status:%s*(%d%d%d)")) or tonumber(string.match(Text, "HTTP%s+(%d%d%d)"))
end

local function classifyStartFailure(p1): string --[[ Line: 52 ]]
	local Lowered = string.lower((tostring(p1)))
	
	return if string.find(Lowered, "x-api-key", 1, true) then "missing-open-cloud-api-key" elseif string.find(Lowered, "accept", 1, true) and string.find(Lowered, "header", 1, true) then "restricted-accept-header" else "request-start-failure"
end

local _ = function(p1, p2, p3) --[[ Line: 63 | Named "emit" ]]
	-- upvalues: FFlagBuildExperienceManageDevProductModule (copy)
	local Log = if p1 == nil then nil else p1.log
	
	if Log ~= nil then
		pcall(Log, p2)
		
		return
	end
	if FFlagBuildExperienceManageDevProductModule and p3 then
		warn(p2)
	end
end

local _ = function(p1, p2, p3) --[[ Line: 72 | Named "reportRequestStart" ]]
	-- upvalues: getHeader (copy)
	local Url: string = p2.url
	local Message: string = `[{if p1 == nil or p1.label == nil then "DeveloperProduct" else p1.label}] request transport=RequestInternal method={p2.method} url={string.match(Url, "^[^?]+") or Url} contentType={getHeader(p2.headers, "content-type") or "<none>"} retryCount={p3}`
	local Log = if p1 == nil then nil else p1.log
	
	if Log ~= nil then
		pcall(Log, Message)
		
		return
	end
end

local function reportResponse(p4, p5, p6, p7, Text: string, p8) --[[ Line: 81 ]]
	-- upvalues: getHeader (copy), FFlagBuildExperienceManageDevProductModule (copy)
	local StatusCode = if typeof(Text) == "table" then Text.statusCode else tonumber(string.match(Text, "status:%s*(%d%d%d)")) or tonumber(string.match(Text, "HTTP%s+(%d%d%d)"))
	local Url: string = p5.url
	local Message: string = `[{if p4 == nil or p4.label == nil then "DeveloperProduct" else p4.label}] response transport=RequestInternal method={p5.method} url={string.match(Url, "^[^?]+") or Url} responseCode={tostring(StatusCode)} requestId={(if typeof(Text) == "table" then getHeader(Text.headers, "x-request-id") or getHeader(Text.headers, "x-correlation-id") else nil) or "none"} csrfTokenPresent={tostring(typeof(Text) == "table" and getHeader(Text.headers, "x-csrf-token") ~= nil)} retryCount={p6} willRetry={tostring(p8)} transportSuccess={tostring(p7)}`
	local NoP13: boolean = not p7 or (StatusCode == nil or StatusCode >= 400)
	local Log = if p4 == nil then nil else p4.log
	
	if Log ~= nil then
		pcall(Log, Message)
		
		return
	end
	if FFlagBuildExperienceManageDevProductModule and NoP13 then
		warn(Message)
	end
end

local _ = function(p9, p10, p11, p12) --[[ Line: 106 | Named "reportStartFailure" ]]
	-- upvalues: classifyStartFailure (copy), FFlagBuildExperienceManageDevProductModule (copy)
	local Url: string = p10.url
	local Message: string = `[{if p9 == nil or p9.label == nil then "DeveloperProduct" else p9.label}] request transport=RequestInternal method={p10.method} url={string.match(Url, "^[^?]+") or Url} retryCount={p11} startFailure={classifyStartFailure(p12)}`
	local Log = if p9 == nil then nil else p9.log
	
	if Log ~= nil then
		pcall(Log, Message)
		
		return
	end
	if FFlagBuildExperienceManageDevProductModule then
		warn(Message)
	end
end

local _ = function(p13, p14) --[[ Line: 122 | Named "withCsrfRetry" ]]
	-- upvalues: getHeader (copy), reportResponse (copy), classifyStartFailure (copy), FFlagBuildExperienceManageDevProductModule (copy)
	return {
		request = function(p15, Callback) --[[ Line: 124 ]]
			-- upvalues: p14 (copy), getHeader (upval), p13 (copy), reportResponse (upval), classifyStartFailure (upval), FFlagBuildExperienceManageDevProductModule (upval)
			local Flag = false
			local List = {}
			
			local function startAttempt(p16, p17) --[[ Line: 131 ]]
				-- upvalues: p14 (upval), getHeader (upval), p13 (upval), Flag (ref), reportResponse (upval), startAttempt (copy), Callback (copy), classifyStartFailure (upval), FFlagBuildExperienceManageDevProductModule (upval), List (copy)
				local v1 = p14
				local Url: string = p16.url
				local Message: string = `[{if v1 == nil or v1.label == nil then "DeveloperProduct" else v1.label}] request transport=RequestInternal method={p16.method} url={string.match(Url, "^[^?]+") or Url} contentType={getHeader(p16.headers, "content-type") or "<none>"} retryCount={p17}`
				local Log = if v1 == nil then nil else v1.log
				
				if Log ~= nil then
					pcall(Log, Message)
				end
				local Flag1 = false
				local Success, Result = pcall(p13.request, p16, function(p18, p19) --[[ Line: 134 ]]
					-- upvalues: Flag1 (ref), Flag (upval), p17 (copy), getHeader (upval), reportResponse (upval), p14 (upval), p16 (copy), startAttempt (upval), Callback (upval)
					Flag1 = true
					
					if Flag then return end
					local XCsrfToken = if p18 and typeof(p19) == "table" and p17 == 0 then getHeader(p19.headers, "x-csrf-token") else nil
					local HasXCsrfToken: boolean = if p18 and typeof(p19) == "table" and p19.statusCode == 403 then XCsrfToken ~= nil else false
					reportResponse(p14, p16, p17, p18, p19, HasXCsrfToken)
					
					if not HasXCsrfToken then
						Callback(p18, p19)
						
						return
					end
					local Headers = {}
					
					if p16.headers ~= nil then
						for i, header in p16.headers do
							Headers[i] = header
						end
					end
					Headers["x-csrf-token"] = XCsrfToken
					startAttempt({
						url = p16.url,
						method = p16.method,
						headers = Headers,
						body = p16.body,
						onMessage = p16.onMessage,
						priority = p16.priority
					}, p17 + 1)
				end)
				
				if not Success then
					if not Flag1 then
						local Url1: string = p16.url
						local Message1: string = `[{if p14 == nil or p14.label == nil then "DeveloperProduct" else p14.label}] request transport=RequestInternal method={p16.method} url={string.match(Url1, "^[^?]+") or Url1} retryCount={p17} startFailure={classifyStartFailure(Result)}`
						local Log1 = if p14 == nil then nil else p14.log
						
						if Log1 == nil then
							if FFlagBuildExperienceManageDevProductModule then
								warn(Message1)
							end
						else
							pcall(Log1, Message1)
						end
					end
					error(Result, 0)
				end
				table.insert(List, Result)
			end
			
			startAttempt(p15, 0)
			
			return function() --[[ Line: 184 ]]
				-- upvalues: Flag (ref), List (copy)
				if Flag then return end
				Flag = true
				
				for _, value in List do
					value()
				end
			end
		end
	}
end

return function(p18, p19) --[[ Line: 197 | Named "createManageDevProductNetwork" ]]
	-- upvalues: CreatorApiHttpModule (copy), getHeader (copy), reportResponse (copy), classifyStartFailure (copy), FFlagBuildExperienceManageDevProductModule (copy)
	local WithoutRestrictedAcceptHeaderResult = CreatorApiHttpModule.withoutRestrictedAcceptHeader(p18)
	
	return {
		request = function(p20, Callback) --[[ Line: 124 ]]
			-- upvalues: p19 (copy), getHeader (upval), WithoutRestrictedAcceptHeaderResult (copy), reportResponse (upval), classifyStartFailure (upval), FFlagBuildExperienceManageDevProductModule (upval)
			local Flag = false
			local List = {}
			
			local function startAttempt(p21, p22) --[[ Line: 131 ]]
				-- upvalues: p19 (upval), getHeader (upval), WithoutRestrictedAcceptHeaderResult (upval), Flag (ref), reportResponse (upval), startAttempt (copy), Callback (copy), classifyStartFailure (upval), FFlagBuildExperienceManageDevProductModule (upval), List (copy)
				local v2 = p19
				local Url: string = p21.url
				local Message: string = `[{if v2 == nil or v2.label == nil then "DeveloperProduct" else v2.label}] request transport=RequestInternal method={p21.method} url={string.match(Url, "^[^?]+") or Url} contentType={getHeader(p21.headers, "content-type") or "<none>"} retryCount={p22}`
				local Log = if v2 == nil then nil else v2.log
				
				if Log ~= nil then
					pcall(Log, Message)
				end
				local Flag1 = false
				local Success, Result = pcall(WithoutRestrictedAcceptHeaderResult.request, p21, function(p23, p24) --[[ Line: 134 ]]
					-- upvalues: Flag1 (ref), Flag (upval), p22 (copy), getHeader (upval), reportResponse (upval), p19 (upval), p21 (copy), startAttempt (upval), Callback (upval)
					Flag1 = true
					
					if Flag then return end
					local XCsrfToken = if p23 and typeof(p24) == "table" and p22 == 0 then getHeader(p24.headers, "x-csrf-token") else nil
					local HasXCsrfToken: boolean = if p23 and typeof(p24) == "table" and p24.statusCode == 403 then XCsrfToken ~= nil else false
					reportResponse(p19, p21, p22, p23, p24, HasXCsrfToken)
					
					if not HasXCsrfToken then
						Callback(p23, p24)
						
						return
					end
					local Headers = {}
					
					if p21.headers ~= nil then
						for i, header in p21.headers do
							Headers[i] = header
						end
					end
					Headers["x-csrf-token"] = XCsrfToken
					startAttempt({
						url = p21.url,
						method = p21.method,
						headers = Headers,
						body = p21.body,
						onMessage = p21.onMessage,
						priority = p21.priority
					}, p22 + 1)
				end)
				
				if not Success then
					if not Flag1 then
						local Url1: string = p21.url
						local Message1: string = `[{if p19 == nil or p19.label == nil then "DeveloperProduct" else p19.label}] request transport=RequestInternal method={p21.method} url={string.match(Url1, "^[^?]+") or Url1} retryCount={p22} startFailure={classifyStartFailure(Result)}`
						local Log1 = if p19 == nil then nil else p19.log
						
						if Log1 == nil then
							if FFlagBuildExperienceManageDevProductModule then
								warn(Message1)
							end
						else
							pcall(Log1, Message1)
						end
					end
					error(Result, 0)
				end
				table.insert(List, Result)
			end
			
			startAttempt(p20, 0)
			
			return function() --[[ Line: 184 ]]
				-- upvalues: Flag (ref), List (copy)
				if Flag then return end
				Flag = true
				
				for _, value in List do
					value()
				end
			end
		end
	}
end