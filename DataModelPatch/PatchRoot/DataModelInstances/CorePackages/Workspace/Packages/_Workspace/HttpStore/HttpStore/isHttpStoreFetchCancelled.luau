local HttpResponseStatus = require(script.Parent.Parent.InternalHttpStore).HttpResponseStatus

return function(p1): boolean
	-- upvalues: HttpResponseStatus (copy)
	if p1.status ~= HttpResponseStatus.Failed then
		return false
	elseif p1.cancelled == true then
		return true
	else
		local Response = p1.response
		
		return Response and Response.HttpError == Enum.HttpError.Aborted or false
	end
end