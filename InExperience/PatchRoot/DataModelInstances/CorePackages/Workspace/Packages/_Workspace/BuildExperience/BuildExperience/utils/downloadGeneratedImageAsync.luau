local Parent = script:FindFirstAncestor("BuildExperience").Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local GetThumbnailUrlAsyncModule = require(script.Parent.getThumbnailUrlAsync)
local AsPromiseFunction = HttpClientModule.asPromise
local FetchFunction = HttpClientModule.fetch

return function(p1) --[[ Line: 20 | Named "downloadGeneratedImageAsync" ]]
	-- upvalues: GetThumbnailUrlAsyncModule (copy), PromiseModule (copy), FetchFunction (copy), AsPromiseFunction (copy)
	return GetThumbnailUrlAsyncModule(p1):andThen(function(Result) --[[ Line: 21 ]]
		-- upvalues: PromiseModule (upval), FetchFunction (upval), AsPromiseFunction (upval), p1 (copy)
		return if Result.status == "completed" then AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "build-experience.download-developer-product-image",
			responseEncoding = "protobuf",
			url = Result.imageUrl,
			decode = function(p2) --[[ Line: 31 ]]
				return p2
			end
		}))):andThen(function(Buf) --[[ Line: 35 ]]
			-- upvalues: PromiseModule (upval), p1 (upval)
			return if buffer.len(Buf) > 5242880 then PromiseModule.reject("The generated image exceeds the 5 MB developer-product limit.") else {
				contentType = "image/png",
				content = buffer.tostring(Buf),
				fileName = `generated-{p1}.png`
			}
		end) else PromiseModule.reject("The generated image is still under review.")
	end)
end