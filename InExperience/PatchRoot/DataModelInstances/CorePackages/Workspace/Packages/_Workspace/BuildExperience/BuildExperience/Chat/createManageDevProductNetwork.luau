local _ = require(script:FindFirstAncestor("BuildExperience").Parent.HttpClient)

local function getCsrfToken(p1)
	if p1.headers == nil then
		return nil
	end
	for i, v in p1.headers do
		if string.lower(i) == "x-csrf-token" then
			return v
		end
	end
	return nil
end

local function _(p2)
	-- upvalues: getCsrfToken (ref)
	return {
		request = function(p3, p4)
			-- upvalues: p2 (ref), getCsrfToken (copy)
			local var1 = false
			local var2 = nil
			var2 = p2.request(p3, function(p5, p6)
				-- upvalues: var1 (write), p4 (ref), getCsrfToken (copy), p3 (ref), var2 (write), p2 (copy)
				if var1 then return end
				if not p5 or typeof(p6) ~= "table" then
					p4(p5, p6)
					
					return
				end
				local var3 = if p6.statusCode == 403 then getCsrfToken(p6) else nil
				
				if var3 == nil then
					p4(true, p6)
					
					return
				end
				local t = {}
				
				if p3.headers ~= nil then
					for i, v in p3.headers do
						t[i] = v
					end
				end
				t["x-csrf-token"] = var3
				var2 = p2.request({
					url = p3.url,
					method = p3.method,
					headers = t,
					body = p3.body,
					onMessage = p3.onMessage
				}, p4)
			end)
			
			return function()
				-- upvalues: var1 (write), var2 (write)
				var1 = true
				
				if var2 ~= nil then
					var2()
				end
			end
		end
	}
end

local _ = function(p3)
	return {
		request = function(p4, p5)
			-- upvalues: p3 (ref)
			local var1 = nil
			
			if p4.headers ~= nil then
				local t = {}
				
				for i, v in p4.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var1 = t
			end
			return p3.request({
				url = p4.url,
				method = p4.method,
				headers = var1,
				body = p4.body,
				onMessage = p4.onMessage
			}, p5)
		end
	}
end

return function(p4)
	-- upvalues: getCsrfToken (ref)
	local t = {
		request = function(p5, p6)
			-- upvalues: p4 (ref)
			local var1 = nil
			
			if p5.headers ~= nil then
				local t = {}
				
				for i, v in p5.headers do
					if string.lower(i) ~= "accept" then
						t[i] = v
					end
				end
				var1 = t
			end
			return p4.request({
				url = p5.url,
				method = p5.method,
				headers = var1,
				body = p5.body,
				onMessage = p5.onMessage
			}, p6)
		end
	}
	
	return {
		request = function(p7, p8)
			-- upvalues: t (ref), getCsrfToken (copy)
			local var2 = false
			local var3 = nil
			var3 = t.request(p7, function(p9, p10)
				-- upvalues: var2 (write), p8 (ref), getCsrfToken (copy), p7 (ref), var3 (write), t (copy)
				if var2 then return end
				if not p9 or typeof(p10) ~= "table" then
					p8(p9, p10)
					
					return
				end
				local var4 = if p10.statusCode == 403 then getCsrfToken(p10) else nil
				
				if var4 == nil then
					p8(true, p10)
					
					return
				end
				local t = {}
				
				if p7.headers ~= nil then
					for i, v in p7.headers do
						t[i] = v
					end
				end
				t["x-csrf-token"] = var4
				var3 = t.request({
					url = p7.url,
					method = p7.method,
					headers = t,
					body = p7.body,
					onMessage = p7.onMessage
				}, p8)
			end)
			
			return function()
				-- upvalues: var2 (write), var3 (write)
				var2 = true
				
				if var3 ~= nil then
					var3()
				end
			end
		end
	}
end