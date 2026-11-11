local CorePackages = game:GetService("CorePackages")
local TnSAvatarIdentificationModule = require(CorePackages.Workspace.Packages.TnSAvatarIdentification)
local HttpService = game:GetService("HttpService")
local GetAvatarsForPointFunction = TnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForPoint
local GetAvatarsForRegionFunction = TnSAvatarIdentificationModule.AvatarIdentification.getAvatarsForRegion
local GetAdsForPointFunction = require(CorePackages.Workspace.Packages.TnSAdIdentification).AdIdentification.getAdsForPoint
local GetFFlagReportAnythingEnableAdReportFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport
local GetFFlagGetHumanoidDescriptionFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription
local GetFFlagRAEnableCircleRegionFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion
local GetHumanoidDescriptionFunction = require(script.Parent.GetHumanoidDescription).getHumanoidDescription
local config = {
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
local Constants = {
	Variant = {
		CS = "ra/cs",
		Sampling = "ra/sampling",
		E1 = "ra/e1",
		E2 = "ra/e2",
		E3 = "ra/e3",
		Unknown = "ra/unknown"
	}
}

local function v5(AnnotationPoints)
	local t = {}
	
	for _, annotationPoint in ipairs(AnnotationPoints) do
		t[#t + 1] = { annotationPoint.X, annotationPoint.Y }
	end
	return t
end

local function v6(IdentifiedAds)
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

local function v7(IdentifiedAvatars)
	-- upvalues: v5 (copy)
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
			convexHull = v5(identifiedAvatar.convexHull)
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

local function v8(Input)
	-- upvalues: config (ref), GetFFlagReportAnythingEnableAdReportFunction (copy), HttpService (copy), v7 (copy), v6 (copy), v5 (copy)
	local Flag = false
	
	for _, _ in pairs(config.identifiedAvatars) do
		Flag = true
		break
	end
	local Flag1 = false
	
	if GetFFlagReportAnythingEnableAdReportFunction() then
		for _, _ in pairs(config.identifiedAds) do
			Flag1 = true
			break
		end
	end
	if Flag then
		Input.tags.IDENTIFIED_AVATARS = {
			valueList = {
				{
					data = HttpService:JSONEncode((v7(config.identifiedAvatars)))
				}
			}
		}
	end
	if config.avatarIDStats then
		Input.tags.AVATAR_ID_STATS = {
			valueList = { { data = HttpService:JSONEncode(config.avatarIDStats) } }
		}
	end
	if Flag1 and GetFFlagReportAnythingEnableAdReportFunction() then
		Input.tags.IDENTIFIED_ADS = {
			valueList = {
				{
					data = HttpService:JSONEncode((v6(config.identifiedAds)))
				}
			}
		}
	end
	if config.adIDStats and GetFFlagReportAnythingEnableAdReportFunction() then
		Input.tags.AD_ID_STATS = {
			valueList = { { data = HttpService:JSONEncode(config.adIDStats) } }
		}
	end
	if #config.screenshotId > 0 then
		Input.tags.SCREENSHOT_ID = { valueList = { { data = config.screenshotId } } }
	end
	if #config.annotationPoints > 0 then
		Input.tags.RA_ANNOTATION_POINTS = {
			valueList = {
				{
					data = HttpService:JSONEncode((v5(config.annotationPoints)))
				}
			}
		}
	end
	Input.tags.RA_ANNOTATION_OPTION_SEEN = {
		valueList = { { data = tostring(config.annotationOptionSeen) } }
	}
	Input.tags.RA_ANNOTATION_PAGE_SEEN = {
		valueList = { { data = tostring(config.annotationPageSeen) } }
	}
end

local function v9()
	-- upvalues: config (ref), GetFFlagRAEnableCircleRegionFunction (copy), GetAvatarsForRegionFunction (copy), GetAvatarsForPointFunction (copy), GetFFlagReportAnythingEnableAdReportFunction (copy), GetAdsForPointFunction (copy)
	local t = {}
	local t1 = {}
	local SelectedAbusers = {}
	local SelectedAds = {}
	
	for _, annotationPoint in ipairs(config.annotationPoints) do
		local v1 = 1e999
		local v2 = nil
		local AvatarsForRegion = if GetFFlagRAEnableCircleRegionFunction() then GetAvatarsForRegionFunction(config.identifiedAvatars, annotationPoint, config.annotationCircleRadius, config.screenSizeWidth, config.screenSizeHeight) else GetAvatarsForPointFunction(config.identifiedAvatars, annotationPoint)
		for i, _ in pairs(AvatarsForRegion) do
			local Distance = config.identifiedAvatars[i].distance
			
			if Distance < v1 then
				v1 = Distance
				v2 = i
			end
		end
		local v3 = nil
		
		if GetFFlagReportAnythingEnableAdReportFunction() then
			local v4 = 1e999
			
			for i1, _ in pairs((GetAdsForPointFunction(config.identifiedAds, annotationPoint))) do
				local Distance = config.identifiedAds[i1].distance
				
				if Distance < v4 then
					v4 = Distance
					v3 = i1
				end
			end
		end
		if v2 ~= nil and not t[v2] then
			t[v2] = true
			SelectedAbusers[#SelectedAbusers + 1] = config.identifiedAvatars[v2].player
		elseif GetFFlagReportAnythingEnableAdReportFunction() and v3 ~= nil and not t1[v3] then
			t1[v3] = true
			SelectedAds[#SelectedAds + 1] = config.identifiedAds[v3]
		end
	end
	config.selectedAbusers = SelectedAbusers
	config.selectedAds = SelectedAds
end

return {
	setAnnotationCircleRadius = function(AnnotationCircleRadius)
		-- upvalues: config (ref)
		config.annotationCircleRadius = AnnotationCircleRadius
	end,
	getAnnotationCircleRadius = function()
		-- upvalues: config (ref)
		return config.annotationCircleRadius
	end,
	setAspectRatioDimensions = function(ScreenSizeWidth, ScreenSizeHeight)
		-- upvalues: config (ref)
		config.screenSizeWidth = ScreenSizeWidth
		config.screenSizeHeight = ScreenSizeHeight
	end,
	setScreenshotId = function(ScreenshotId)
		-- upvalues: config (ref)
		config.screenshotId = ScreenshotId
	end,
	setIdentifiedAds = function(IdentifiedAds)
		-- upvalues: config (ref)
		config.identifiedAds = IdentifiedAds
	end,
	getIdentifiedAds = function()
		-- upvalues: config (ref)
		return config.identifiedAds
	end,
	setIdentifiedAvatars = function(IdentifiedAvatars)
		-- upvalues: config (ref)
		config.identifiedAvatars = IdentifiedAvatars
	end,
	getIdentifiedAvatars = function()
		-- upvalues: config (ref)
		return config.identifiedAvatars
	end,
	setAvatarIDStats = function(AvatarIDStats)
		-- upvalues: config (ref)
		config.avatarIDStats = AvatarIDStats
	end,
	setAdIDStats = function(AdIDStats)
		-- upvalues: config (ref)
		config.adIDStats = AdIDStats
	end,
	setScreenshotContentId = function(ScreenshotContentId)
		-- upvalues: config (ref)
		config.screenshotContentId = ScreenshotContentId
		config.annotationPoints = {}
		config.selectedAbusers = {}
	end,
	getScreenshotContentId = function()
		-- upvalues: config (ref)
		return config.screenshotContentId
	end,
	setAnnotationPoints = function(AnnotationPoints)
		-- upvalues: config (ref), v9 (copy)
		config.annotationPoints = AnnotationPoints
		config.annotationOptionSeen = true
		config.annotationPageSeen = true
		v9()
	end,
	getSelectedAbusers = function()
		-- upvalues: config (ref)
		return config.selectedAbusers
	end,
	getSelectedAds = function()
		-- upvalues: config (ref)
		return config.selectedAds
	end,
	clearAnnotationPoints = function()
		-- upvalues: config (ref), GetFFlagReportAnythingEnableAdReportFunction (copy)
		config.annotationPoints = {}
		config.selectedAbusers = {}
		
		if GetFFlagReportAnythingEnableAdReportFunction() then
			config.selectedAds = {}
		end
		config.annotationOptionSeen = false
		config.annotationPageSeen = false
	end,
	getAnnotationPoints = function()
		-- upvalues: config (ref)
		return config.annotationPoints
	end,
	setAnnotationOptionSeen = function(AnnotationOptionSeen)
		-- upvalues: config (ref)
		config.annotationOptionSeen = AnnotationOptionSeen
	end,
	getAnnotationOptionSeen = function()
		-- upvalues: config (ref)
		return config.annotationOptionSeen
	end,
	setAnnotationPageSeen = function(AnnotationPageSeen)
		-- upvalues: config (ref)
		config.annotationPageSeen = AnnotationPageSeen
	end,
	getAnnotationPageSeen = function()
		-- upvalues: config (ref)
		return config.annotationPageSeen
	end,
	buildExperienceReportRequest = function(p1)
		-- upvalues: Constants (copy), v8 (copy), config (ref), GetFFlagReportAnythingEnableAdReportFunction (copy), HttpService (copy), v6 (copy)
		local config1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p1.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p1.abuseReason } } },
				PLACE_ID = { valueList = { { data = tostring(p1.placeId) } } },
				REPORTER_COMMENT = { valueList = { { data = p1.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "place" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p1.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p1.variant or Constants.Variant.CS } }
				}
			}
		}
		v8(config1)
		
		if #config.selectedAds > 0 and GetFFlagReportAnythingEnableAdReportFunction() then
			config1.tags.REPORT_TARGET_ADS = {
				valueList = {
					{ data = HttpService:JSONEncode((v6(config.selectedAds))) }
				}
			}
		end
		return HttpService:JSONEncode(config1)
	end,
	buildOtherReportRequest = function(p1)
		-- upvalues: Constants (copy), v8 (copy), config (ref), GetFFlagGetHumanoidDescriptionFunction (copy), GetHumanoidDescriptionFunction (copy), HttpService (copy)
		local config1 = {
			tags = {
				ENTRY_POINT = { valueList = { { data = "in-experience" } } },
				SUBMITTER_USER_ID = { valueList = { { data = tostring(p1.localUserId) } } },
				REPORTED_ABUSE_CATEGORY = { valueList = { { data = p1.abuseReason } } },
				REPORTER_COMMENT = { valueList = { { data = p1.abuseComment } } },
				REPORTED_ABUSE_VECTOR = { valueList = { { data = "avatar" } } },
				IN_EXP_MENU_ENTRY_POINT = { valueList = { { data = p1.menuEntryPoint } } },
				VARIANT = {
					valueList = { { data = p1.variant or Constants.Variant.Unknown } }
				}
			}
		}
		v8(config1)
		
		if #config.selectedAbusers > 0 then
			local Text = tostring(config.selectedAbusers[1].UserId)
			local Input = {}
			
			for _, selectedAbuser in ipairs(config.selectedAbusers) do
				Input[#Input + 1] = tostring(selectedAbuser.UserId)
			end
			if GetFFlagGetHumanoidDescriptionFunction() then
				local HumanoidDescription, HumanoidDescription2 = GetHumanoidDescriptionFunction(config.selectedAbusers[1].UserId)
				config1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					valueList = { { data = HttpService:JSONEncode(HumanoidDescription) } }
				}
				config1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = HumanoidDescription2 } } }
				local Input1 = {}
				
				for _, selectedAbuser1 in ipairs(config.selectedAbusers) do
					local HumanoidDescription3, HumanoidDescription2_2 = GetHumanoidDescriptionFunction(selectedAbuser1.UserId)
					Input1[#Input1 + 1] = {
						humanoidDescription = HumanoidDescription3,
						outputMessage = HumanoidDescription2_2
					}
				end
				config1.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
					valueList = { { data = HttpService:JSONEncode(Input1) } }
				}
			end
			config1.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(Text) } } }
			config1.tags.RA_ALL_ANNOTATED_USER_IDS = { valueList = { { data = HttpService:JSONEncode(Input) } } }
		elseif p1.formSelectedAbuserUserId then
			if GetFFlagGetHumanoidDescriptionFunction() then
				local HumanoidDescription1, HumanoidDescription2_1 = GetHumanoidDescriptionFunction(p1.formSelectedAbuserUserId)
				config1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					valueList = { { data = HttpService:JSONEncode(HumanoidDescription1) } }
				}
				config1.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = { valueList = { { data = HumanoidDescription2_1 } } }
			end
			config1.tags.REPORT_TARGET_USER_ID = {
				valueList = { { data = tostring(p1.formSelectedAbuserUserId) } }
			}
		end
		return HttpService:JSONEncode(config1)
	end,
	clear = function()
		-- upvalues: config (ref)
		config = {
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
		-- upvalues: config (ref)
		return {
			finalAnnotationOptionSeen = config.annotationOptionSeen,
			finalAnnotationPageSeen = config.annotationPageSeen,
			finalAnnotationCount = #config.annotationPoints,
			finalAnnotatedAvatarsCount = #config.selectedAbusers
		}
	end,
	Constants = Constants
}