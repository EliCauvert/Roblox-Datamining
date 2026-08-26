local parent = script:FindFirstAncestor("HttpClient").Parent
local resourcesModule = require(parent.Resources)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.types)
local encodersModule = require(script.Parent.encoders)
local analyticsModule = require(script.Parent.analytics)
local createSignal = signalsModule.createSignal
local createResource = resourcesModule.createResource

local function _(p1, p2)
	local ok, status, var1, var2 = pcall(p1, p2)
	
	if ok then
		return status, var1, var2
	end
	return nil, `decode error: {tostring(status)}`, nil
end

return function(p1)
	-- upvalues: analyticsModule (ref), encodersModule (ref), createSignal (ref), createResource (ref)
	local analytics = p1.analytics or analyticsModule.defaultAnalytics
	local encode = p1.encode or encodersModule.encodeJson
	local var1, var2 = createSignal({ status = "pending" })
	local t = { Accept = "application/json" }
	
	if p1.headers then
		for i, v in p1.headers do
			t[i] = v
		end
	end
	local var3 = nil
	
	if p1.body ~= nil then
		local var4, var5 = encode(p1.body)
		var3 = var4
		t["Content-Type"] = t["Content-Type"] or var5
	end
	return {
		state = var1,
		dispose = createResource(function(p2)
			-- upvalues: var2 (ref), analytics (ref), p1 (ref), t (ref), var3 (write)
			local var6 = false
			local processTime = os.clock()
			
			local function settleFailed(value)
				-- upvalues: var6 (write), processTime (ref), var2 (copy), analytics (copy), p1 (copy)
				if var6 then
					return
				end
				var6 = true
				local var7 = (os.clock() - processTime) * 1000
				var2({ status = "failed", error = `transport error: {value}` })
				analytics(p1.analyticsKey, p1.method, p1.url, nil, var7, "failed")
			end
			
			local function settleResponse(value)
				-- upvalues: var6 (write), processTime (ref), p1 (copy), var2 (copy), analytics (copy)
				if var6 then return end
				var6 = true
				local var7 = (os.clock() - processTime) * 1000
				
				if p1.statusCodeActions ~= nil then
					local statusCode = p1.statusCodeActions[value.statusCode]
					
					if statusCode ~= nil then
						for i, v in statusCode do
							local ok, status = pcall(v, value)
							
							if not ok then
								warn(`[HttpClient] {p1.analyticsKey} status code action threw: {tostring(status)}`)
							end
						end
					end
				end
				local var8, var9, var10
				local ok, status, var11, var12 = pcall(p1.decode, value)
				
				if ok then
					var8 = status
					var9 = var11
					var10 = var12
				else
					var8 = nil
					var9 = `decode error: {tostring(status)}`
					var10 = nil
				end
				local var13 = if var9 ~= nil then "succeeded" else "failed"
				
				if var9 == nil then
					var2({ status = "succeeded", result = var8 })
				else
					var2({ status = "failed", error = var9, errorCode = var10 })
				end
				analytics(p1.analyticsKey, p1.method, p1.url, value, var7, var13)
			end
			
			local ok, status = pcall(function()
				-- upvalues: p1 (copy), t (copy), var3 (copy), settleResponse (ref), settleFailed (ref), p2 (ref), var6 (write)
				local var14 = p1.networkImpl.request({
					url = p1.url,
					method = p1.method,
					headers = t,
					body = var3
				}, function(p3, p4)
					-- upvalues: settleResponse (copy), settleFailed (copy)
					if p3 then
						settleResponse(p4)
						
						return
					end
					settleFailed(tostring(p4))
				end)
				p2(function()
					-- upvalues: var6 (copy), var14 (ref)
					if var6 then
						return
					end
					var6 = true
					var14()
				end)
			end)
			
			if not ok then
				settleFailed(tostring(status))
			end
		end)
	}
end