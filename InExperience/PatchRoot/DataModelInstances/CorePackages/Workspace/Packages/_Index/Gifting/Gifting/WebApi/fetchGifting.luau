local HttpService = game:GetService("HttpService")
local Gifting = script:FindFirstAncestor("Gifting")
local Parent = Gifting.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local GiftErrorModelModule = require(Gifting.Models.GiftErrorModel)
local _ = require(Gifting.Types)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise
local list = { 400, 403, 404, 503 }

local function decodeErrorBody(p1)
	-- upvalues: HttpService (copy)
	local ResponseBody = p1.responseBody
	local Text = if typeof(ResponseBody) == "buffer" then buffer.tostring(ResponseBody) else ResponseBody
	
	if Text == nil or Text == "" then
		return {}
	else
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, Text)
		
		return if Success and type(Result) == "table" then Result else {}
	end
end

return function(p1)
	-- upvalues: GiftErrorModelModule (copy), decodeErrorBody (copy), list (copy), FetchFunction (copy), AsPromiseFunction (copy), PromiseModule (copy)
	local FormatResult = nil
	
	local function captureGiftError(p2)
		-- upvalues: FormatResult (ref), GiftErrorModelModule (upval), decodeErrorBody (upval)
		FormatResult = GiftErrorModelModule.format(decodeErrorBody(p2), p2.statusCode)
	end
	
	local StatusCodeActions = {}
	
	for _, value in list do
		StatusCodeActions[value] = { captureGiftError }
	end
	return AsPromiseFunction((FetchFunction({
		retry = false,
		network = p1.network,
		method = p1.method,
		url = p1.url,
		body = p1.body,
		analyticsKey = p1.analyticsKey,
		decode = function(p2)
			-- upvalues: p1 (copy)
			local DecodeResult, DecodeResult2 = p1.decode(p2)
			
			if DecodeResult == nil then
				error(DecodeResult2 or "malformed response", 0)
			end
			return DecodeResult
		end,
		statusCodeActions = StatusCodeActions
	}))):catch(function(Err)
		-- upvalues: PromiseModule (upval), FormatResult (ref), GiftErrorModelModule (upval)
		return PromiseModule.reject(FormatResult or GiftErrorModelModule.format({}, Err.responseCode, Err.errorMessage))
	end)
end