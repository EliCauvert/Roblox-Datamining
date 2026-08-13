local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local parent = inGameAssetReporting.Parent
local _ = require(inGameAssetReporting.Analysis.SceneAnalysis)
local getHumanoidDescription = require(parent.GetHumanoidDescription).getHumanoidDescription
local fFlagDropUnroutableMultiReportOptions = require(parent.SharedFlags).FFlagDropUnroutableMultiReportOptions
local httpService = game:GetService("HttpService")
local t = { Variant = { IGARv1 = "IGARv1", IGARv3 = "IGARv3" } }

function transformTargetPlayers(p0, p1) --[[ line: 38 ]]
	-- upvalues: getHumanoidDescription (ref)
	local t = {}
	
	if p1 == 0 then
		p1 = 1
	end
	for i, v in ipairs(p0) do
		local player = v.player
		local count = v.count
		local var5, var6 = getHumanoidDescription(player.UserId)
		table.insert(t, {
			userId = player.UserId,
			hitCount = count,
			hitPercentage = count / p1,
			humanoidDescription = var5,
			humanoidDescriptionStatus = var6
		})
	end
	return t
end

function serializeTargetPlayersIntoTagValues(p2) --[[ line: 60 ]]
	-- upvalues: httpService (ref)
	local t = {}
	
	for i, v in ipairs(p2) do
		table.insert(t, { data = httpService:JSONEncode(v) })
	end
	return t
end

local var3 = function(p3) --[[ line: 70 ]]
	local t = {}
	
	for i, v in ipairs(p3) do
		t[#t + 1] = { v.X, v.Y }
	end
	return t
end

local _ = function(p4) --[[ line: 78 ]]
	local extractedAssets = p4.extractedAssets
	
	return if #extractedAssets.Image <= 0 then if #extractedAssets.Mesh <= 0 then if #extractedAssets.Model <= 0 then if #extractedAssets.Package <= 0 then #extractedAssets.Text > 0 else true else true else true else true
end

function buildReport(p5, p6, p7, p8, p9, p10, p11, p12, p13) --[[ line: 87 ]]
	-- upvalues: fFlagDropUnroutableMultiReportOptions (ref), t (ref), httpService (ref), var3 (ref)
	local t_1 = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p5) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = p8 } } },
			REPORTED_ABUSE_SURFACE = { valueList = { { data = p9 } } },
			PLACE_ID = { valueList = { { data = tostring(game.PlaceId) } } },
			REPORTER_COMMENT = { valueList = { { data = p10 } } },
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if not fFlagDropUnroutableMultiReportOptions and p9 == "username" then if p9 == "text" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then "in-experience-text" else "multi" else "user_profile"
					}
				}
			},
			VARIANT = { valueList = { { data = t.Variant.IGARv1 } } },
			IGAR_REPORT_TARGET_ASSETS = {
				valueList = { { data = httpService:JSONEncode(p7.extractedAssets) } }
			},
			IGAR_EXTRACTION_STATS = {
				valueList = { { data = httpService:JSONEncode(p7.stats) } }
			},
			IGAR_ANNOTATION_COORDINATES = {
				valueList = { { data = httpService:JSONEncode(var3(p11)) } }
			}
		}
	}
	
	if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") and #p7.extractedAssets.Text > 0 then
		t_1.tags.IGAR_REPORT_TARGET_IN_EXPERIENCE_TEXT = {
			valueList = {
				{ data = httpService:JSONEncode(p7.extractedAssets.Text) }
			}
		}
	end
	if game:GetEngineFeature("DeltaFactoryCloneJobId") then
		t_1.tags.IGAR_REPORT_JOBID = {
			valueList = { { data = httpService:JSONEncode(game.JobId) } }
		}
	end
	if p12 then
		local extractedAssets = p12.extractedAssets
		
		if if #extractedAssets.Image <= 0 then if #extractedAssets.Mesh <= 0 then if #extractedAssets.Model <= 0 then if #extractedAssets.Package <= 0 then #extractedAssets.Text > 0 else true else true else true else true then
			t_1.tags.IGAR_REPORT_TARGET_GUI_ASSETS = {
				valueList = { { data = httpService:JSONEncode(p12.extractedAssets) } }
			}
			
			if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
				t_1.tags.IGAR_REPORT_TARGET_GUI_IN_EXPERIENCE_TEXT = {
					valueList = {
						{ data = httpService:JSONEncode(p12.extractedAssets.Text) }
					}
				}
			end
			t_1.tags.IGAR_GUI_EXTRACTION_STATS = {
				valueList = { { data = httpService:JSONEncode(p12.stats) } }
			}
		end
	end
	if #p7.extractedPlayers > 0 then
		local var10 = transformTargetPlayers(p7.extractedPlayers, p7.stats.raycastCompletedCount)
		t_1.tags.IGAR_REPORT_TARGET_PLAYERS = { valueList = serializeTargetPlayersIntoTagValues(var10) }
		
		if not fFlagDropUnroutableMultiReportOptions and p9 == "username" then
			t_1.tags.REPORT_TARGET_USER_ID = { valueList = { { data = tostring(var10[1].userId) } } }
		end
	end
	if p6 then
		t_1.tags.SCREENSHOT_ID = { valueList = { { data = p6 } } }
	end
	if p13 then
		t_1.tags.VARIANT.valueList[1].data = t.Variant.IGARv3 .. "-" .. p13
	end
	return if fFlagDropUnroutableMultiReportOptions or p9 ~= "username" or #p7.extractedPlayers ~= 0 then httpService:JSONEncode(t_1) else nil
end

return buildReport