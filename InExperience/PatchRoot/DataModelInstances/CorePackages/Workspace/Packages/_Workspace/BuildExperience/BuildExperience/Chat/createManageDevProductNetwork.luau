local buildExperience = script:FindFirstAncestor("BuildExperience")
local _ = require(buildExperience.Parent.HttpClient)
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

local _ = function(p16)
	return {
		request = function(p17, p18)
			-- upvalues: p16 (ref)
			local var9 = nil
			
			if p17.headers ~= nil then
				local t = {}
				
				for i, v in p17.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var9 = t
			end
			return p16.request({
				url = p17.url,
				method = p17.method,
				headers = var9,
				body = p17.body,
				onMessage = p17.onMessage,
				priority = p17.priority
			}, p18)
		end
	}
end

return function(p17, p18)
	-- upvalues: getHeader (ref), reportResponse (ref), classifyStartFailure (ref), fFlagBuildExperienceManageDevProduct (ref)
	local t = {
		request = function(p19, p20)
			-- upvalues: p17 (ref)
			local var9 = nil
			
			if p19.headers ~= nil then
				local t = {}
				
				for i, v in p19.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var9 = t
			end
			return p17.request({
				url = p19.url,
				method = p19.method,
				headers = var9,
				body = p19.body,
				onMessage = p19.onMessage,
				priority = p19.priority
			}, p20)
		end
	}
	
	return {
		request = function(p21, p22)
			-- upvalues: p18 (ref), getHeader (copy), t (ref), reportResponse (copy), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy)
			local var10 = false
			local t = {}
			
			local function startAttempt(p23, p24)
				-- upvalues: p18 (copy), getHeader (copy), t (copy), var10 (write), reportResponse (copy), startAttempt (ref), p22 (ref), classifyStartFailure (copy), fFlagBuildExperienceManageDevProduct (copy), t (ref)
				local url = p23.url
				local var11 = `[{if p18 == nil or p18.label == nil then "DeveloperProduct" else p18.label}] request transport=RequestInternal method={p23.method} url={string.match(url, "^[^?]+") or url} contentType={getHeader(p23.headers, "content-type") or "<none>"} retryCount={p24}`
				local var12 = if p18 ~= nil then nil else p18.log
				
				if var12 ~= nil then
					pcall(var12, var11)
				end
				local var13 = false
				local ok, status = pcall(t.request, p23, function(p25, p26)
					-- upvalues: var13 (write), var10 (copy), p24 (ref), getHeader (copy), reportResponse (copy), p18 (copy), p23 (ref), startAttempt (copy), p22 (copy)
					var13 = true
					
					if var10 then return end
					local var14
					local var15 = if p25 and typeof(p26) == "table" and p24 == 0 then getHeader(p26.headers, "x-csrf-token") else nil
					
					if p25 and typeof(p26) == "table" then
						var14 = false
						
						if p26.statusCode == 403 then
							local _ = var15 ~= nil
						end
					else
						var14 = false
					end
					reportResponse(p18, p23, p24, p25, p26, var14)
					
					if not var14 then
						p22(p25, p26)
						
						return
					end
					local t = {}
					
					if p23.headers ~= nil then
						for i, v in p23.headers do
							t[i] = v
						end
					end
					t["x-csrf-token"] = var15
					startAttempt({
						url = p23.url,
						method = p23.method,
						headers = t,
						body = p23.body,
						onMessage = p23.onMessage,
						priority = p23.priority
					}, p24 + 1)
				end)
				
				if not ok then
					local var16 = p18
					local url_1 = p23.url
					local var17 = `[{if var16 == nil or var16.label == nil then "DeveloperProduct" else var16.label}] request transport=RequestInternal method={p23.method} url={string.match(url_1, "^[^?]+") or url_1} retryCount={p24} startFailure={classifyStartFailure(status)}`
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
			
			startAttempt(p21, 0)
			
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