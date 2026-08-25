local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
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
local getFFlagGetHumanoidDescriptionUpdatesV2E = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local getHumanoidDescription = require(abuseReportMenu.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription
local _ = require(abuseReportMenu.Components.Types)
local _ = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local t = {
	Variant = {
		CS = "ra/cs",
		Sampling = "ra/sampling",
		E1 = "ra/e1",
		E2 = "ra/e2",
		E3 = "ra/e3",
		NM = "ra/nm",
		Unknown = "ra/unknown"
	}
}

local var6 = function(p0)
	local t = {}
	
	for i, v in ipairs(p0) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local var7 = function(p1)
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

local var8 = function(p2)
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

local _ = function(p3, p4)
	-- upvalues: getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescription (ref)
	local _ = nil
	local _ = nil
	
	if not getFFlagGetHumanoidDescriptionUpdatesV2E() then
		local var17, var18 = getHumanoidDescription(p3)
		
		return var17, var18
	end
	local var14 = p4.identificationResults.identifiedAvatars[p3]
	
	if var14 and var14.humanoidDescription and var14.humanoidDescriptionStatus == "OK" then
		return var14.humanoidDescription, var14.humanoidDescriptionStatus
	end
	local var15, var16 = getHumanoidDescription(p3)
	
	return var15, var16
end

local var9 = function(p5)
	-- upvalues: getFFlagRAEnableCircleRegion (ref), getAvatarsForRegion (ref), getAvatarsForPoint (ref), getFFlagReportAnythingEnableAdReport (ref), getAdsForPoint (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in ipairs(p5.annotationPoints) do
		local i_2
		local var23 = 1e999
		local var24 = nil
		
		for i_1, v_1 in pairs(if getFFlagRAEnableCircleRegion() then getAvatarsForRegion(p5.identificationResults.identifiedAvatars, v, p5.annotationCircleRadius, p5.annotationAreaWidth, p5.annotationAreaHeight) else getAvatarsForPoint(p5.identificationResults.identifiedAvatars, v)) do
			i_2 = p5.identificationResults.identifiedAvatars[i_1].distance
			
			if i_2 < var23 then
				var23 = i_2
				var24 = i_1
			end
		end
		local var25 = nil
		
		if getFFlagReportAnythingEnableAdReport() then
			local var26 = 1e999
			
			for i_2, v_2 in pairs(getAdsForPoint(p5.identificationResults.identifiedAds, v)) do
				local distance = p5.identificationResults.identifiedAds[i_2].distance
				
				if distance < var26 then
					var26 = distance
					var25 = i_2
				end
			end
		end
		if var24 ~= nil and not t[var24] then
			t[var24] = true
			t_2[#t_2 + 1] = p5.identificationResults.identifiedAvatars[var24].player
		elseif getFFlagReportAnythingEnableAdReport() and var25 ~= nil and not t_1[var25] then
			t_1[var25] = true
			t_3[#t_3 + 1] = p5.identificationResults.identifiedAds[var25]
		end
	end
	return t_2, t_3
end

local var10 = function(p6, _, p7)
	-- upvalues: getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var8 (ref), var7 (ref), var6 (ref)
	local var27 = false
	
	for i, v in pairs(p6.identificationResults.identifiedAvatars) do
		var27 = true
		break
	end
	local var28 = false
	
	if getFFlagReportAnythingEnableAdReport() then
		for v, v_1 in pairs(p6.identificationResults.identifiedAds) do
			var28 = true
			break
		end
	end
	if var27 then
		p7.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{
					data = httpService:JSONEncode(var8(p6.identificationResults.identifiedAvatars))
				}
			}
		}
	end
	if p6.identificationResults.avatarIDStats then
		p7.tags.AVATAR_ID_STATS = {
			valueList = {
				{
					data = httpService:JSONEncode(p6.identificationResults.avatarIDStats)
				}
			}
		}
	end
	if var28 and getFFlagReportAnythingEnableAdReport() then
		p7.tags.IDENTIFIED_ADS = {
			valueList = {
				{
					data = httpService:JSONEncode(var7(p6.identificationResults.identifiedAds))
				}
			}
		}
	end
	if p6.identificationResults.adIDStats and getFFlagReportAnythingEnableAdReport() then
		p7.tags.AD_ID_STATS = {
			valueList = {
				{
					data = httpService:JSONEncode(p6.identificationResults.adIDStats)
				}
			}
		}
	end
	if #p6.screenshotId > 0 then
		p7.tags.SCREENSHOT_ID = { valueList = { { data = p6.screenshotId } } }
	end
	if #p6.annotationPoints > 0 then
		p7.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{ data = httpService:JSONEncode(var6(p6.annotationPoints)) }
			}
		}
	end
	p7.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(p6.annotationOptionSeen) } }
	}
	p7.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(p6.annotationPageSeen) } }
	}
end

return {
	buildExperienceReportRequest = function(p8, p9, p10)
		-- upvalues: t (ref), var9 (ref), var10 (ref), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var7 (ref)
		local t_1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p8.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p8.abuseReason } } },
				PLACE_ID = { valueList = { { data = tostring(p8.placeId) } } },
				REPORTER_COMMENT = { valueList = { { data = p8.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "place" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p8.menuEntryPoint } } },
				VARIANT = { valueList = { { data = p8.variant or t.Variant.CS } } }
			}
		}
		local _, var30 = var9(p9)
		var10(p9, p10, t_1)
		
		if #var30 > 0 and getFFlagReportAnythingEnableAdReport() then
			t_1.tags.REPORT_TARGET_ADS = {
				valueList = { { data = httpService:JSONEncode(var7(var30)) } }
			}
		end
		return httpService:JSONEncode(t_1)
	end,
	buildOtherReportRequest = function(p11, p12, p13)
		-- upvalues: t (ref), var9 (ref), var10 (ref), getFFlagGetHumanoidDescription (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescription (ref), httpService (ref)
		local t_1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p11.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p11.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p11.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p11.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p11.variant or t.Variant.Unknown } }
				}
			}
		}
		local var32, _ = var9(p12)
		var10(p12, p13, t_1)
		
		if #var32 > 0 then
			local var33 = tostring(var32[1].UserId)
			local t_2 = {}
			
			for i, v in ipairs(var32) do
				t_2[#t_2 + 1] = tostring(v.UserId)
			end
			if getFFlagGetHumanoidDescription() then
				local var38, var39
				local userId = var32[1].UserId
				local _ = nil
				local _ = nil
				
				if getFFlagGetHumanoidDescriptionUpdatesV2E() then
					local var35 = p12.identificationResults.identifiedAvatars[userId]
					
					if var35 and var35.humanoidDescription and var35.humanoidDescriptionStatus == "OK" then
						var38 = var35.humanoidDescription
						var39 = var35.humanoidDescriptionStatus
					else
						local var36, var37 = getHumanoidDescription(userId)
						var38 = var36
						var39 = var37
					end
				else
					local var40, var41 = getHumanoidDescription(userId)
					var38 = var40
					var39 = var41
				end
				local var42 = var39
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var38) } } }
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var42 } } }
				local t_3 = {}
				
				for i_1, v_1 in ipairs(var32) do
					local var44, var47, var48
					local userId_1 = v_1.UserId
					local _ = nil
					local _ = nil
					
					if getFFlagGetHumanoidDescriptionUpdatesV2E() then
						var44 = p12.identificationResults.identifiedAvatars[userId_1]
						
						if var44 and var44.humanoidDescription and var44.humanoidDescriptionStatus == "OK" then
							var47 = var44.humanoidDescription
							var48 = var44.humanoidDescriptionStatus
						else
							local var45, var46 = getHumanoidDescription(userId_1)
							var47 = var45
							var48 = var46
						end
					else
						var44, var49 = getHumanoidDescription(userId_1)
						var47 = var44
						var48 = var49
					end
					t_3[#t_3 + 1] = { humanoidDescription = var47, outputMessage = var48 }
				end
				t_1.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = { valueList = { { data = httpService:JSONEncode(t_3) } } }
			end
			t_1.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(var33) } } }
			t_1.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = httpService:JSONEncode(t_2) } } }
		elseif p11.formSelectedAbuserUserId then
			if getFFlagGetHumanoidDescription() then
				local var53, var54
				local formSelectedAbuserUserId = p11.formSelectedAbuserUserId
				local _ = nil
				local _ = nil
				
				if getFFlagGetHumanoidDescriptionUpdatesV2E() then
					local var50 = p12.identificationResults.identifiedAvatars[formSelectedAbuserUserId]
					
					if var50 and var50.humanoidDescription and var50.humanoidDescriptionStatus == "OK" then
						var53 = var50.humanoidDescription
						var54 = var50.humanoidDescriptionStatus
					else
						local var51, var52 = getHumanoidDescription(formSelectedAbuserUserId)
						var53 = var51
						var54 = var52
					end
				else
					local var55, var56 = getHumanoidDescription(formSelectedAbuserUserId)
					var53 = var55
					var54 = var56
				end
				local var57 = var54
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var53) } } }
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var57 } } }
			end
			t_1.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p11.formSelectedAbuserUserId) } }
			}
		end
		return if game:GetEngineFeature("WHAM2165") then t_1 else httpService:JSONEncode(t_1)
	end,
	interpretAnnotations = var9,
	Constants = t
}