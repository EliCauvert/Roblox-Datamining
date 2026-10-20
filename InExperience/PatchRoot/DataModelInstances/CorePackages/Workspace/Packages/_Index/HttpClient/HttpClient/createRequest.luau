local Parent = script:FindFirstAncestor("HttpClient").Parent
local _ = require(script.Parent.types)
local EncodersModule = require(script.Parent.encoders)
local AnalyticsModule = require(script.Parent.analytics)
local FFlagHttpClientRetryExtensionsModule = require(script.Parent.Flags.FFlagHttpClientRetryExtensions)
local CreateSignalFunction = require(Parent.Signals).createSignal
local CreateResourceFunction = require(Parent.Resources).createResource

local function _(p1, p2)
	local Success, Result, Result3, Result4 = pcall(p1, p2)
	
	if Success then
		return Result, Result3, Result4
	else
		return nil, `decode error: {tostring(Result)}`, nil
	end
end

return function(p1)
	-- upvalues: AnalyticsModule (copy), EncodersModule (copy), CreateSignalFunction (copy), CreateResourceFunction (copy), FFlagHttpClientRetryExtensionsModule (copy)
	local Analytics = p1.analytics or AnalyticsModule.defaultAnalytics
	local Encode = p1.encode or EncodersModule.encodeJson
	local Signal, Signal2 = CreateSignalFunction({ status = "pending" })
	local Headers = { Accept = "application/json" }
	
	if p1.headers then
		for i, header in p1.headers do
			Headers[i] = header
		end
	end
	local Body = nil
	
	if p1.body ~= nil then
		local EncodeResult2
		Body, EncodeResult2 = Encode(p1.body)
		Headers["Content-Type"] = Headers["Content-Type"] or EncodeResult2
	end
	return {
		state = Signal,
		dispose = CreateResourceFunction(function(Callback)
			-- upvalues: Signal2 (copy), Analytics (copy), p1 (copy), FFlagHttpClientRetryExtensionsModule (upval), Headers (copy), Body (ref)
			local Flag = false
			local ClockTime = os.clock()
			
			local function settleFailed(p2)
				-- upvalues: Flag (ref), ClockTime (copy), Signal2 (upval), Analytics (upval), p1 (upval)
				if not Flag then
					Flag = true
					local ScaledClockTime = (os.clock() - ClockTime) * 1000
					Signal2({ status = "failed", error = `transport error: {p2}` })
					Analytics(p1.analyticsKey, p1.method, p1.url, nil, ScaledClockTime, "failed")
					
					return
				end
			end
			
			local function settleResponse(p2)
				-- upvalues: Flag (ref), ClockTime (copy), p1 (upval), FFlagHttpClientRetryExtensionsModule (upval), Signal2 (upval), Analytics (upval)
				if Flag then return end
				Flag = true
				local ScaledClockTime = (os.clock() - ClockTime) * 1000
				
				if p1.statusCodeActions ~= nil then
					local StatusCodeAction = p1.statusCodeActions[p2.statusCode]
					
					if StatusCodeAction ~= nil then
						for _, value in StatusCodeAction do
							local Success1, Result1 = pcall(value, p2)
							
							if not Success1 then
								warn(`[HttpClient] {p1.analyticsKey} status code action threw: {tostring(Result1)}`)
							end
						end
					end
				end
				local Success, Result, Result3, Result4 = pcall(p1.decode, p2)
				local Result2 = nil
				local DecodeName = nil
				local ErrorCode = nil
				
				if Success then
					Result2 = Result
					DecodeName = Result3
					ErrorCode = Result4
				else
					Result2 = nil
					DecodeName = `decode error: {tostring(Result)}`
					ErrorCode = nil
				end
				local Succeeded: string = if DecodeName == nil then "succeeded" else "failed"
				local Response = if FFlagHttpClientRetryExtensionsModule then p2 else nil
				
				if DecodeName == nil then
					Signal2({
						status = "succeeded",
						result = Result2,
						response = Response
					})
				else
					Signal2({
						status = "failed",
						error = DecodeName,
						errorCode = ErrorCode,
						response = Response
					})
				end
				Analytics(p1.analyticsKey, p1.method, p1.url, p2, ScaledClockTime, Succeeded)
			end
			
			local Success, Result = pcall(function()
				-- upvalues: p1 (upval), Headers (upval), Body (upval), FFlagHttpClientRetryExtensionsModule (upval), settleResponse (copy), settleFailed (copy), Callback (copy), Flag (ref)
				local RequestResult = p1.networkImpl.request({
					url = p1.url,
					method = p1.method,
					headers = Headers,
					body = Body,
					onMessage = if FFlagHttpClientRetryExtensionsModule then p1.onMessage else nil,
					priority = if FFlagHttpClientRetryExtensionsModule then p1.priority else nil
				}, function(p3, p4)
					-- upvalues: settleResponse (upval), settleFailed (upval)
					if p3 then
						settleResponse(p4)
						
						return
					else
						settleFailed((tostring(p4)))
					end
				end)
				Callback(function()
					-- upvalues: Flag (upval), RequestResult (copy)
					if not Flag then
						Flag = true
						RequestResult()
						
						return
					end
				end)
			end)
			
			if not Success then
				settleFailed((tostring(Result)))
			end
		end)
	}
end