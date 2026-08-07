-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:38 2026 Pacific Standard Time.

local httpService = game:GetService("HttpService")
local APIUtilModule = require(script:FindFirstAncestor("UGCValidation").util.APIUtil)
local t = {
	[0] = "Unknown",
	[1] = "InvalidTargetType",
	[2] = "FailedToFetchPublishingFee",
	[3] = "ServiceUnavailable",
	[4] = "InvalidArgument",
	[5] = "NotFound",
	[6] = "FailedToGetCollectibleItemId",
	[7] = "FailedToGetCommissionRates",
	[8] = "NullParameterRequest",
	[9] = "PublishLimitExceeded",
	[10] = "AssetIsPendingValidation",
	[11] = "AssetContainsInvalidContent",
	[12] = "UserDoesNotHavePermissionsForGroupAsset",
	[13] = "AssetTypeCannotBeReleased",
	[14] = "AssetIsPendingReview",
	[15] = "AssetIsModerated",
	[16] = "ItemIsReleased",
	[17] = "UserDoesNotHavePermissionToRelease",
	[18] = "UserDoesNotOwnTheItem",
	[19] = "ItemPriceTooLow",
	[20] = "ItemPriceTooHigh",
	[21] = "InvalidAssetId",
	[22] = "InvalidAgent",
	[23] = "NoExperiencesListed",
	[24] = "NameIsModerated",
	[25] = "DescriptionIsModerated",
	[26] = "TextIsModerated",
	[27] = "FailedToFilterText",
	[28] = "AssetAlreadyReleasedAsUnlimited",
	[29] = "AssetInDelayedRelease",
	[30] = "InvalidIdempotencyToken",
	[31] = "InvalidAgreedPublishingFee",
	[32] = "GatewayCouldNotPublishItem",
	[33] = "GroupAssetNotSupported",
	[34] = "CouldNotFindInitialUserAsset",
	[35] = "InvalidQuantity",
	[36] = "SaleLocationCurrentlyNotSupported",
	[37] = "InvalidCollectibleItemId",
	[38] = "FailedToGetCollectibleItemInformation",
	[39] = "GroupItemsNotSupported",
	[40] = "FailedToUpdateCollectibleItem",
	[41] = "PublishQuotaUnavailable",
	[42] = "FailedToFetchMarketplaceFee",
	[43] = "QuantityLimitCurrentlyNotSupported",
	[44] = "InvalidQuantityLimit",
	[45] = "ExactCopyOfAssetHasBeenPublished",
	[46] = "ItemIsInBundle",
	[47] = "ResaleRestrictionCurrentlyNotSupported",
	[48] = "InvalidResaleRestriction",
	[49] = "FailedToUpdateCollectibleDescription",
	[50] = "InvalidBundleId",
	[51] = "BundleTypeCannotBeReleased",
	[52] = "BundleIsModerated",
	[53] = "BundleAlreadyReleasedAsUnlimited",
	[54] = "BundlesGatewayUnexpectedErrorCode",
	[55] = "CissUnexpectedException",
	[56] = "PublishingGatewayUnexpectedException",
	[57] = "NonLimitedPublishingNotSupported",
	[58] = "InvalidPublishingType",
	[59] = "InvalidPriceOffset",
	[60] = "InvalidMinimumPrice",
	[61] = "InvalidSaleStatus",
	[62] = "InvalidPriceConfiguration",
	[63] = "FailedToGetPriceConfiguration",
	[64] = "CannotBeFree",
	[65] = "UnexpectedPlaceIds",
	[66] = "MissingAuthenticatedUser",
	[67] = "InvalidCreatorType",
	[68] = "PermissionProviderNotEnabled",
	[69] = "InvalidGroupId",
	[70] = "InsufficientRobux",
	[71] = "ItemNotFound",
	[72] = "ItemIsModerated",
	[73] = "ItemModerationUnknown",
	[74] = "InvalidItemType",
	[101] = "CalendarQuotaExceeded",
	[102] = "CalendarQuotaUnavailable",
	[103] = "PublishingGatewayMissingReason",
	[104] = "PublishingGatewayUnexpectedReason",
	[105] = "PublishingGatewayUnexpectedAccessStatus",
	[106] = "MissingIdVerification",
	[107] = "CreationAccessBlocked",
	[108] = "MissingPremiumSubscriptionTier",
	[109] = "GroupOwnerMissingPremiumSubscriptionTier",
	[110] = "MissingCicRoleset"
}

return function(p0) --[[ line: 193 | named "canUploadBundlesAsync" ]]
	-- upvalues: APIUtilModule (ref), httpService (ref), t (ref)
	local var3, var4 = APIUtilModule.requestAndRetryGet(`https://itemconfiguration.{APIUtilModule.getBaseDomain()}/v1/collectibles/check-item-upload-access?targetType=1&groupId={p0 or ""}`)
	
	if not var3 then
		return { type = "error", message = var4 }
	end
	local var5 = httpService:JSONDecode(var4)
	
	if var5.isAllowed then
		return { type = "allowed" }
	end
	assert(var5.isAllowed == false, "Luau")
	
	return {
		type = "notAllowed",
		denyReason = t[var5.deniedReason] or var5.deniedReason
	}
end