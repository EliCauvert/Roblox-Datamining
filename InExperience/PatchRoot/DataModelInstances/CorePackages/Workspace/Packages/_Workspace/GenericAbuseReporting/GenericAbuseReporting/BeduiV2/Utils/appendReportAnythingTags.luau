local httpService = game:GetService("HttpService")
local getFFlagReportAnythingEnableAdReport = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags).GetFFlagReportAnythingEnableAdReport

local function transformVectorArray(p1)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local function transformIdentifiedAds(p2)
	local t = {}
	
	for i, v in pairs(p2) do
		t[#t + 1] = {
			assetId = v.assetId,
			distance = v.distance,
			boundingBox = {
				minX = v.boundingBox.min.X,
				minY = v.boundingBox.min.Y,
				maxX = v.boundingBox.max.X,
				maxY = v.boundingBox.max.Y
			},
			adUnitName = v.adUnitName,
			encryptedAdTrackingData = v.encryptedAdTrackingData,
			encryptionMetadata = v.encryptionMetadata
		}
	end
	return t
end

local function transformIdentifiedAvatars(p3)
	-- upvalues: transformVectorArray (ref)
	local t = {}
	
	for i, v in pairs(p3) do
		local t_1 = {
			userId = tostring(i),
			distance = v.distance,
			boundingBox = {
				minX = v.boundingBox.min.X,
				minY = v.boundingBox.min.Y,
				maxX = v.boundingBox.max.X,
				maxY = v.boundingBox.max.Y
			},
			hitRate = v.hitRate,
			convexHull = transformVectorArray(v.convexHull)
		}
		
		if v.pointProcessingStats ~= nil then
			t_1.pointProcessingStats = {
				if v.pointProcessingStats.wasSkipped then 1 else 0,
				v.pointProcessingStats.total,
				v.pointProcessingStats.offScreenDiscardCount,
				v.pointProcessingStats.tooCloseDiscardCount
			}
		end
		t[#t + 1] = t_1
	end
	return t
end

local function _(p4)
	for i in pairs(p4.identifiedAvatars) do
		return true
	end
	return false
end

local _ = function(p5)
	for i in pairs(p5.identifiedAds) do
		return true
	end
	return false
end

return {
	appendReportAnythingTags = function(p6, p7)
		-- upvalues: httpService (ref), transformIdentifiedAvatars (ref), getFFlagReportAnythingEnableAdReport (ref), transformIdentifiedAds (ref)
		if not p7 then
			return p6
		end
		local identificationResults = p7.identificationResults
		
		for i in pairs(identificationResults.identifiedAvatars) do
			var8 = true
		end
		var8 = false
		if var8 then
			p6.IDENTIFIED_AVATARS = {
				valueList = {
					{
						data = httpService:JSONEncode(transformIdentifiedAvatars(identificationResults.identifiedAvatars))
					}
				}
			}
		end
		if identificationResults.avatarIDStats then
			p6.AVATAR_ID_STATS = {
				valueList = {
					{
						data = httpService:JSONEncode(identificationResults.avatarIDStats)
					}
				}
			}
		end
		if getFFlagReportAnythingEnableAdReport() then
			for i in pairs(identificationResults.identifiedAds) do
				var9 = true
			end
			var9 = false
			if var9 then
				p6.IDENTIFIED_ADS = {
					valueList = {
						{
							data = httpService:JSONEncode(transformIdentifiedAds(identificationResults.identifiedAds))
						}
					}
				}
			end
			if identificationResults.adIDStats then
				p6.AD_ID_STATS = {
					valueList = {
						{
							data = httpService:JSONEncode(identificationResults.adIDStats)
						}
					}
				}
			end
		end
		if #p7.screenshotId > 0 then
			p6.SCREENSHOT_ID = { valueList = { { data = p7.screenshotId } } }
		end
		return p6
	end
}