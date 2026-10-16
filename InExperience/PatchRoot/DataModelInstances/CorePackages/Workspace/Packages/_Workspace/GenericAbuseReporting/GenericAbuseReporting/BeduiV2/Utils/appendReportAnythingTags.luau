local HttpService = game:GetService("HttpService")
local GetFFlagReportAnythingEnableAdReportFunction = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags).GetFFlagReportAnythingEnableAdReport

local function transformVectorArray(ConvexHull) --[[ Line: 70 ]]
	local t = {}
	
	for _, value in ipairs(ConvexHull) do
		t[#t + 1] = { value.X, value.Y }
	end
	return t
end

local function transformIdentifiedAds(IdentifiedAds) --[[ Line: 78 ]]
	local t = {}
	
	for _, identifiedAd in pairs(IdentifiedAds) do
		t[#t + 1] = {
			assetId = identifiedAd.assetId,
			distance = identifiedAd.distance,
			boundingBox = {
				minX = identifiedAd.boundingBox.min.X,
				minY = identifiedAd.boundingBox.min.Y,
				maxX = identifiedAd.boundingBox.max.X,
				maxY = identifiedAd.boundingBox.max.Y
			},
			adUnitName = identifiedAd.adUnitName,
			encryptedAdTrackingData = identifiedAd.encryptedAdTrackingData,
			encryptionMetadata = identifiedAd.encryptionMetadata
		}
	end
	return t
end

local function transformIdentifiedAvatars(IdentifiedAvatars) --[[ Line: 98 ]]
	-- upvalues: transformVectorArray (copy)
	local t = {}
	
	for i, identifiedAvatar in pairs(IdentifiedAvatars) do
		local config = {
			userId = tostring(i),
			distance = identifiedAvatar.distance,
			boundingBox = {
				minX = identifiedAvatar.boundingBox.min.X,
				minY = identifiedAvatar.boundingBox.min.Y,
				maxX = identifiedAvatar.boundingBox.max.X,
				maxY = identifiedAvatar.boundingBox.max.Y
			},
			hitRate = identifiedAvatar.hitRate,
			convexHull = transformVectorArray(identifiedAvatar.convexHull)
		}
		
		if identifiedAvatar.pointProcessingStats ~= nil then
			config.pointProcessingStats = {
				if identifiedAvatar.pointProcessingStats.wasSkipped then 1 else 0,
				identifiedAvatar.pointProcessingStats.total,
				identifiedAvatar.pointProcessingStats.offScreenDiscardCount,
				identifiedAvatar.pointProcessingStats.tooCloseDiscardCount
			}
		end
		t[#t + 1] = config
	end
	return t
end

local function _(p1): boolean --[[ Line: 130 | Named "hasIdentifiedAvatars" ]]
	for _ in pairs(p1.identifiedAvatars) do
		return true
	end
	return false
end

local _ = function(p2): boolean --[[ Line: 137 | Named "hasIdentifiedAds" ]]
	for _ in pairs(p2.identifiedAds) do
		return true
	end
	return false
end

return {
	appendReportAnythingTags = function(p3, p4) --[[ Line: 144 ]]
		-- upvalues: HttpService (copy), transformIdentifiedAvatars (copy), GetFFlagReportAnythingEnableAdReportFunction (copy), transformIdentifiedAds (copy)
		if not p4 then
			return p3
		end
		local IdentificationResults = p4.identificationResults
		local Flag = false
		
		for _ in pairs(IdentificationResults.identifiedAvatars) do
			Flag = true
			break
		end
		if Flag then
			p3.IDENTIFIED_AVATARS = {
				valueList = {
					{
						data = HttpService:JSONEncode((transformIdentifiedAvatars(IdentificationResults.identifiedAvatars)))
					}
				}
			}
		end
		if IdentificationResults.avatarIDStats then
			p3.AVATAR_ID_STATS = {
				valueList = {
					{
						data = HttpService:JSONEncode(IdentificationResults.avatarIDStats)
					}
				}
			}
		end
		if GetFFlagReportAnythingEnableAdReportFunction() then
			local Flag1 = false
			
			for _ in pairs(IdentificationResults.identifiedAds) do
				Flag1 = true
				break
			end
			if Flag1 then
				p3.IDENTIFIED_ADS = {
					valueList = {
						{
							data = HttpService:JSONEncode((transformIdentifiedAds(IdentificationResults.identifiedAds)))
						}
					}
				}
			end
			if IdentificationResults.adIDStats then
				p3.AD_ID_STATS = {
					valueList = {
						{
							data = HttpService:JSONEncode(IdentificationResults.adIDStats)
						}
					}
				}
			end
		end
		if #p4.screenshotId > 0 then
			p3.SCREENSHOT_ID = { valueList = { { data = p4.screenshotId } } }
		end
		return p3
	end
}