local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local promiseModule = require(parent.Parent.Promise)
local APIUtilModule = require(parent.util.APIUtil)

return {
	fetch = function() --[[ line: 42 ]]
		-- upvalues: promiseModule (ref), httpService (ref), httpRbxApiService (ref), APIUtilModule (ref)
		return promiseModule.try(function() --[[ line: 43 ]]
			-- upvalues: httpService (copy), httpRbxApiService (copy), APIUtilModule (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(`https://itemconfiguration.{APIUtilModule.getBaseDomain()}/v1/bundles/metadata`))
		end)
	end,
	mock = function() --[[ line: 50 ]]
		return {
			isBundlesControllerEnabled = true,
			isBundlesCreationEnabled = true,
			isBundlesPublishingEnabled = true,
			allowedBundleTypeSettings = {
				Body = {
					marketplaceFeePercentage = 30,
					allowedAssetTypeSettings = {
						DynamicHead = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						EyebrowAccessory = {
							minimumQuantity = 0,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						EyelashAccessory = {
							minimumQuantity = 0,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						HairAccessory = {
							minimumQuantity = 0,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						LeftArm = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						LeftLeg = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						RightArm = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						RightLeg = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						Torso = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						}
					},
					allowedPriceRange = { minimumPrice = 0, maximumPrice = 10000 }
				},
				DynamicHead = {
					marketplaceFeePercentage = 30,
					allowedAssetTypeSettings = {
						DynamicHead = {
							minimumQuantity = 1,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						EyebrowAccessory = {
							minimumQuantity = 0,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						},
						EyelashAccessory = {
							minimumQuantity = 0,
							maximumQuantity = 1,
							isEligibleForUpload = true,
							allowedFileExtensions = { ".rbxm" }
						}
					},
					allowedPriceRange = { minimumPrice = 0, maximumPrice = 10000 }
				}
			}
		}
	end
}