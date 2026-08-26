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

local _ = function(p4, p5)
	-- upvalues: getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescription (ref)
	local _ = nil
	local _ = nil
	
	if not getFFlagGetHumanoidDescriptionUpdatesV2E() then
		local var4, var5 = getHumanoidDescription(p4)
		
		return var4, var5
	end
	local var6 = p5.identificationResults.identifiedAvatars[p4]
	
	if var6 and var6.humanoidDescription and var6.humanoidDescriptionStatus == "OK" then
		return var6.humanoidDescription, var6.humanoidDescriptionStatus
	end
	local var7, var8 = getHumanoidDescription(p4)
	
	return var7, var8
end

local var4 = function(p4)
	-- upvalues: getFFlagRAEnableCircleRegion (ref), getAvatarsForRegion (ref), getAvatarsForPoint (ref), getFFlagReportAnythingEnableAdReport (ref), getAdsForPoint (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in ipairs(p4.annotationPoints) do
		local i_2
		local var5 = 1e999
		local var6 = nil
		
		for i_1, v_1 in pairs(if getFFlagRAEnableCircleRegion() then getAvatarsForRegion(p4.identificationResults.identifiedAvatars, v, p4.annotationCircleRadius, p4.annotationAreaWidth, p4.annotationAreaHeight) else getAvatarsForPoint(p4.identificationResults.identifiedAvatars, v)) do
			i_2 = p4.identificationResults.identifiedAvatars[i_1].distance
			
			if i_2 < var5 then
				var5 = i_2
				var6 = i_1
			end
		end
		local var7 = nil
		
		if getFFlagReportAnythingEnableAdReport() then
			local var8 = 1e999
			
			for i_2, v_2 in pairs(getAdsForPoint(p4.identificationResults.identifiedAds, v)) do
				local distance = p4.identificationResults.identifiedAds[i_2].distance
				
				if distance < var8 then
					var8 = distance
					var7 = i_2
				end
			end
		end
		if var6 ~= nil and not t[var6] then
			t[var6] = true
			t_2[#t_2 + 1] = p4.identificationResults.identifiedAvatars[var6].player
		elseif getFFlagReportAnythingEnableAdReport() and var7 ~= nil and not t_1[var7] then
			t_1[var7] = true
			t_3[#t_3 + 1] = p4.identificationResults.identifiedAds[var7]
		end
	end
	return t_2, t_3
end

local var9 = function(p5, _, p6)
	-- upvalues: getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var3 (ref), var2 (ref), var1 (ref)
	local var10 = false
	
	for i, v in pairs(p5.identificationResults.identifiedAvatars) do
		var10 = true
		break
	end
	local var11 = false
	
	if getFFlagReportAnythingEnableAdReport() then
		for v, v_1 in pairs(p5.identificationResults.identifiedAds) do
			var11 = true
			break
		end
	end
	if var10 then
		p6.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{
					data = httpService:JSONEncode(var3(p5.identificationResults.identifiedAvatars))
				}
			}
		}
	end
	if p5.identificationResults.avatarIDStats then
		p6.tags.AVATAR_ID_STATS = {
			valueList = {
				{
					data = httpService:JSONEncode(p5.identificationResults.avatarIDStats)
				}
			}
		}
	end
	if var11 and getFFlagReportAnythingEnableAdReport() then
		p6.tags.IDENTIFIED_ADS = {
			valueList = {
				{
					data = httpService:JSONEncode(var2(p5.identificationResults.identifiedAds))
				}
			}
		}
	end
	if p5.identificationResults.adIDStats and getFFlagReportAnythingEnableAdReport() then
		p6.tags.AD_ID_STATS = {
			valueList = {
				{
					data = httpService:JSONEncode(p5.identificationResults.adIDStats)
				}
			}
		}
	end
	if #p5.screenshotId > 0 then
		p6.tags.SCREENSHOT_ID = { valueList = { { data = p5.screenshotId } } }
	end
	if #p5.annotationPoints > 0 then
		p6.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{ data = httpService:JSONEncode(var1(p5.annotationPoints)) }
			}
		}
	end
	p6.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(p5.annotationOptionSeen) } }
	}
	p6.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(p5.annotationPageSeen) } }
	}
end

return {
	buildExperienceReportRequest = function(p7, p8, p9)
		-- upvalues: t (ref), var4 (ref), var9 (ref), getFFlagReportAnythingEnableAdReport (ref), httpService (ref), var2 (ref)
		local t_1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p7.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p7.abuseReason } } },
				PLACE_ID = { valueList = { { data = tostring(p7.placeId) } } },
				REPORTER_COMMENT = { valueList = { { data = p7.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "place" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p7.menuEntryPoint } } },
				VARIANT = { valueList = { { data = p7.variant or t.Variant.CS } } }
			}
		}
		local _, var12 = var4(p8)
		var9(p8, p9, t_1)
		
		if #var12 > 0 and getFFlagReportAnythingEnableAdReport() then
			t_1.tags.REPORT_TARGET_ADS = {
				valueList = { { data = httpService:JSONEncode(var2(var12)) } }
			}
		end
		return httpService:JSONEncode(t_1)
	end,
	buildOtherReportRequest = function(p7, p8, p9)
		-- upvalues: t (ref), var4 (ref), var9 (ref), getFFlagGetHumanoidDescription (ref), getFFlagGetHumanoidDescriptionUpdatesV2E (ref), getHumanoidDescription (ref), httpService (ref)
		local t_1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p7.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p7.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p7.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p7.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p7.variant or t.Variant.Unknown } }
				}
			}
		}
		local var12, _ = var4(p8)
		var9(p8, p9, t_1)
		
		if #var12 > 0 then
			local var13 = tostring(var12[1].UserId)
			local t_2 = {}
			
			for i, v in ipairs(var12) do
				t_2[#t_2 + 1] = tostring(v.UserId)
			end
			if getFFlagGetHumanoidDescription() then
				local var14, var15
				local userId = var12[1].UserId
				local _ = nil
				local _ = nil
				
				if getFFlagGetHumanoidDescriptionUpdatesV2E() then
					local var16 = p8.identificationResults.identifiedAvatars[userId]
					
					if var16 and var16.humanoidDescription and var16.humanoidDescriptionStatus == "OK" then
						var14 = var16.humanoidDescription
						var15 = var16.humanoidDescriptionStatus
					else
						local var17, var18 = getHumanoidDescription(userId)
						var14 = var17
						var15 = var18
					end
				else
					local var19, var20 = getHumanoidDescription(userId)
					var14 = var19
					var15 = var20
				end
				local var21 = var15
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var14) } } }
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var21 } } }
				local t_3 = {}
				
				for i_1, v_1 in ipairs(var12) do
					local var22, var23, var24
					local userId_1 = v_1.UserId
					local _ = nil
					local _ = nil
					
					if getFFlagGetHumanoidDescriptionUpdatesV2E() then
						var22 = p8.identificationResults.identifiedAvatars[userId_1]
						
						if var22 and var22.humanoidDescription and var22.humanoidDescriptionStatus == "OK" then
							var23 = var22.humanoidDescription
							var24 = var22.humanoidDescriptionStatus
						else
							local var25, var26 = getHumanoidDescription(userId_1)
							var23 = var25
							var24 = var26
						end
					else
						var22, var49 = getHumanoidDescription(userId_1)
						var23 = var22
						var24 = var49
					end
					t_3[#t_3 + 1] = { humanoidDescription = var23, outputMessage = var24 }
				end
				t_1.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = { valueList = { { data = httpService:JSONEncode(t_3) } } }
			end
			t_1.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(var13) } } }
			t_1.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = httpService:JSONEncode(t_2) } } }
		elseif p7.formSelectedAbuserUserId then
			if getFFlagGetHumanoidDescription() then
				local var27, var28
				local formSelectedAbuserUserId = p7.formSelectedAbuserUserId
				local _ = nil
				local _ = nil
				
				if getFFlagGetHumanoidDescriptionUpdatesV2E() then
					local var29 = p8.identificationResults.identifiedAvatars[formSelectedAbuserUserId]
					
					if var29 and var29.humanoidDescription and var29.humanoidDescriptionStatus == "OK" then
						var27 = var29.humanoidDescription
						var28 = var29.humanoidDescriptionStatus
					else
						local var30, var31 = getHumanoidDescription(formSelectedAbuserUserId)
						var27 = var30
						var28 = var31
					end
				else
					local var32, var33 = getHumanoidDescription(formSelectedAbuserUserId)
					var27 = var32
					var28 = var33
				end
				local var34 = var28
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = { valueList = { { data = httpService:JSONEncode(var27) } } }
				t_1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = var34 } } }
			end
			t_1.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p7.formSelectedAbuserUserId) } }
			}
		end
		return if game:GetEngineFeature("WHAM2165") then t_1 else httpService:JSONEncode(t_1)
	end,
	interpretAnnotations = var4,
	Constants = t
}