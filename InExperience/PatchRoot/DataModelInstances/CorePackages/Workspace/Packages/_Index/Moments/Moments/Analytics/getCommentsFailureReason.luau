local t = {
	AuthenticationRequired = "authentication_required",
	CommentsEndpointDisabled = "endpoint_disabled",
	CommentsDisabledByCreator = "comments_disabled",
	MomentUnavailable = "moment_unavailable",
	MomentNotFound = "moment_unavailable",
	MomentNotVisible = "moment_unavailable",
	ViewerNotEligibleToRead = "not_eligible",
	ViewerNotEligibleToWrite = "not_eligible",
	TextFilterRejected = "text_rejected",
	RateLimited = "rate_limited",
	InvalidCursor = "invalid_cursor",
	InvalidRequest = "invalid_request"
}

return function(p1, p2)
	-- upvalues: t (ref)
	return if not (p1 ~= nil and t[p1] ~= nil) then if p2 == 408 or p2 == 504 then "timeout" elseif p2 == 429 then "rate_limited" elseif p2 == 401 then "authentication_required" elseif not (p2 ~= nil and p2 >= 500) then if not (p2 ~= nil and p2 >= 400) then if p2 == nil then "unknown" else `unknown_{p2}` else "request_rejected" else "server_error" else t[p1]
end