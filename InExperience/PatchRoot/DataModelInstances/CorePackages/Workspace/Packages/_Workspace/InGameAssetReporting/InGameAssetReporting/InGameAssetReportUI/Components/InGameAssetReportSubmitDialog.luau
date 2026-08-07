local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local parent = inGameAssetReporting.Parent
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local dsaIllegalContentReportingModule = require(parent.DsaIllegalContentReporting)
local isShowUKOSAIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = dsaIllegalContentReportingModule.OSAReportLink
local useLocalization = localizationModule.Hooks.useLocalization
local defaultDualDropdownDialogModule = require(parent.GenericAbuseReporting.DefaultDualDropdownDialog)
local defaultDualDropdownDialogV2Module = require(parent.GenericAbuseReporting.DefaultDualDropdownDialogV2)
local constantsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local getPreselectedSurfaceValueModule = require(inGameAssetReporting.Utility.getPreselectedSurfaceValue)
local _ = require(inGameAssetReporting.Analysis.SceneAnalysis)
local fFlagPrefillPreciseSelectionChoices = require(parent.SharedFlags).FFlagPrefillPreciseSelectionChoices
local fFlagGenericAbuseReportingGranularExports = require(parent.SharedFlags).FFlagGenericAbuseReportingGranularExports

return function(value) --[[ line: 36 | named "InGameAssetReportSubmitDialog" ]]
	-- upvalues: fFlagPrefillPreciseSelectionChoices (ref), useLocalization (ref), getPreselectedSurfaceValueModule (ref), reactModule (ref), constantsModule (ref), defaultDualDropdownDialogV2Module (ref), defaultDualDropdownDialogModule (ref), fFlagGenericAbuseReportingGranularExports (ref), isShowUKOSAIllegalContentReportingLink (ref), view (ref), OSAReportLink (ref)
	local var8 = if fFlagPrefillPreciseSelectionChoices then useLocalization({
		title = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport",
		problemBullying = "Feature.ReportAbuse.Problem.Bullying",
		problemBullyingDesc = "Feature.ReportAbuse.ProblemDescription.Bullying",
		problemCheating = "Feature.ReportAbuse.Problem.Cheating",
		problemCheatingDesc = "Feature.ReportAbuse.ProblemDescription.Cheating",
		problemDating = "Feature.ReportAbuse.Problem.Dating",
		problemDatingDesc = "Feature.ReportAbuse.ProblemDescription.Dating",
		problemHate = "Feature.ReportAbuse.Problem.Hate",
		problemHateDesc = "Feature.ReportAbuse.ProblemDescription.Hate",
		problemLinks = "Feature.ReportAbuse.Problem.Links",
		problemLinksDesc = "Feature.ReportAbuse.ProblemDescription.Links",
		problemPersonal = "Feature.ReportAbuse.Problem.Personal",
		problemPersonalDesc = "Feature.ReportAbuse.ProblemDescription.Personal",
		problemScamming = "Feature.ReportAbuse.Problem.Scamming",
		problemScammingDesc = "Feature.ReportAbuse.ProblemDescription.Scamming",
		problemSwearing = "Feature.ReportAbuse.Problem.Swearing",
		problemSwearingDesc = "Feature.ReportAbuse.ProblemDescription.Swearing",
		problemViolence = "Feature.ReportAbuse.Problem.Violence",
		problemViolenceDesc = "Feature.ReportAbuse.ProblemDescription.Violence",
		surfaceAvatar = "Feature.ReportAbuse.ProblemSurface.Avatar",
		surfaceDrawing = "Feature.ReportAbuse.ProblemSurface.DrawingOrCreation",
		surfaceExperience = "Feature.ReportAbuse.ProblemSurface.Experience",
		surfaceItem = "Feature.ReportAbuse.ProblemSurface.ItemOrAsset",
		surfaceMovement = "Feature.ReportAbuse.ProblemSurface.Movement",
		surfaceMusic = "Feature.ReportAbuse.ProblemSurface.MusicOrSoundEffect",
		surfaceTextChat = "Feature.ReportAbuse.ProblemSurface.TextChat",
		surfaceUsername = "Feature.ReportAbuse.ProblemSurface.Username",
		problemIPInfringement = "Feature.ReportAbuse.Problem.IpInfringement",
		problemIPInfringementDesc = "Feature.ReportAbuse.ProblemDescription.IpInfringement"
	}) else nil
	
	if fFlagPrefillPreciseSelectionChoices then
		local var9 = getPreselectedSurfaceValueModule(value.extractionResult)
		local var10 = if var9 == "avatar" then var8.surfaceAvatar elseif var9 == "item" then var8.surfaceItem elseif var9 == "text" then var8.surfaceTextChat else nil
		reactModule.useEffect(function() --[[ line: 80 ]]
			-- upvalues: var10 (ref), value (ref), constantsModule (copy)
			if var10 then
				value.analyticsDispatch({
					type = constantsModule.AnalyticsActions.SetPrefilledSurfaceSelection,
					prefilled_surface_selection = var10
				})
			end
		end, { var10 })
		local var11 = reactModule.useMemo(function() --[[ line: 141 ]]
			-- upvalues: var8 (write)
			return {
				{ value = "avatar", label = var8.surfaceAvatar },
				{ value = "drawing", label = var8.surfaceDrawing },
				{ value = "experience", label = var8.surfaceExperience },
				{ value = "item", label = var8.surfaceItem },
				{ value = "movement", label = var8.surfaceMovement },
				{ value = "music", label = var8.surfaceMusic },
				{ value = "text", label = var8.surfaceTextChat },
				{ value = "username", label = var8.surfaceUsername }
			}
		end, {
			var8.surfaceAvatar, var8.surfaceDrawing, var8.surfaceExperience,
			var8.surfaceItem, var8.surfaceMovement, var8.surfaceMusic,
			var8.surfaceTextChat, var8.surfaceUsername
		})
		
		return reactModule.createElement(defaultDualDropdownDialogV2Module, {
			title = var8.title,
			problems = reactModule.useMemo(function() --[[ line: 89 ]]
				-- upvalues: var8 (write)
				return {
					{
						value = "bullying",
						label = var8.problemBullying,
						description = var8.problemBullyingDesc
					},
					{
						value = "exploiting",
						label = var8.problemCheating,
						description = var8.problemCheatingDesc
					},
					{
						value = "dating",
						label = var8.problemDating,
						description = var8.problemDatingDesc
					},
					{
						value = "hate",
						label = var8.problemHate,
						description = var8.problemHateDesc
					},
					{
						value = "offsite links",
						label = var8.problemLinks,
						description = var8.problemLinksDesc
					},
					{
						value = "personal question",
						label = var8.problemPersonal,
						description = var8.problemPersonalDesc
					},
					{
						value = "scamming",
						label = var8.problemScamming,
						description = var8.problemScammingDesc
					},
					{
						value = "swearing",
						label = var8.problemSwearing,
						description = var8.problemSwearingDesc
					},
					{
						value = "violence",
						label = var8.problemViolence,
						description = var8.problemViolenceDesc
					},
					{
						value = "ip infringement",
						label = var8.problemIPInfringement,
						description = var8.problemIPInfringementDesc
					}
				}
			end, {
				var8.problemBullying, var8.problemBullyingDesc, var8.problemCheating,
				var8.problemCheatingDesc, var8.problemDating, var8.problemDatingDesc,
				var8.problemHate, var8.problemHateDesc, var8.problemLinks,
				var8.problemLinksDesc, var8.problemPersonal, var8.problemPersonalDesc,
				var8.problemScamming, var8.problemScammingDesc, var8.problemSwearing,
				var8.problemSwearingDesc, var8.problemViolence, var8.problemViolenceDesc,
				var8.problemIPInfringement, var8.problemIPInfringementDesc
			}),
			surfaces = var11,
			preselected = reactModule.useMemo(function() --[[ line: 163 ]]
				-- upvalues: var9 (ref), var11 (ref)
				local var12 = nil
				
				if var9 ~= nil and var11 ~= nil then
					local var13
					for i = 1, #var11 do
						var13 = var11[i]
						
						if not var13 or var13.value ~= var9 then
							continue
						end
						var12 = var13
						break
					end
				end
				return { surface = var12 }
			end, { var9, var11 }),
			onClose = value.onBack,
			onSubmit = value.onSubmit
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 10,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		SubmitReportDialog = reactModule.createElement(defaultDualDropdownDialogModule, {
			analyticsContext = "Test",
			localizationKeys = {
				formTitle = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport",
				formSubmit = "Feature.ReportAbuse.Action.Submit"
			},
			onSubmitProps = {
				hasNextSteps = true,
				onProceedToNextStep = if fFlagGenericAbuseReportingGranularExports then function(p0, p1, p2) --[[ line: 202 ]]
					-- upvalues: value (ref)
					value.onSubmit(p0, p1, p2)
					
					return true
				end else value.onSubmit
			},
			onCloseProps = { hasPreviousSteps = false, onAbandon = value.onBack },
			footerContent = function() --[[ line: 212 ]]
				-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), reactModule (copy), view (copy), OSAReportLink (copy)
				return if isShowUKOSAIllegalContentReportingLink() then reactModule.createElement(view, { tag = "size-full-0 auto-y" }, { OSALink = reactModule.createElement(OSAReportLink) }) else nil
			end,
			reportProblems = {
				{
					localizationKey = "Feature.ReportAbuse.Problem.Bullying",
					value = "bullying",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Cheating",
					value = "exploiting",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Cheating"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Dating",
					value = "dating",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Dating"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Hate",
					value = "hate",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Hate"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Links",
					value = "offsite links",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Links"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Personal",
					value = "personal question",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Personal"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Scamming",
					value = "scamming",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Scamming"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Swearing",
					value = "swearing",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Violence",
					value = "violence",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
				}
			},
			reportSurfaces = {
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.Avatar",
					value = "avatar"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.DrawingOrCreation",
					value = "drawing"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.Experience",
					value = "experience"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.ItemOrAsset",
					value = "item"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.Movement",
					value = "movement"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.MusicOrSoundEffect",
					value = "music"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.TextChat",
					value = "text"
				},
				{
					localizationKey = "Feature.ReportAbuse.ProblemSurface.Username",
					value = "username"
				}
			}
		})
	})
end