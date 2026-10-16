local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function getCsrfToken(p1) --[[ Line: 14 ]]
	local Headers = p1.headers
	
	if Headers == nil then
		return nil
	end
	for i, header in Headers do
		if string.lower((tostring(i))) == "x-csrf-token" then
			return header
		end
	end
	return nil
end

local function _(List, List1) --[[ Line: 27 | Named "mergeHeaders" ]]
	local t = {}
	
	if List then
		for i, value in List do
			t[i] = value
		end
	end
	for i1, value1 in List1 do
		t[i1] = value1
	end
	return t
end

return function(p2) --[[ Line: 40 | Named "withCsrfRetry" ]]
	-- upvalues: getCsrfToken (copy)
	return {
		request = function(p3, Callback) --[[ Line: 41 ]]
			-- upvalues: p2 (copy), getCsrfToken (upval)
			local Flag = false
			local RequestResult = nil
			RequestResult = p2.request(p3, function(p4, p5) --[[ Line: 48 ]]
				-- upvalues: Flag (ref), Callback (copy), getCsrfToken (upval), p3 (copy), RequestResult (ref), p2 (upval)
				if Flag then return end
				if not p4 or typeof(p5) ~= "table" then
					Callback(p4, p5)
					
					return
				end
				if p5.statusCode ~= 403 then
					Callback(true, p5)
					
					return
				end
				local CsrfToken = getCsrfToken(p5)
				
				if CsrfToken == nil then
					Callback(true, p5)
					
					return
				end
				local config = { url = p3.url, method = p3.method, body = p3.body }
				local Headers = p3.headers
				local config1 = { ["x-csrf-token"] = CsrfToken }
				local Headers1 = {}
				
				if Headers then
					for i, header in Headers do
						Headers1[i] = header
					end
				end
				for i1, value in config1 do
					Headers1[i1] = value
				end
				config.headers = Headers1
				RequestResult = p2.request(config, function(p6, p7) --[[ Line: 73 ]]
					-- upvalues: Flag (upval), Callback (upval)
					if not Flag then
						Callback(p6, p7)
						
						return
					end
				end)
			end)
			
			return function() --[[ Line: 81 ]]
				-- upvalues: Flag (ref), RequestResult (ref)
				if Flag then return end
				Flag = true
				
				if RequestResult then
					RequestResult()
				end
			end
		end
	}
end