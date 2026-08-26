local httpResponseStatus = require(script.Parent.Parent.InternalHttpStore).HttpResponseStatus

return function(p1)
	-- upvalues: httpResponseStatus (ref)
	if p1.status ~= httpResponseStatus.Failed then
		return false
	elseif p1.cancelled == true then
		return true
	end
	local response = p1.response
	
	return response and response.HttpError == Enum.HttpError.Aborted
end