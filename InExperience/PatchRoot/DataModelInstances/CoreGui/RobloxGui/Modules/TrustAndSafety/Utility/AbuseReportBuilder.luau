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

local var6 = function(p0) --[[ line: 121 ]]
	local t = {}
	
	for i, v in ipairs(p0) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local var7 = function(p1) --[[ line: 129 ]]
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

local var8 = function(p2) --[[ line: 150 ]]
	-- upvalues: var6 (ref)
	local t = {}
	
	for i, v in pairs(p2) do
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
			convexHull = var6(v.convexHull)
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

local var9 = function(p3) --[[ line: 181 ]]
	-- upvalues: t (write), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var8 (ref), var7 (ref), var6 (ref)
	local var14 = false
	
	for i, v in pairs(t.identifiedAvatars) do
		var14 = true
		break
	end
	local var15 = false
	
	if getFFlagReportAnythingEnableAdReport() then
		for v, v_1 in pairs(t.identifiedAds) do
			var15 = true
			break
		end
	end
	if var14 then
		p3.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{ data = httpService:JSONEncode(var8(t.identifiedAvatars)) }
			}
		}
	end
	if t.avatarIDStats then
		p3.tags.AVATAR_ID_STATS = {
			valueList = { { data = httpService:JSONEncode(t.avatarIDStats) } }
		}
	end
	if var15 and getFFlagReportAnythingEnableAdReport() then
		p3.tags.IDENTIFIED_ADS = {
			valueList = { { data = httpService:JSONEncode(var7(t.identifiedAds)) } }
		}
	end
	if t.adIDStats and getFFlagReportAnythingEnableAdReport() then
		p3.tags.AD_ID_STATS = {
			valueList = { { data = httpService:JSONEncode(t.adIDStats) } }
		}
	end
	if #t.screenshotId > 0 then
		p3.tags.SCREENSHOT_ID = { valueList = { { data = t.screenshotId } } }
	end
	if #t.annotationPoints > 0 then
		p3.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{ data = httpService:JSONEncode(var6(t.annotationPoints)) }
			}
		}
	end
	p3.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(t.annotationOptionSeen) } }
	}
	p3.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(t.annotationPageSeen) } }
	}
end

local var10 = function() --[[ line: 470 ]]
	-- upvalues: t (write), getFFlagRAEnableCircleRegion (ref), getAvatarsForRegion (ref), getAvatarsForPoint (ref), getFFlagReportAnythingEnableAdReport (ref), getAdsForPoint (ref)
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in ipairs(t.annotationPoints) do
		local i_2
		local var20 = 1e999
		local var21 = nil
		
		for i_1, v_1 in pairs(if getFFlagRAEnableCircleRegion() then getAvatarsForRegion(t.identifiedAvatars, v, t.annotationCircleRadius, t.screenSizeWidth, t.screenSizeHeight) else getAvatarsForPoint(t.identifiedAvatars, v)) do
			i_2 = t.identifiedAvatars[i_1].distance
			
			if i_2 < var20 then
				var20 = i_2
				var21 = i_1
			end
		end
		local var22 = nil
		
		if getFFlagReportAnythingEnableAdReport() then
			local var23 = 1e999
			
			for i_2, v_2 in pairs(getAdsForPoint(t.identifiedAds, v)) do
				local distance = t.identifiedAds[i_2].distance
				
				if distance < var23 then
					var23 = distance
					var22 = i_2
				end
			end
		end
		if var21 ~= nil and not t_1[var21] then
			t_1[var21] = true
			t_3[#t_3 + 1] = t.identifiedAvatars[var21].player
		elseif getFFlagReportAnythingEnableAdReport() and var22 ~= nil and not t_2[var22] then
			t_2[var22] = true
			t_4[#t_4 + 1] = t.identifiedAds[var22]
		end
	end
	t.selectedAbusers = t_3
	t.selectedAds = t_4
end

return {
	setAnnotationCircleRadius = function(value) --[[ line: 537 ]]
		-- upvalues: t (write)
		t.annotationCircleRadius = value
	end,
	getAnnotationCircleRadius = function() --[[ line: 540 ]]
		-- upvalues: t (write)
		return t.annotationCircleRadius
	end,
	setAspectRatioDimensions = function(value, p4) --[[ line: 543 ]]
		-- upvalues: t (write)
		t.screenSizeWidth = value
		t.screenSizeHeight = p4
	end,
	setScreenshotId = function(value) --[[ line: 547 ]]
		-- upvalues: t (write)
		t.screenshotId = value
	end,
	setIdentifiedAds = function(value) --[[ line: 550 ]]
		-- upvalues: t (write)
		t.identifiedAds = value
	end,
	getIdentifiedAds = function() --[[ line: 553 ]]
		-- upvalues: t (write)
		return t.identifiedAds
	end,
	setIdentifiedAvatars = function(value) --[[ line: 556 ]]
		-- upvalues: t (write)
		t.identifiedAvatars = value
	end,
	getIdentifiedAvatars = function() --[[ line: 559 ]]
		-- upvalues: t (write)
		return t.identifiedAvatars
	end,
	setAvatarIDStats = function(value) --[[ line: 562 ]]
		-- upvalues: t (write)
		t.avatarIDStats = value
	end,
	setAdIDStats = function(value) --[[ line: 565 ]]
		-- upvalues: t (write)
		t.adIDStats = value
	end,
	setScreenshotContentId = function(value) --[[ line: 568 ]]
		-- upvalues: t (write)
		t.screenshotContentId = value
		t.annotationPoints = {}
		t.selectedAbusers = {}
	end,
	getScreenshotContentId = function() --[[ line: 575 ]]
		-- upvalues: t (write)
		return t.screenshotContentId
	end,
	setAnnotationPoints = function(value) --[[ line: 578 ]]
		-- upvalues: t (write), var10 (ref)
		t.annotationPoints = value
		t.annotationOptionSeen = true
		t.annotationPageSeen = true
		var10()
	end,
	getSelectedAbusers = function() --[[ line: 584 ]]
		-- upvalues: t (write)
		return t.selectedAbusers
	end,
	getSelectedAds = function() --[[ line: 587 ]]
		-- upvalues: t (write)
		return t.selectedAds
	end,
	clearAnnotationPoints = function() --[[ line: 590 ]]
		-- upvalues: t (write), getFFlagReportAnythingEnableAdReport (ref)
		t.annotationPoints = {}
		t.selectedAbusers = {}
		
		if getFFlagReportAnythingEnableAdReport() then
			t.selectedAds = {}
		end
		t.annotationOptionSeen = false
		t.annotationPageSeen = false
	end,
	getAnnotationPoints = function() --[[ line: 600 ]]
		-- upvalues: t (write)
		return t.annotationPoints
	end,
	setAnnotationOptionSeen = function(value) --[[ line: 603 ]]
		-- upvalues: t (write)
		t.annotationOptionSeen = value
	end,
	getAnnotationOptionSeen = function() --[[ line: 606 ]]
		-- upvalues: t (write)
		return t.annotationOptionSeen
	end,
	setAnnotationPageSeen = function(value) --[[ line: 609 ]]
		-- upvalues: t (write)
		t.annotationPageSeen = value
	end,
	getAnnotationPageSeen = function() --[[ line: 612 ]]
		-- upvalues: t (write)
		return t.annotationPageSeen
	end,
	buildExperienceReportRequest = function(p5) --[[ line: 270 ]]
		-- upvalues: t_1 (ref), var9 (ref), t (write), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var7 (ref)
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
		var9(t_2)
		
		if #t.selectedAds > 0 and getFFlagReportAnythingEnableAdReport() then
			t_2.tags.REPORT_TARGET_ADS = {
				valueList = { { data = httpService:JSONEncode(var7(t.selectedAds)) } }
			}
		end
		return httpService:JSONEncode(t_2)
	end,
	buildOtherReportRequest = function(p6) --[[ line: 343 ]]
		-- upvalues: t_1 (ref), var9 (ref), t (write), getFFlagGetHumanoidDescription (ref), getHumanoidDescription (ref), httpService (ref)
		local t_2 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p6.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p6.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p6.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p6.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p6.variant or t_1.Variant.Unknown } }
				}
			}
		}
		var9(t_2)
		
		if #t.selectedAbusers > 0 then
			local var26 = tostring(t.selectedAbusers[1].UserId)
			local t_3 = {}
			
			for i, v in ipairs(t.selectedAbusers) do
				t_3[#t_3 + 1] = tostring(v.UserId)
			end
			if getFFlagGetHumanoidDescription() then
				local var28, var29 = getHumanoidDescription(t.selectedAbusers[1].UserId)
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var28) } } }
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var29 } } }
				local t_4 = {}
				
				for i_1, v_1 in ipairs(t.selectedAbusers) do
					local var31, var32 = getHumanoidDescription(v_1.UserId)
					t_4[#t_4 + 1] = { humanoidDescription = var31, outputMessage = var32 }
				end
				t_2.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = { valueList = { { data = httpService:JSONEncode(t_4) } } }
			end
			t_2.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(var26) } } }
			t_2.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = httpService:JSONEncode(t_3) } } }
		elseif p6.formSelectedAbuserUserId then
			if getFFlagGetHumanoidDescription() then
				local var33, var34 = getHumanoidDescription(p6.formSelectedAbuserUserId)
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var33) } } }
				t_2.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var34 } } }
			end
			t_2.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p6.formSelectedAbuserUserId) } }
			}
		end
		return httpService:JSONEncode(t_2)
	end,
	clear = function() --[[ line: 617 ]]
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
	getAnalyticsParameters = function() --[[ line: 635 ]]
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