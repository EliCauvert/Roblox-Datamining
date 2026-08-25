local httpService = game:GetService("HttpService")
local getFFlagReportAnythingEnableAdReport = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.SharedFlags).GetFFlagReportAnythingEnableAdReport

local function transformVectorArray(p0)
	local t = {}
	
	for i, v in ipairs(p0) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local function transformIdentifiedAds(p1)
	local t = {}
	
	for i, v in pairs(p1) do
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

local function transformIdentifiedAvatars(p2)
	-- upvalues: transformVectorArray (ref)
	local t = {}
	
	for i, v in pairs(p2) do
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

local function _(p3)
	for i in pairs(p3.identifiedAvatars) do
		return true
	end
	return false
end

local _ = function(p4)
	for i in pairs(p4.identifiedAds) do
		return true
	end
	return false
end

return {
	appendReportAnythingTags = function(p5, p6)
		-- upvalues: httpService (ref), transformIdentifiedAvatars (ref), getFFlagReportAnythingEnableAdReport (ref), transformIdentifiedAds (ref)
		if not p6 then
			return p5
		end
		local identificationResults = p6.identificationResults
		
		for i in pairs(identificationResults.identifiedAvatars) do
			var8 = true
		end
		var8 = false
		if var8 then
			p5.IDENTIFIED_AVATARS = {
				valueList = {
					{
						data = httpService:JSONEncode(transformIdentifiedAvatars(identificationResults.identifiedAvatars))
					}
				}
			}
		end
		if identificationResults.avatarIDStats then
			p5.AVATAR_ID_STATS = {
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
				p5.IDENTIFIED_ADS = {
					valueList = {
						{
							data = httpService:JSONEncode(transformIdentifiedAds(identificationResults.identifiedAds))
						}
					}
				}
			end
			if identificationResults.adIDStats then
				p5.AD_ID_STATS = {
					valueList = {
						{
							data = httpService:JSONEncode(identificationResults.adIDStats)
						}
					}
				}
			end
		end
		if #p6.screenshotId > 0 then
			p5.SCREENSHOT_ID = { valueList = { { data = p6.screenshotId } } }
		end
		return p5
	end
}