return function(p1, HttpRbxApiService, HttpService, Text: string): boolean
	local Match: string? = string.match(Text, "^https?://[^.]+%.([^/]+)")
	
	if Match == nil then
		return false
	else
		local Data = HttpService:JSONDecode((HttpRbxApiService:PostAsyncFullUrl(string.format("https://apis.%s/profile-platform-api/v1/profiles/get", Match), HttpService:JSONEncode({
			profileType = "User",
			includeComponentOrdering = false,
			profileId = tostring(p1),
			components = { { component = "UserProfileHeader" } }
		}), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)))
		local UserProfileHeader = if type(Data) == "table" and type(Data.components) == "table" then Data.components.UserProfileHeader else nil
		
		return type(UserProfileHeader) == "table" and UserProfileHeader.isRobloxAdmin == true
	end
end