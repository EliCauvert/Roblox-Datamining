local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.HttpClient)
local creatorApiHttpModule = require(parent.DataHydration.CreatorApiHttp)
local fFlagBuildExperienceManageDevProduct = require(buildExperience.Flags.FFlagBuildExperienceManageDevProduct) or require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)

local function getHeader(p1, p2)
	if p1 == nil then
		return nil
	end
	for i, v in p1 do
		if string.lower(i) == string.lower(p2) then
			return v
		end
	end
	return nil
end

local function _(p3)
	-- upvalues: getHeader (ref)
	return getHeader(p3.headers, "x-csrf-token")
end

local _ = function(p3)
	return string.match(p3, "^[^?]+") or p3
end

local _ = function(p3)
	-- upvalues: getHeader (ref)
	return getHeader(p3.headers, "x-request-id") or getHeader(p3.headers, "x-correlation-id")
end

local _ = function(p3)
	return if typeof(p3) == "table" then p3.statusCode else tonumber(string.match(p3, "status:%s*(%d%d%d)")) or tonumber(string.match(p3, "HTTP%s+(%d%d%d)"))
end

local function classifyStartFailure(p3)
	local lowerText = string.lower(tostring(p3))
	
	return if string.find(lowerText, "x-api-key", 1, true) then "missing-open-cloud-api-key" elseif string.find(lowerText, "accept", 1, true) and string.find(lowerText, "header", 1, true) then "restricted-accept-header" else "request-start-failure"
end

local _ = function(p3, p4, p5)
	-- upvalues: fFlagBuildExperienceManageDevProduct (ref)
	local var1 = if p3 ~= nil then nil else p3.log
	
	if var1 ~= nil then
		pcall(var1, p4)
		
		return
	elseif fFlagBuildExperienceManageDevProduct and p5 then
		warn(p4)
	end
end

local _ = function(p3, p4, p5)
	-- upvalues: getHeader (ref)
	local url = p4.url
	local var1 = `[{if p3 == nil or p3.label == nil then "DeveloperProduct" else p3.label}] request transport=RequestInternal method={p4.method} url={string.match(url, "^[^?]+") or url} contentType={getHeader(p4.headers, "content-type") or "<none>"} retryCount={p5}`
	local var2 = if p3 ~= nil then nil else p3.log
	
	if var2 == nil then
		return
	end
	pcall(var2, var1)
end

local function reportResponse(p6, p7, p8, p9, p10, p11)
	-- upvalues: getHeader (ref), fFlagBuildExperienceManageDevProduct (ref)
	local var3
	local var4 = if p6 == nil or p6.label == nil then "DeveloperProduct" else p6.label
	local var5 = if typeof(p10) == "table" then p10.statusCode else tonumber(string.match(p10, "status:%s*(%d%d%d)")) or tonumber(string.match(p10, "HTTP%s+(%d%d%d)"))
	local var6 = if typeof(p10) == "table" then getHeader(p10.headers, "x-request-id") or getHeader(p10.headers, "x-correlation-id") else nil
	
	if typeof(p10) == "table" then
		var3 = getHeader(p10.headers, "x-csrf-token") ~= nil
		var3 = nil
	else
		var3 = false
	end
	local url = p7.url
	local var7 = `[{var4}] response transport=RequestInternal method={p7.method} url={string.match(url, "^[^?]+") or url} responseCode={tostring(var5)} requestId={var6 or "none"} csrfTokenPresent={tostring(var3)} retryCount={p8} willRetry={tostring(p11)} transportSuccess={tostring(p9)}`
	local var8 = if p9 then if var5 ~= nil then var5 >= 400 else true else not p9
	local var9 = if p6 ~= nil then nil else p6.log
	
	if var9 ~= nil then
		pcall(var9, var7)
		
		return
	elseif fFlagBuildExperienceManageDevProduct and var8 then
		warn(var7)
	end
end

local _ = function(p6, p7, p8, p9)
	-- upvalues: classifyStartFailure (ref), fFlagBuildExperienceManageDevProduct (ref)
	local url = p7.url
	local var3 = `[{if p6 == nil or p6.label == nil then "DeveloperProduct" else p6.label}] request transport=RequestInternal method={p7.method} url={string.match(url, "^[^?]+") or url} retryCount={p8} startFailure={classifyStartFailure(p9)}`
	local var4 = if p6 ~= nil then nil else p6.log
	
	if var4 ~= nil then
		pcall(var4, var3)
		
		return
	elseif fFlagBuildExperienceManageDevProduct then
		warn(var3)
	end
end

local _ = function(p10, p11)
	-- upvalues: getHeader (ref), reportResponse (ref), classifyStartFailure (ref), fFlagBuildExperienceManageDevProduct (ref)
	return {
		request = function(p12, p13)
			-- upvalues: p11 (ref), getHeader (copy), p10 (ref), reportResponse (copy), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy)
			local var5 = false
			local t = {}
			
			local function startAttempt(p14, p15)
				-- upvalues: p11 (copy), getHeader (copy), p10 (copy), var5 (write), reportResponse (copy), startAttempt (ref), p13 (ref), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy), t (ref)
				local var6 = p11
				local url = p14.url
				local var7 = `[{if var6 == nil or var6.label == nil then "DeveloperProduct" else var6.label}] request transport=RequestInternal method={p14.method} url={string.match(url, "^[^?]+") or url} contentType={getHeader(p14.headers, "content-type") or "<none>"} retryCount={p15}`
				local var8 = if var6 ~= nil then nil else var6.log
				
				if var8 ~= nil then
					pcall(var8, var7)
				end
				var6 = false
				local ok, status = pcall(p10.request, p14, function(p16, p17)
					-- upvalues: var6 (write), var5 (copy), p15 (ref), getHeader (copy), reportResponse (copy), p11 (copy), p14 (ref), startAttempt (copy), p13 (copy)
					var6 = true
					
					if var5 then return end
					local var9
					local var10 = if p16 and typeof(p17) == "table" and p15 == 0 then getHeader(p17.headers, "x-csrf-token") else nil
					
					if p16 and typeof(p17) == "table" then
						var9 = false
						
						if p17.statusCode == 403 then
							local _ = var10 ~= nil
						end
					else
						var9 = false
					end
					reportResponse(p11, p14, p15, p16, p17, var9)
					
					if not var9 then
						p13(p16, p17)
						
						return
					end
					local t = {}
					
					if p14.headers ~= nil then
						for i, v in p14.headers do
							t[i] = v
						end
					end
					t["x-csrf-token"] = var10
					startAttempt({
						url = p14.url,
						method = p14.method,
						headers = t,
						body = p14.body,
						onMessage = p14.onMessage,
						priority = p14.priority
					}, p15 + 1)
				end)
				
				if not ok then
					local var11 = p11
					local url_1 = p14.url
					local var12 = `[{if var11 == nil or var11.label == nil then "DeveloperProduct" else var11.label}] request transport=RequestInternal method={p14.method} url={string.match(url_1, "^[^?]+") or url_1} retryCount={p15} startFailure={classifyStartFailure(status)}`
					local var13 = if var11 ~= nil then nil else var11.log
					
					if var13 ~= nil then
						pcall(var13, var12)
					elseif fFlagBuildExperienceManageDevProduct then
						warn(var12)
					end
					error(status, 0)
				end
				table.insert(t, status)
			end
			
			startAttempt(p12, 0)
			
			return function()
				-- upvalues: var5 (write), t (ref)
				if var5 then return end
				var5 = true
				
				for i, v in t do
					v()
				end
			end
		end
	}
end

return function(p16, p17)
	-- upvalues: creatorApiHttpModule (ref), getHeader (ref), reportResponse (ref), classifyStartFailure (ref), fFlagBuildExperienceManageDevProduct (ref)
	local var9 = creatorApiHttpModule.withoutRestrictedAcceptHeader(p16)
	
	return {
		request = function(p18, p19)
			-- upvalues: p17 (ref), getHeader (copy), var9 (ref), reportResponse (copy), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy)
			local var10 = false
			local t = {}
			
			local function startAttempt(p20, p21)
				-- upvalues: p17 (copy), getHeader (copy), var9 (copy), var10 (write), reportResponse (copy), startAttempt (ref), p19 (ref), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy), t (ref)
				local url = p20.url
				local var11 = `[{if p17 == nil or p17.label == nil then "DeveloperProduct" else p17.label}] request transport=RequestInternal method={p20.method} url={string.match(url, "^[^?]+") or url} contentType={getHeader(p20.headers, "content-type") or "<none>"} retryCount={p21}`
				local var12 = if p17 ~= nil then nil else p17.log
				
				if var12 ~= nil then
					pcall(var12, var11)
				end
				local var13 = false
				local ok, status = pcall(var9.request, p20, function(p22, p23)
					-- upvalues: var13 (write), var10 (copy), p21 (ref), getHeader (copy), reportResponse (copy), p17 (copy), p20 (ref), startAttempt (copy), p19 (copy)
					var13 = true
					
					if var10 then return end
					local var14
					local var15 = if p22 and typeof(p23) == "table" and p21 == 0 then getHeader(p23.headers, "x-csrf-token") else nil
					
					if p22 and typeof(p23) == "table" then
						var14 = false
						
						if p23.statusCode == 403 then
							local _ = var15 ~= nil
						end
					else
						var14 = false
					end
					reportResponse(p17, p20, p21, p22, p23, var14)
					
					if not var14 then
						p19(p22, p23)
						
						return
					end
					local t = {}
					
					if p20.headers ~= nil then
						for i, v in p20.headers do
							t[i] = v
						end
					end
					t["x-csrf-token"] = var15
					startAttempt({
						url = p20.url,
						method = p20.method,
						headers = t,
						body = p20.body,
						onMessage = p20.onMessage,
						priority = p20.priority
					}, p21 + 1)
				end)
				
				if not ok then
					local var16 = p17
					local url_1 = p20.url
					local var17 = `[{if var16 == nil or var16.label == nil then "DeveloperProduct" else var16.label}] request transport=RequestInternal method={p20.method} url={string.match(url_1, "^[^?]+") or url_1} retryCount={p21} startFailure={classifyStartFailure(status)}`
					local var18 = if var16 ~= nil then nil else var16.log
					
					if var18 ~= nil then
						pcall(var18, var17)
					elseif fFlagBuildExperienceManageDevProduct then
						warn(var17)
					end
					error(status, 0)
				end
				table.insert(t, status)
			end
			
			startAttempt(p18, 0)
			
			return function()
				-- upvalues: var10 (write), t (ref)
				if var10 then return end
				var10 = true
				
				for i, v in t do
					v()
				end
			end
		end
	}
end