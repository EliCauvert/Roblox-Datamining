local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function getCsrfToken(p0) --[[ line: 14 ]]
	local headers = p0.headers
	
	if headers == nil then
		return nil
	end
	for i, v in headers do
		if string.lower(tostring(i)) == "x-csrf-token" then
			return v
		end
	end
	return nil
end

local function _(p1, p2) --[[ line: 27 | named "mergeHeaders" ]]
	local t = {}
	
	if p1 then
		for i, v in p1 do
			t[i] = v
		end
	end
	for i, v in p2 do
		t[i] = v
	end
	return t
end

return function(p3) --[[ line: 40 | named "withCsrfRetry" ]]
	-- upvalues: getCsrfToken (ref)
	return {
		request = function(p4, p5) --[[ line: 41 ]]
			-- upvalues: p3 (ref), getCsrfToken (copy)
			local var2 = false
			local var3 = nil
			var3 = p3.request(p4, function(p6, p7) --[[ line: 48 ]]
				-- upvalues: var2 (write), p5 (ref), getCsrfToken (copy), p4 (ref), var3 (write), p3 (copy)
				if var2 then return end
				if not p6 or typeof(p7) ~= "table" then
					p5(p6, p7)
					
					return
				elseif p7.statusCode ~= 403 then
					p5(true, p7)
					
					return
				end
				local var4 = getCsrfToken(p7)
				
				if var4 == nil then
					p5(true, p7)
					
					return
				end
				local t = { url = p4.url, method = p4.method, body = p4.body }
				local headers = p4.headers
				local t_1 = { ["x-csrf-token"] = var4 }
				local t_2 = {}
				
				if headers then
					for i, v in headers do
						t_2[i] = v
					end
				end
				for i, v in t_1 do
					t_2[i] = v
				end
				t.headers = t_2
				var3 = p3.request(t, function(p8, p9) --[[ line: 73 ]]
					-- upvalues: var2 (copy), p5 (copy)
					if var2 then
						return
					end
					p5(p8, p9)
				end)
			end)
			
			return function() --[[ line: 81 ]]
				-- upvalues: var2 (write), var3 (write)
				if var2 then return end
				var2 = true
				
				if var3 then
					var3()
				end
			end
		end
	}
end