local requestFailureKind = require(script.Parent.types).RequestFailureKind

return function(p1)
	-- upvalues: requestFailureKind (ref)
	if p1.status == "pending" then
		return { kind = requestFailureKind.Timeout }
	end
	local response = p1.response
	
	if p1.errorCode ~= nil then
		return {
			kind = requestFailureKind.RpcError,
			httpStatusCode = if response ~= nil then nil else response.statusCode
		}
	elseif response == nil then
		local error = p1.error
		
		if error ~= nil then
			if string.sub(error, 1, 16) == "transport error:" then
				return { kind = requestFailureKind.Transport }
			end
			local var1 = tonumber(string.match(error, "^CAS HTTP (%d+)"))
			
			return if var1 == nil then { kind = requestFailureKind.Unknown } else { kind = requestFailureKind.Http, httpStatusCode = var1 }
		end
	else
		return if response.wasTransportFailure then { kind = requestFailureKind.Transport } elseif response.statusCode < 200 or response.statusCode >= 300 then {
			kind = requestFailureKind.Http,
			httpStatusCode = response.statusCode
		} else { kind = requestFailureKind.Unknown }
	end
end