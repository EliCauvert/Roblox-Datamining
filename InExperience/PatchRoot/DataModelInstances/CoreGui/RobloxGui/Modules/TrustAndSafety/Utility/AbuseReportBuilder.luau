local corePackagesService = game:GetService("CorePackages")
local tnSAvatarIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAvatarIdentification)
local tnSAdIdentificationModule = require(corePackagesService.Workspace.Packages.TnSAdIdentification)
local httpService = game:GetService("HttpService")
local getAvatarsForPoint = tnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForPoint
local getAvatarsForRegion = tnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForRegion
local getAdsForPoint = tnSAdIdentificationModule.AdIdentification.getAdsForPoint
local getFFlagReportAnythingEnableAdReport = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport
local getFFlagGetHumanoidDescription = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription
local getFFlagRAEnableCircleRegion = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion
local getHumanoidDescription = require(script.Parent.GetHumanoidDescription).getHumanoidDescription
local t = {
	annotationCircleRadius = 0,
	screenSizeWidth = 0,
	screenSizeHeight = 0,
	screenshotId = "",
	avatarIDStats = nil,
	adIDStats = nil,
	screenshotContentId = "",
	annotationOptionSeen = false,
	annotationPageSeen = false,
	identifiedAvatars = {},
	identifiedAds = {},
	annotationPoints = {},
	selectedAbusers = {},
	selectedAds = {}
}
local t_1 = {
	Variant = {
		CS = "ra/cs",
		Sampling = "ra/sampling",
		E1 = "ra/e1",
		E2 = "ra/e2",
		E3 = "ra/e3",
		Unknown = "ra/unknown"
	}
}

local var1 = function(p1)
	local t = {}
	
	for i, v in ipairs(p1) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local var2 = function(p2)
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

local var3 = function(p3)
	-- upvalues: var1 (ref)
	local t = {}
	
	for i, v in pairs(p3) do
		t[#t + 1] = {
			userId = tostring(i),
			distance = v.distance,
			boundingBox = {
				minX = v.boundingBox.min.X,
				minY = v.boundingBox.min.Y,
				maxX = v.boundingBox.max.X,
				maxY = v.boundingBox.max.Y
			},
			hitRate = v.hitRate,
			convexHull = var1(v.convexHull)
		}
		
		if v.pointProcessingStats ~= nil then
			t[#t].pointProcessingStats = {
				if v.pointProcessingStats.wasSkipped then 1 else 0,
				v.pointProcessingStats.total,
				v.pointProcessingStats.offScreenDiscardCount,
				v.pointProcessingStats.tooCloseDiscardCount
			}
		end
	end
	return t
end

local var4 = function(p4)
	-- upvalues: t (write), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var3 (ref), var2 (ref), var1 (ref)
	local var5 = false
	
	for i, v in pairs(t.identifiedAvatars) do
		var5 = true
		break
	end
	local var6 = false
	
	if getFFlagReportAnythingEnableAdReport() then
		for v, v_1 in pairs(t.identifiedAds) do
			var6 = true
			break
		end
	end
	if var5 then
		p4.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{ data = httpService:JSONEncode(var3(t.identifiedAvatars)) }
			}
		}
	end
	if t.avatarIDStats then
		p4.tags.AVATAR_ID_STATS = {
			valueList = { { data = httpService:JSONEncode(t.avatarIDStats) } }
		}
	end
	if var6 and getFFlagReportAnythingEnableAdReport() then
		p4.tags.IDENTIFIED_ADS = {
			valueList = { { data = httpService:JSONEncode(var2(t.identifiedAds)) } }
		}
	end
	if t.adIDStats and getFFlagReportAnythingEnableAdReport() then
		p4.tags.AD_ID_STATS = {
			valueList = { { data = httpService:JSONEncode(t.adIDStats) } }
		}
	end
	if #t.screenshotId > 0 then
		p4.tags.SCREENSHOT_ID = { valueList = { { data = t.screenshotId } } }
	end
	if #t.annotationPoints > 0 then
		p4.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{ data = httpService:JSONEncode(var1(t.annotationPoints)) }
			}
		}
	end
	p4.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(t.annotationOptionSeen) } }
	}
	p4.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(t.annotationPageSeen) } }
	}
end

local var7 = function()
	-- upvalues: t (write), getFFlagRAEnableCircleRegion (ref), getAvatarsForRegion (ref), getAvatarsForPoint (ref), getFFlagReportAnythingEnableAdReport (ref), getAdsForPoint (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in ipairs(t.annotationPoints) do
		local i_2
		local var8 = 1e999
		local var9 = nil
		
		for i_1, v_1 in pairs(if getFFlagRAEnableCircleRegion() then getAvatarsForRegion(t.identifiedAvatars, v, t.annotationCircleRadius, t.screenSizeWidth, t.screenSizeHeight) else getAvatarsForPoint(t.identifiedAvatars, v)) do
			i_2 = t.identifiedAvatars[i_1].distance
			
			if i_2 < var8 then
				var8 = i_2
				var9 = i_1
			end
		end
		local var10 = nil
		
		if getFFlagReportAnythingEnableAdReport() then
			local var11 = 1e999
			
			for i_2, v_2 in pairs(getAdsForPoint(t.identifiedAds, v)) do
				local distance = t.identifiedAds[i_2].distance
				
				if distance < var11 then
					var11 = distance
					var10 = i_2
				end
			end
		end
		if var9 ~= nil and not t_1[var9] then
			t_1[var9] = true
			t_3[#t_3 + 1] = t.identifiedAvatars[var9].player
		elseif getFFlagReportAnythingEnableAdReport() and var10 ~= nil and not t_2[var10] then
			t_2[var10] = true
			t_4[#t_4 + 1] = t.identifiedAds[var10]
		end
	end
	t.selectedAbusers = t_3
	t.selectedAds = t_4
end

return {
	setAnnotationCircleRadius = function(value)
		-- upvalues: t (write)
		t.annotationCircleRadius = value
	end,
	getAnnotationCircleRadius = function()
		-- upvalues: t (write)
		return t.annotationCircleRadius
	end,
	setAspectRatioDimensions = function(value, p5)
		-- upvalues: t (write)
		t.screenSizeWidth = value
		t.screenSizeHeight = p5
	end,
	setScreenshotId = function(value)
		-- upvalues: t (write)
		t.screenshotId = value
	end,
	setIdentifiedAds = function(value)
		-- upvalues: t (write)
		t.identifiedAds = value
	end,
	getIdentifiedAds = function()
		-- upvalues: t (write)
		return t.identifiedAds
	end,
	setIdentifiedAvatars = function(value)
		-- upvalues: t (write)
		t.identifiedAvatars = value
	end,
	getIdentifiedAvatars = function()
		-- upvalues: t (write)
		return t.identifiedAvatars
	end,
	setAvatarIDStats = function(value)
		-- upvalues: t (write)
		t.avatarIDStats = value
	end,
	setAdIDStats = function(value)
		-- upvalues: t (write)
		t.adIDStats = value
	end,
	setScreenshotContentId = function(value)
		-- upvalues: t (write)
		t.screenshotContentId = value
		t.annotationPoints = {}
		t.selectedAbusers = {}
	end,
	getScreenshotContentId = function()
		-- upvalues: t (write)
		return t.screenshotContentId
	end,
	setAnnotationPoints = function(value)
		-- upvalues: t (write), var7 (ref)
		t.annotationPoints = value
		t.annotationOptionSeen = true
		t.annotationPageSeen = true
		var7()
	end,
	getSelectedAbusers = function()
		-- upvalues: t (write)
		return t.selectedAbusers
	end,
	getSelectedAds = function()
		-- upvalues: t (write)
		return t.selectedAds
	end,
	clearAnnotationPoints = function()
		-- upvalues: t (write), getFFlagReportAnythingEnableAdReport (ref)
		t.annotationPoints = {}
		t.selectedAbusers = {}
		
		if getFFlagReportAnythingEnableAdReport() then
			t.selectedAds = {}
		end
		t.annotationOptionSeen = false
		t.annotationPageSeen = false
	end,
	getAnnotationPoints = function()
		-- upvalues: t (write)
		return t.annotationPoints
	end,
	setAnnotationOptionSeen = function(value)
		-- upvalues: t (write)
		t.annotationOptionSeen = value
	end,
	getAnnotationOptionSeen = function()
		-- upvalues: t (write)
		return t.annotationOptionSeen
	end,
	setAnnotationPageSeen = function(value)
		-- upvalues: t (write)
		t.annotationPageSeen = value
	end,
	getAnnotationPageSeen = function()
		-- upvalues: t (write)
		return t.annotationPageSeen
	end,
	buildExperienceReportRequest = function(p5)
		-- upvalues: t_1 (ref), var4 (ref), t (write), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var2 (ref)
		local t_2 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p5.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p5.abuseReason } } },
				PLACE_ID = { valueList = { { data = tostring(p5.placeId) } } },
				REPORTER_COMMENT = { valueList = { { data = p5.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "place" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p5.menuEntryPoint } } },
				VARIANT = { valueList = { { data = p5.variant or t_1.Variant.CS } } }
			}
		}
		var4(t_2)
		
		if #t.selectedAds > 0 and getFFlagReportAnythingEnableAdReport() then
			t_2.tags.REPORT_TARGET_ADS = {
				valueList = { { data = httpService:JSONEncode(var2(t.selectedAds)) } }
			}
		end
		return httpService:JSONEncode(t_2)
	end,
	buildOtherReportRequest = function(p5)
		-- upvalues: t_1 (ref), var4 (ref), t (write), getFFlagGetHumanoidDescription (ref), getHumanoidDescription (ref), httpService (ref)
		local t_2 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p5.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p5.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p5.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p5.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p5.variant or t_1.Variant.Unknown } }
				}
			}
		}
		var4(t_2)
		
		if #t.selectedAbusers > 0 then
			local var12 = tostring(t.selectedAbusers[1].UserId)
			local t_3 = {}
			
			for i, v in ipairs(t.selectedAbusers) do
				t_3[#t_3 + 1] = tostring(v.UserId)
			end
			if getFFlagGetHumanoidDescription() then
				local var13, var14 = getHumanoidDescription(t.selectedAbusers[1].UserId)
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var13) } } }
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var14 } } }
				local t_4 = {}
				
				for i_1, v_1 in ipairs(t.selectedAbusers) do
					local var15, var16 = getHumanoidDescription(v_1.UserId)
					t_4[#t_4 + 1] = { humanoidDescription = var15, outputMessage = var16 }
				end
				t_2.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = { valueList = { { data = httpService:JSONEncode(t_4) } } }
			end
			t_2.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(var12) } } }
			t_2.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = httpService:JSONEncode(t_3) } } }
		elseif p5.formSelectedAbuserUserId then
			if getFFlagGetHumanoidDescription() then
				local var17, var18 = getHumanoidDescription(p5.formSelectedAbuserUserId)
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var17) } } }
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var18 } } }
			end
			t_2.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p5.formSelectedAbuserUserId) } }
			}
		end
		return httpService:JSONEncode(t_2)
	end,
	clear = function()
		-- upvalues: t (write)
		t = {
			annotationCircleRadius = 0,
			screenSizeWidth = 0,
			screenSizeHeight = 0,
			screenshotId = "",
			avatarIDStats = nil,
			adIDStats = nil,
			screenshotContentId = "",
			annotationOptionSeen = false,
			annotationPageSeen = false,
			identifiedAvatars = {},
			identifiedAds = {},
			annotationPoints = {},
			selectedAbusers = {},
			selectedAds = {}
		}
	end,
	getAnalyticsParameters = function()
		-- upvalues: t (write)
		return {
			finalAnnotationOptionSeen = t.annotationOptionSeen,
			finalAnnotationPageSeen = t.annotationPageSeen,
			finalAnnotationCount = #t.annotationPoints,
			finalAnnotatedAvatarsCount = #t.selectedAbusers
		}
	end,
	Constants = t_1
}