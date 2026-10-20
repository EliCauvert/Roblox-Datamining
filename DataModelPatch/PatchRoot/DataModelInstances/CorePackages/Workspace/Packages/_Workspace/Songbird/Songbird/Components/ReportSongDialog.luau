local Songbird = script:FindFirstAncestor("Songbird")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local FocusNavigationUtilsModule = require(Songbird.Parent.FocusNavigationUtils)
local LoggerModule = require(Songbird.logger)
local _ = require(Songbird.types)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local DefaultTwoStepReportFlowModule = require(Songbird.Parent.GenericAbuseReporting.DefaultTwoStepReportFlow)
local AbuseCategoryModule = require(Songbird.Parent.GenericAbuseReporting.AbuseCategory)
local AbuseEntrypointModule = require(Songbird.Parent.GenericAbuseReporting.AbuseEntrypoint)
local UseCallbackFunction = ReactModule.useCallback
local UseLocalUserIdFunction = require(Songbird.Parent.AssetFavorites).useLocalUserId
local ReportCategories = {
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateAudio",
		value = "InappropriateAudio"
	},
	{
		localizationKey = "Feature.SongDetails.Label.InappropriateThumbnail",
		value = "InappropriateThumbnail"
	}
}

local function buildReport(p1)
	-- upvalues: AbuseEntrypointModule (copy), AbuseCategoryModule (copy), HttpService (copy)
	local config = {
		tags = {
			ENTRY_POINT = { valueList = { { data = AbuseEntrypointModule.APP } } },
			SUBMITTER_USER_ID = { valueList = { { data = tostring(p1.userId) } } },
			REPORTED_ABUSE_CATEGORY = {
				valueList = {
					{ data = AbuseCategoryModule.ABUSE_CATEGORY_INAPT_CONTENT }
				}
			},
			REPORTER_COMMENT = { valueList = { { data = p1.comment } } },
			REPORT_TARGET_ASSET_ID = { valueList = { { data = p1.assetId } } },
			REPORTED_ABUSE_VECTOR = { valueList = { { data = p1.abuseVector } } },
			VARIANT = { valueList = { { data = p1.variant } } }
		}
	}
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), config (copy)
		return HttpService:JSONEncode(config)
	end)
	
	return if Success then Result else nil
end

return ReactModule.memo(function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseCallbackFunction (copy), ReportCategories (copy), buildReport (copy), Players (copy), LoggerModule (copy), ReactModule (copy), FoundationModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), DefaultTwoStepReportFlowModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: p1 (copy)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y", selectionGroup = true }, {
		FocusRoot = ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, {
			AbuseReportFlow = ReactModule.createElement(DefaultTwoStepReportFlowModule, {
				analyticsContext = p1.analyticsSource,
				onCloseProps = { hasPreviousSteps = false, onAbandon = UseCallbackResult },
				onSubmitProps = {
					hasNextSteps = false,
					onSubmit = UseCallbackFunction(function(p2, Comment): boolean
						-- upvalues: ReportCategories (upval), p1 (copy), buildReport (upval), UseLocalUserIdResult (copy), Players (upval), LoggerModule (upval)
						local IsValueMatch = p2 == ReportCategories[1].value
						local AssetId = if IsValueMatch then p1.audio.assetId else p1.audio.thumbnailAssetId
						
						if AssetId then
							local Report = buildReport({
								userId = UseLocalUserIdResult,
								comment = Comment,
								assetId = AssetId,
								abuseVector = if IsValueMatch then "audio" else "image",
								variant = p1.analyticsSource
							})
							
							if Report then
								local LocalPlayer = Players.LocalPlayer
								
								if LocalPlayer then
									local Success, Result = pcall(function()
										-- upvalues: Players (upval), LocalPlayer (copy), Report (copy)
										Players:ReportAbuseV3(LocalPlayer, Report)
									end)
									
									if Success then
										LoggerModule:info(`Abuse report sent for asset [{AssetId}] with reason [{p2}] and comment [{Comment}]`)
									else
										LoggerModule:warning(`Failed to submit abuse report for asset {AssetId}: {Result}`)
									end
								end
							end
						end
						return true
					end, {
						p1.analyticsSource,
						p1.audio.assetId,
						p1.audio.thumbnailAssetId,
						UseLocalUserIdResult
					})
				},
				onComplete = UseCallbackResult,
				reportCategories = ReportCategories,
				reportCategoryDefaultKey = ReportCategories[1].value,
				localizationKeys = { formTitle = "Feature.SongDetails.Action.ReportAudio" }
			})
		})
	})
end)