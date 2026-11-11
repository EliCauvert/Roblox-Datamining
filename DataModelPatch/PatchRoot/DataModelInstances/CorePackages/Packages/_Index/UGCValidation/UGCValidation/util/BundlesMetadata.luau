local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local PromiseModule = require(Parent.Parent.Promise)
local APIUtilModule = require(Parent.util.APIUtil)

return {
	fetch = function()
		-- upvalues: PromiseModule (copy), HttpService (copy), HttpRbxApiService (copy), APIUtilModule (copy)
		return PromiseModule.try(function()
			-- upvalues: HttpService (upval), HttpRbxApiService (upval), APIUtilModule (upval)
			return HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl(`https://itemconfiguration.{APIUtilModule.getBaseDomain()}/v1/bundles/metadata`))
		end)
	end,
	mock = function()
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