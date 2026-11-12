local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local TnSAvatarIdentificationModule = require(CorePackages.Workspace.Packages.TnSAvatarIdentification)
local HttpService = game:GetService("HttpService")
local GetAvatarsForPointFunction = TnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForPoint
local GetAvatarsForRegionFunction = TnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForRegion
local GetAdsForPointFunction = require(CorePackages.Workspace.Packages.TnSAdIdentification).AdIdentification.getAdsForPoint
local GetFFlagReportAnythingEnableAdReportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport
local GetFFlagGetHumanoidDescriptionFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription
local GetFFlagRAEnableCircleRegionFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion
local GetFFlagGetHumanoidDescriptionUpdatesV2EFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local GetHumanoidDescriptionFunction = require(AbuseReportMenu.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription
local _ = require(AbuseReportMenu.Components.Types)
local _ = require(AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local Constants = {
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

local function v7(AnnotationPoints)
	local t = {}
	
	for _, annotationPoint in ipairs(AnnotationPoints) do
		t[#t + 1] = { annotationPoint.X, annotationPoint.Y }
	end
	return t
end

local function v8(IdentifiedAds)
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

local function v9(IdentifiedAvatars)
	-- upvalues: v7 (copy)
	local t = {}
	
	for i, identifiedAvatar in pairs(IdentifiedAvatars) do
		t[#t + 1] = {
			userId = tostring(i),
			distance = identifiedAvatar.distance,
			boundingBox = {
				minX = identifiedAvatar.boundingBox.min.X,
				minY = identifiedAvatar.boundingBox.min.Y,
				maxX = identifiedAvatar.boundingBox.max.X,
				maxY = identifiedAvatar.boundingBox.max.Y
			},
			hitRate = identifiedAvatar.hitRate,
			convexHull = v7(identifiedAvatar.convexHull)
		}
		
		if identifiedAvatar.pointProcessingStats ~= nil then
			t[#t].pointProcessingStats = {
				if identifiedAvatar.pointProcessingStats.wasSkipped then 1 else 0,
				identifiedAvatar.pointProcessingStats.total,
				identifiedAvatar.pointProcessingStats.offScreenDiscardCount,
				identifiedAvatar.pointProcessingStats.tooCloseDiscardCount
			}
		end
	end
	return t
end

local function _(p1, p2)
	-- upvalues: GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), GetHumanoidDescriptionFunction (copy)
	if not GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
		local HumanoidDescription, HumanoidDescription2 = GetHumanoidDescriptionFunction(p1)
		
		return HumanoidDescription, HumanoidDescription2
	end
	local IdentifiedAvatar = p2.identificationResults.identifiedAvatars[p1]
	
	if IdentifiedAvatar and IdentifiedAvatar.humanoidDescription and IdentifiedAvatar.humanoidDescriptionStatus == "OK" then
		return IdentifiedAvatar.humanoidDescription, IdentifiedAvatar.humanoidDescriptionStatus
	else
		local HumanoidDescription1, HumanoidDescription2_1 = GetHumanoidDescriptionFunction(p1)
		
		return HumanoidDescription1, HumanoidDescription2_1
	end
end

local function InterpretAnnotations(p1)
	-- upvalues: GetFFlagRAEnableCircleRegionFunction (copy), GetAvatarsForRegionFunction (copy), GetAvatarsForPointFunction (copy), GetFFlagReportAnythingEnableAdReportFunction (copy), GetAdsForPointFunction (copy)
	local t = {}
	local t1 = {}
	local Players = {}
	local IdentifiedAds = {}
	
	for _, annotationPoint in ipairs(p1.annotationPoints) do
		local v1 = 1e999
		local v2 = nil
		local AvatarsForRegion = if GetFFlagRAEnableCircleRegionFunction() then GetAvatarsForRegionFunction(p1.identificationResults.identifiedAvatars, annotationPoint, p1.annotationCircleRadius, p1.annotationAreaWidth, p1.annotationAreaHeight) else GetAvatarsForPointFunction(p1.identificationResults.identifiedAvatars, annotationPoint)
		for i, _ in pairs(AvatarsForRegion) do
			local Distance = p1.identificationResults.identifiedAvatars[i].distance
			
			if Distance < v1 then
				v1 = Distance
				v2 = i
			end
		end
		local v3 = nil
		
		if GetFFlagReportAnythingEnableAdReportFunction() then
			local v4 = 1e999
			
			for i1, _ in pairs((GetAdsForPointFunction(p1.identificationResults.identifiedAds, annotationPoint))) do
				local Distance = p1.identificationResults.identifiedAds[i1].distance
				
				if Distance < v4 then
					v4 = Distance
					v3 = i1
				end
			end
		end
		if v2 ~= nil and not t[v2] then
			t[v2] = true
			Players[#Players + 1] = p1.identificationResults.identifiedAvatars[v2].player
		elseif GetFFlagReportAnythingEnableAdReportFunction() and v3 ~= nil and not t1[v3] then
			t1[v3] = true
			IdentifiedAds[#IdentifiedAds + 1] = p1.identificationResults.identifiedAds[v3]
		end
	end
	return Players, IdentifiedAds
end

local function v12(p2, _, Input)
	-- upvalues: GetFFlagReportAnythingEnableAdReportFunction (copy), HttpService (copy), v9 (copy), v8 (copy), v7 (copy)
	local Flag = false
	
	for _, _ in pairs(p2.identificationResults.identifiedAvatars) do
		Flag = true
		break
	end
	local Flag1 = false
	
	if GetFFlagReportAnythingEnableAdReportFunction() then
		for _, _ in pairs(p2.identificationResults.identifiedAds) do
			Flag1 = true
			break
		end
	end
	if Flag then
		Input.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{
					data = HttpService:JSONEncode((v9(p2.identificationResults.identifiedAvatars)))
				}
			}
		}
	end
	if p2.identificationResults.avatarIDStats then
		Input.tags.AVATAR_ID_STATS = {
			valueList = {
				{
					data = HttpService:JSONEncode(p2.identificationResults.avatarIDStats)
				}
			}
		}
	end
	if Flag1 and GetFFlagReportAnythingEnableAdReportFunction() then
		Input.tags.IDENTIFIED_ADS = {
			valueList = {
				{
					data = HttpService:JSONEncode((v8(p2.identificationResults.identifiedAds)))
				}
			}
		}
	end
	if p2.identificationResults.adIDStats and GetFFlagReportAnythingEnableAdReportFunction() then
		Input.tags.AD_ID_STATS = {
			valueList = {
				{
					data = HttpService:JSONEncode(p2.identificationResults.adIDStats)
				}
			}
		}
	end
	if #p2.screenshotId > 0 then
		Input.tags.SCREENSHOT_ID = { valueList = { { data = p2.screenshotId } } }
	end
	if #p2.annotationPoints > 0 then
		Input.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{ data = HttpService:JSONEncode((v7(p2.annotationPoints))) }
			}
		}
	end
	Input.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(p2.annotationOptionSeen) } }
	}
	Input.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(p2.annotationPageSeen) } }
	}
end

return {
	buildExperienceReportRequest = function(p3, p4, p5)
		-- upvalues: Constants (copy), InterpretAnnotations (copy), v12 (copy), GetFFlagReportAnythingEnableAdReportFunction (copy), HttpService (copy), v8 (copy)
		local config = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p3.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3.abuseReason } } },
				PLACE_ID = { valueList = { { data = tostring(p3.placeId) } } },
				REPORTER_COMMENT = { valueList = { { data = p3.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "place" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p3.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p3.variant or Constants.Variant.CS } }
				}
			}
		}
		local _, InterpretAnnotationsResult2 = InterpretAnnotations(p4)
		v12(p4, p5, config)
		
		if #InterpretAnnotationsResult2 > 0 and GetFFlagReportAnythingEnableAdReportFunction() then
			config.tags.REPORT_TARGET_ADS = {
				valueList = {
					{
						data = HttpService:JSONEncode((v8(InterpretAnnotationsResult2)))
					}
				}
			}
		end
		return HttpService:JSONEncode(config)
	end,
	buildOtherReportRequest = function(p3, p4, p5)
		-- upvalues: Constants (copy), InterpretAnnotations (copy), v12 (copy), GetFFlagGetHumanoidDescriptionFunction (copy), GetFFlagGetHumanoidDescriptionUpdatesV2EFunction (copy), GetHumanoidDescriptionFunction (copy), HttpService (copy)
		local config = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p3.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p3.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p3.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p3.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p3.variant or Constants.Variant.Unknown } }
				}
			}
		}
		local InterpretAnnotationsResult, _ = InterpretAnnotations(p4)
		v12(p4, p5, config)
		
		if #InterpretAnnotationsResult > 0 then
			local Text = tostring(InterpretAnnotationsResult[1].UserId)
			local Input = {}
			
			for _, Player in ipairs(InterpretAnnotationsResult) do
				Input[#Input + 1] = tostring(Player.UserId)
			end
			if GetFFlagGetHumanoidDescriptionFunction() then
				local UserId = InterpretAnnotationsResult[1].UserId
				local HumanoidDescription = nil
				local HumanoidDescription2 = nil
				
				if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
					local IdentifiedAvatar = p4.identificationResults.identifiedAvatars[UserId]
					
					if IdentifiedAvatar and IdentifiedAvatar.humanoidDescription and IdentifiedAvatar.humanoidDescriptionStatus == "OK" then
						HumanoidDescription = IdentifiedAvatar.humanoidDescription
						HumanoidDescription2 = IdentifiedAvatar.humanoidDescriptionStatus
					else
						HumanoidDescription, HumanoidDescription2 = GetHumanoidDescriptionFunction(UserId)
					end
				else
					HumanoidDescription, HumanoidDescription2 = GetHumanoidDescriptionFunction(UserId)
				end
				config.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					valueList = { { data = HttpService:JSONEncode(HumanoidDescription) } }
				}
				config.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = HumanoidDescription2 } } }
				local Input1 = {}
				
				for _, Player1 in ipairs(InterpretAnnotationsResult) do
					local UserId1 = Player1.UserId
					local HumanoidDescription2_1 = nil
					local HumanoidDescription1 = nil
					
					if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
						local IdentifiedAvatar = p4.identificationResults.identifiedAvatars[UserId1]
						
						if IdentifiedAvatar and IdentifiedAvatar.humanoidDescription and IdentifiedAvatar.humanoidDescriptionStatus == "OK" then
							HumanoidDescription1 = IdentifiedAvatar.humanoidDescription
							HumanoidDescription2_1 = IdentifiedAvatar.humanoidDescriptionStatus
						else
							HumanoidDescription1, HumanoidDescription2_1 = GetHumanoidDescriptionFunction(UserId1)
						end
					else
						HumanoidDescription1, HumanoidDescription2_1 = GetHumanoidDescriptionFunction(UserId1)
					end
					Input1[#Input1 + 1] = {
						humanoidDescription = HumanoidDescription1,
						outputMessage = HumanoidDescription2_1
					}
				end
				config.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
					valueList = { { data = HttpService:JSONEncode(Input1) } }
				}
			end
			config.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(Text) } } }
			config.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = HttpService:JSONEncode(Input) } } }
		elseif p3.formSelectedAbuserUserId then
			if GetFFlagGetHumanoidDescriptionFunction() then
				local FormSelectedAbuserUserId = p3.formSelectedAbuserUserId
				local HumanoidDescription2_2 = nil
				local HumanoidDescription3 = nil
				
				if GetFFlagGetHumanoidDescriptionUpdatesV2EFunction() then
					local IdentifiedAvatar = p4.identificationResults.identifiedAvatars[FormSelectedAbuserUserId]
					
					if IdentifiedAvatar and IdentifiedAvatar.humanoidDescription and IdentifiedAvatar.humanoidDescriptionStatus == "OK" then
						HumanoidDescription3 = IdentifiedAvatar.humanoidDescription
						HumanoidDescription2_2 = IdentifiedAvatar.humanoidDescriptionStatus
					else
						HumanoidDescription3, HumanoidDescription2_2 = GetHumanoidDescriptionFunction(FormSelectedAbuserUserId)
					end
				else
					HumanoidDescription3, HumanoidDescription2_2 = GetHumanoidDescriptionFunction(FormSelectedAbuserUserId)
				end
				config.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					valueList = { { data = HttpService:JSONEncode(HumanoidDescription3) } }
				}
				config.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = HumanoidDescription2_2 } } }
			end
			config.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p3.formSelectedAbuserUserId) } }
			}
		end
		return if game:GetEngineFeature("WHAM2165") then config else HttpService:JSONEncode(config)
	end,
	interpretAnnotations = InterpretAnnotations,
	Constants = Constants
}