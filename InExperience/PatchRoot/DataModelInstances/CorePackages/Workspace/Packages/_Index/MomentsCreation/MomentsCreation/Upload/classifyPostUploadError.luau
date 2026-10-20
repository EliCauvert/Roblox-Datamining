local list = {
	{
		pattern = "failed with status 429",
		status = "UploadQuotaReached"
	},
	{
		pattern = "failed with status -1",
		status = "NetworkError"
	},
	{
		pattern = "failed with status 0",
		status = "NetworkError"
	},
	{
		pattern = "S3 upload failed for chunk",
		status = "NetworkError"
	},
	{ pattern = "failed with status 5", status = "ServerError" },
	{
		pattern = "failed with status 4",
		status = "InvalidRequest"
	},
	{
		pattern = "failed to parse response",
		status = "ServerError"
	},
	{
		pattern = "S3 response missing ETag",
		status = "ServerError"
	},
	{
		pattern = "S3 chunk range exceeds",
		status = "InvalidRequest"
	},
	{ pattern = "CreatePostParams", status = "InvalidRequest" },
	{ pattern = "CreatePostAsync:", status = "InvalidRequest" },
	{ pattern = "not uploadable", status = "InvalidRequest" },
	{
		pattern = "Capture data is empty",
		status = "InvalidRequest"
	},
	{ pattern = "Invalid capture", status = "InvalidRequest" },
	{
		pattern = "multi-media posts are not yet supported",
		status = "InvalidRequest"
	},
	{ pattern = "is not enabled", status = "InvalidRequest" }
}

return function(p1)
	-- upvalues: list (copy)
	local Text = tostring(p1)
	
	for _, value in list do
		if string.find(Text, value.pattern, 1, true) then
			return value.status
		end
	end
	return "GenericFailure"
end