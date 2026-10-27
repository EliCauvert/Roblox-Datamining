local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local FFlagBuildExperienceMonetizationFailureCausesModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationFailureCauses)
local GetThumbnailUrlAsyncModule = require(script.Parent.getThumbnailUrlAsync)
local MonetizationFailureCausesModule = require(script.Parent.monetizationFailureCauses)
local AsPromiseFunction = HttpClientModule.asPromise
local FetchFunction = HttpClientModule.fetch

return function(p1)
	-- upvalues: GetThumbnailUrlAsyncModule (copy), PromiseModule (copy), MonetizationFailureCausesModule (copy), FetchFunction (copy), AsPromiseFunction (copy), FFlagBuildExperienceMonetizationFailureCausesModule (copy)
	return GetThumbnailUrlAsyncModule(p1):andThen(function(Result)
		-- upvalues: PromiseModule (upval), MonetizationFailureCausesModule (upval), FetchFunction (upval), AsPromiseFunction (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), p1 (copy)
		return if Result.status == "completed" then AsPromiseFunction((FetchFunction({
			method = "GET",
			analyticsKey = "build-experience.download-developer-product-image",
			responseEncoding = "protobuf",
			url = Result.imageUrl,
			decode = function(p2)
				return p2
			end
		}))):andThen(function(Buf)
			-- upvalues: PromiseModule (upval), FFlagBuildExperienceMonetizationFailureCausesModule (upval), MonetizationFailureCausesModule (upval), p1 (upval)
			return if buffer.len(Buf) > 5242880 then PromiseModule.reject(if FFlagBuildExperienceMonetizationFailureCausesModule then MonetizationFailureCausesModule.MESSAGES.imageTooLarge else "The generated image exceeds the 5 MB developer-product limit.") else {
				contentType = "image/png",
				content = buffer.tostring(Buf),
				fileName = `generated-{p1}.png`
			}
		end) else PromiseModule.reject(MonetizationFailureCausesModule.MESSAGES.imageInReview)
	end)
end