local httpResponseStatus = require(script.Parent.Parent.InternalHttpStore).HttpResponseStatus

return function(p0) --[[ line: 9 | named "isHttpStoreFetchCancelled" ]]
	-- upvalues: httpResponseStatus (ref)
	if p0.status ~= httpResponseStatus.Failed then
		return false
	elseif p0.cancelled == true then
		return true
	end
	local response = p0.response
	
	return response and response.HttpError == Enum.HttpError.Aborted
end