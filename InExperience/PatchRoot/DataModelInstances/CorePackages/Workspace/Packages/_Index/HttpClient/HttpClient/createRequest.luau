local parent = script:FindFirstAncestor("HttpClient").Parent
local resourcesModule = require(parent.Resources)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.types)
local encodersModule = require(script.Parent.encoders)
local analyticsModule = require(script.Parent.analytics)
local createSignal = signalsModule.createSignal
local createResource = resourcesModule.createResource

local function _(p0, p1)
	local ok, status, var4, var5 = pcall(p0, p1)
	
	if ok then
		return status, var4, var5
	end
	return nil, `decode error: {tostring(status)}`, nil
end

return function(p2)
	-- upvalues: analyticsModule (ref), encodersModule (ref), createSignal (ref), createResource (ref)
	local analytics = p2.analytics or analyticsModule.defaultAnalytics
	local encode = p2.encode or encodersModule.encodeJson
	local var8, var9 = createSignal({ status = "pending" })
	local t = { Accept = "application/json" }
	
	if p2.headers then
		for i, v in p2.headers do
			t[i] = v
		end
	end
	local var11 = nil
	
	if p2.body ~= nil then
		local var12, var13 = encode(p2.body)
		var11 = var12
		t["Content-Type"] = t["Content-Type"] or var13
	end
	return {
		state = var8,
		dispose = createResource(function(p3)
			-- upvalues: var9 (ref), analytics (ref), p2 (ref), t (ref), var11 (write)
			local var14 = false
			local processTime = os.clock()
			
			local function settleFailed(value)
				-- upvalues: var14 (write), processTime (ref), var9 (copy), analytics (copy), p2 (copy)
				if var14 then
					return
				end
				var14 = true
				local var18 = (os.clock() - processTime) * 1000
				var9({ status = "failed", error = `transport error: {value}` })
				analytics(p2.analyticsKey, p2.method, p2.url, nil, var18, "failed")
			end
			
			local function settleResponse(value)
				-- upvalues: var14 (write), processTime (ref), p2 (copy), var9 (copy), analytics (copy)
				if var14 then return end
				var14 = true
				local var19 = (os.clock() - processTime) * 1000
				
				if p2.statusCodeActions ~= nil then
					local statusCode = p2.statusCodeActions[value.statusCode]
					
					if statusCode ~= nil then
						for i, v in statusCode do
							local ok, status = pcall(v, value)
							
							if not ok then
								warn(`[HttpClient] {p2.analyticsKey} status code action threw: {tostring(status)}`)
							end
						end
					end
				end
				local var22, var23, var24
				local ok, status, var20, var21 = pcall(p2.decode, value)
				
				if ok then
					var22 = status
					var23 = var20
					var24 = var21
				else
					var22 = nil
					var23 = `decode error: {tostring(status)}`
					var24 = nil
				end
				local var25 = if var23 ~= nil then "succeeded" else "failed"
				
				if var23 == nil then
					var9({ status = "succeeded", result = var22 })
				else
					var9({ status = "failed", error = var23, errorCode = var24 })
				end
				analytics(p2.analyticsKey, p2.method, p2.url, value, var19, var25)
			end
			
			local ok, status = pcall(function()
				-- upvalues: p2 (copy), t (copy), var11 (copy), settleResponse (ref), settleFailed (ref), p3 (ref), var14 (write)
				local var26 = p2.networkImpl.request({
					url = p2.url,
					method = p2.method,
					headers = t,
					body = var11
				}, function(p4, p5)
					-- upvalues: settleResponse (copy), settleFailed (copy)
					if p4 then
						settleResponse(p5)
						
						return
					end
					settleFailed(tostring(p5))
				end)
				p3(function()
					-- upvalues: var14 (copy), var26 (ref)
					if var14 then
						return
					end
					var14 = true
					var26()
				end)
			end)
			
			if not ok then
				settleFailed(tostring(status))
			end
		end)
	}
end