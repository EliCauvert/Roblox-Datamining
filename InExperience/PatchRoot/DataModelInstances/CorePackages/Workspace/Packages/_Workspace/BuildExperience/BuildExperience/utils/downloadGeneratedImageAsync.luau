local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpClientModule = require(parent.HttpClient)
local promiseModule = require(parent.Promise)
local getThumbnailUrlAsyncModule = require(script.Parent.getThumbnailUrlAsync)
local asPromise = httpClientModule.asPromise
local fetch = httpClientModule.fetch

return function(p1)
	-- upvalues: getThumbnailUrlAsyncModule (ref), promiseModule (ref), fetch (ref), asPromise (ref)
	return getThumbnailUrlAsyncModule(p1):andThen(function(p2)
		-- upvalues: promiseModule (copy), fetch (copy), asPromise (copy), p1 (ref)
		return if p2.status == "completed" then asPromise(fetch({
			method = "GET",
			analyticsKey = "build-experience.download-developer-product-image",
			responseEncoding = "protobuf",
			url = p2.imageUrl,
			decode = function(p3)
				return p3
			end
		})):andThen(function(p3)
			-- upvalues: promiseModule (copy), p1 (copy)
			return if buffer.len(p3) > 5242880 then promiseModule.reject("The generated image exceeds the 5 MB developer-product limit.") else {
				contentType = "image/png",
				content = buffer.tostring(p3),
				fileName = `generated-{p1}.png`
			}
		end) else promiseModule.reject("The generated image is still under review.")
	end)
end