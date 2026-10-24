local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local HttpClientModule = require(Parent.HttpClient)
local Text = require(Parent.Http).Url.APIS_URL .. "look-api/v1/avatar-moments/create"

local function _(Buf)
	return if typeof(Buf) == "string" then Buf elseif typeof(Buf) == "buffer" then buffer.tostring(Buf) else ""
end

return function(Body, p1)
	-- upvalues: HttpClientModule (copy), Text (copy), HttpService (copy)
	return HttpClientModule.asPromise((HttpClientModule.createRequest({
		method = "POST",
		analyticsKey = "moments-creation.create-avatar-moment-look",
		networkImpl = if p1 and p1.network then p1.network else HttpClientModule.createRequestInternalNetwork(),
		url = Text,
		headers = { ["Content-Type"] = "application/json" },
		body = Body,
		decode = function(p2)
			-- upvalues: HttpService (upval)
			local ResponseBody = p2.responseBody
			local ResponseBody1 = if typeof(ResponseBody) == "string" then ResponseBody elseif typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ""
			local OutfitId = nil
			local Success, Result = pcall(HttpService.JSONDecode, HttpService, ResponseBody1)
			
			if Success and type(Result) == "table" and type(Result.outfitId) == "number" then
				OutfitId = Result.outfitId
			end
			return { statusCode = p2.statusCode, outfitId = OutfitId }
		end
	})))
end