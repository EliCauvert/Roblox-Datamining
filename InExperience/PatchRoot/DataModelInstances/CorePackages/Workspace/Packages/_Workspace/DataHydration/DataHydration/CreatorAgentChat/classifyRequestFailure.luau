local RequestFailureKind = require(script.Parent.types).RequestFailureKind

return function(p1) --[[ Line: 11 | Named "classifyRequestFailure" ]]
	-- upvalues: RequestFailureKind (copy)
	if p1.status == "pending" then
		return { kind = RequestFailureKind.Timeout }
	end
	local Response = p1.response
	
	if p1.errorCode ~= nil then
		return {
			kind = RequestFailureKind.RpcError,
			httpStatusCode = if Response == nil then nil else Response.statusCode
		}
	end
	if Response ~= nil then
		return if Response.wasTransportFailure then { kind = RequestFailureKind.Transport } elseif Response.statusCode < 200 or Response.statusCode >= 300 then {
			kind = RequestFailureKind.Http,
			httpStatusCode = Response.statusCode
		} else { kind = RequestFailureKind.Unknown }
	end
	local Error: string = p1.error
	
	if Error ~= nil then
		if string.sub(Error, 1, 16) == "transport error:" then
			return { kind = RequestFailureKind.Transport }
		end
		local Number: number? = tonumber((string.match(Error, "^CAS HTTP (%d+)")))
		
		if Number ~= nil then
			return { kind = RequestFailureKind.Http, httpStatusCode = Number }
		end
	end
	return { kind = RequestFailureKind.Unknown }
end