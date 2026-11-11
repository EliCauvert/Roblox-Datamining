local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local _ = require(InGameAssetReporting.Analysis.SceneAnalysis)
local GetHumanoidDescriptionFunction = require(InGameAssetReporting.Parent.GetHumanoidDescription).getHumanoidDescription
local HttpService = game:GetService("HttpService")
local config = { Variant = { IGARv1 = "IGARv1", IGARv3 = "IGARv3" } }

function transformTargetPlayers(List, p1: number)
	-- upvalues: GetHumanoidDescriptionFunction (copy)
	local List1 = {}
	
	if p1 == 0 then
		p1 = 1
	end
	for _, value in ipairs(List) do
		local Player = value.player
		local Count = value.count
		local HumanoidDescription, HumanoidDescription2 = GetHumanoidDescriptionFunction(Player.UserId)
		table.insert(List1, {
			userId = Player.UserId,
			hitCount = Count,
			hitPercentage = Count / p1,
			humanoidDescription = HumanoidDescription,
			humanoidDescriptionStatus = HumanoidDescription2
		})
	end
	return List1
end

function serializeTargetPlayersIntoTagValues(Inputs)
	-- upvalues: HttpService (copy)
	local List = {}
	
	for _, input in ipairs(Inputs) do
		table.insert(List, { data = HttpService:JSONEncode(input) })
	end
	return List
end

local function v4(List)
	local t = {}
	
	for _, value in ipairs(List) do
		t[#t + 1] = { value.X, value.Y }
	end
	return t
end

local function _(p2): boolean
	local ExtractedAssets = p2.extractedAssets
	
	return #ExtractedAssets.Image > 0 or (#ExtractedAssets.Mesh > 0 or (#ExtractedAssets.Model > 0 or (#ExtractedAssets.Package > 0 or #ExtractedAssets.Text > 0)))
end

function buildReport(p2, Data, p3, Data1, Data2, Data3, p4, p5, Text)
	-- upvalues: config (copy), HttpService (copy), v4 (copy)
	local config1 = {
		tags = {
			ENTRY_POINT = { valueList = { { data = "in-experience" } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p2) } } },
			REPORTED_ABUSE_CATEGORY = { valueList = { { data = Data1 } } },
			REPORTED_ABUSE_SURFACE = { valueList = { { data = Data2 } } },
			PLACE_ID = { valueList = { { data = tostring(game.PlaceId) } } },
			REPORTER_COMMENT = { valueList = { { data = Data3 } } },
			REPORTED_ABUSE_VECTOR = {
				valueList = {
					{
						data = if Data2 == "username" then "user_profile" elseif Data2 == "text" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then "in-experience-text" else "multi"
					}
				}
			},
			VARIANT = { valueList = { { data = config.Variant.IGARv1 } } },
			IGAR_REPORT_TARGET_ASSETS = {
				valueList = { { data = HttpService:JSONEncode(p3.extractedAssets) } }
			},
			IGAR_EXTRACTION_STATS = {
				valueList = { { data = HttpService:JSONEncode(p3.stats) } }
			},
			IGAR_ANNOTATION_COORDINATES = {
				valueList = { { data = HttpService:JSONEncode((v4(p4))) } }
			}
		}
	}
	
	if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") and #p3.extractedAssets.Text > 0 then
		config1.tags.IGAR_REPORT_TARGET_IN_EXPERIENCE_TEXT = {
			valueList = {
				{ data = HttpService:JSONEncode(p3.extractedAssets.Text) }
			}
		}
	end
	if game:GetEngineFeature("DeltaFactoryCloneJobId") then
		config1.tags.IGAR_REPORT_JOBID = {
			valueList = { { data = HttpService:JSONEncode(game.JobId) } }
		}
	end
	if p5 then
		local ExtractedAssets = p5.extractedAssets
		
		if #ExtractedAssets.Image > 0 or (#ExtractedAssets.Mesh > 0 or (#ExtractedAssets.Model > 0 or (#ExtractedAssets.Package > 0 or #ExtractedAssets.Text > 0))) then
			config1.tags.IGAR_REPORT_TARGET_GUI_ASSETS = {
				valueList = { { data = HttpService:JSONEncode(p5.extractedAssets) } }
			}
			
			if game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
				config1.tags.IGAR_REPORT_TARGET_GUI_IN_EXPERIENCE_TEXT = {
					valueList = {
						{ data = HttpService:JSONEncode(p5.extractedAssets.Text) }
					}
				}
			end
			config1.tags.IGAR_GUI_EXTRACTION_STATS = {
				valueList = { { data = HttpService:JSONEncode(p5.stats) } }
			}
		end
	end
	if #p3.extractedPlayers > 0 then
		local TransformTargetPlayersResult = transformTargetPlayers(p3.extractedPlayers, p3.stats.raycastCompletedCount)
		config1.tags.IGAR_REPORT_TARGET_PLAYERS = {
			valueList = serializeTargetPlayersIntoTagValues(TransformTargetPlayersResult)
		}
		
		if Data2 == "username" then
			config1.tags.REPORT_TARGET_USER_ID = {
				valueList = {
					{ data = tostring(TransformTargetPlayersResult[1].userId) }
				}
			}
		end
	end
	if Data then
		config1.tags.SCREENSHOT_ID = { valueList = { { data = Data } } }
	end
	if Text then
		config1.tags.VARIANT.valueList[1].data = config.Variant.IGARv3 .. "-" .. Text
	end
	return if Data2 == "username" and #p3.extractedPlayers == 0 then nil else HttpService:JSONEncode(config1)
end

return buildReport