local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local PromiseModule = require(Parent.Promise)
local HttpService = game:GetService("HttpService")
local GamePassUrlBuilderModule = require(script.Parent.GamePassUrlBuilder)
local ConfigResult = HttpRequestModule.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequestModule (copy)
		return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
	end
})

local function _(p1): boolean
	return type(p1) == "table" and (p1.HttpError == Enum.HttpError.OK and p1.StatusCode == nil)
end

return function(p1)
	-- upvalues: GamePassUrlBuilderModule (copy), ConfigResult (copy), HttpService (copy), PromiseModule (copy)
	return ConfigResult(GamePassUrlBuilderModule.buildRevokeOwnershipUrl(p1), "POST", { postBody = HttpService:JSONEncode({}) }):catch(function(Err)
		-- upvalues: PromiseModule (upval)
		local NoStatusCode: boolean = type(Err) == "table" and Err.HttpError == Enum.HttpError.OK and Err.StatusCode == nil
		
		return if NoStatusCode then nil else PromiseModule.reject(Err)
	end)
end