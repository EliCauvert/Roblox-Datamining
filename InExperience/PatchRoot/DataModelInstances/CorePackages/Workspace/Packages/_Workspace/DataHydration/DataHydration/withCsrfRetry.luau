local _ = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)

local function getCsrfToken(p1)
	local headers = p1.headers
	
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

local function _(p2, p3)
	local t = {}
	
	if p2 then
		for i, v in p2 do
			t[i] = v
		end
	end
	for i, v in p3 do
		t[i] = v
	end
	return t
end

return function(p4)
	-- upvalues: getCsrfToken (ref)
	return {
		request = function(p5, p6)
			-- upvalues: p4 (ref), getCsrfToken (copy)
			local var1 = false
			local var2 = nil
			var2 = p4.request(p5, function(p7, p8)
				-- upvalues: var1 (write), p6 (ref), getCsrfToken (copy), p5 (ref), var2 (write), p4 (copy)
				if var1 then return end
				if not p7 or typeof(p8) ~= "table" then
					p6(p7, p8)
					
					return
				elseif p8.statusCode ~= 403 then
					p6(true, p8)
					
					return
				end
				local var3 = getCsrfToken(p8)
				
				if var3 == nil then
					p6(true, p8)
					
					return
				end
				local t = { url = p5.url, method = p5.method, body = p5.body }
				local headers = p5.headers
				local t_1 = { ["x-csrf-token"] = var3 }
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
				var2 = p4.request(t, function(p9, p10)
					-- upvalues: var1 (copy), p6 (copy)
					if var1 then
						return
					end
					p6(p9, p10)
				end)
			end)
			
			return function()
				-- upvalues: var1 (write), var2 (write)
				if var1 then return end
				var1 = true
				
				if var2 then
					var2()
				end
			end
		end
	}
end