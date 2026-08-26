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
local fFlagUpdateInGameAssetReportingCTAs = require(parent.SharedFlags).FFlagUpdateInGameAssetReportingCTAs
local fFlagDropUnroutableMultiReportOptions = require(parent.SharedFlags).FFlagDropUnroutableMultiReportOptions

return function(value)
	-- upvalues: fFlagPrefillPreciseSelectionChoices (ref), useLocalization (ref), getPreselectedSurfaceValueModule (ref), reactModule (ref), constantsModule (ref), fFlagDropUnroutableMultiReportOptions (ref), defaultDualDropdownDialogV2Module (ref), defaultDualDropdownDialogModule (ref), fFlagUpdateInGameAssetReportingCTAs (ref), fFlagGenericAbuseReportingGranularExports (ref), isShowUKOSAIllegalContentReportingLink (ref), view (ref), OSAReportLink (ref)
	local var1 = if fFlagPrefillPreciseSelectionChoices then useLocalization({
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
		local var2 = getPreselectedSurfaceValueModule(value.extractionResult)
		local var3 = if var2 == "avatar" then var1.surfaceAvatar elseif var2 == "item" then var1.surfaceItem elseif var2 == "text" then var1.surfaceTextChat else nil
		reactModule.useEffect(function()
			-- upvalues: var3 (ref), value (ref), constantsModule (copy)
			if var3 then
				value.analyticsDispatch({
					type = constantsModule.AnalyticsActions.SetPrefilledSurfaceSelection,
					prefilled_surface_selection = var3
				})
			end
		end, { var3 })
		local var4 = reactModule.useMemo(function()
			-- upvalues: fFlagDropUnroutableMultiReportOptions (copy), var1 (write)
			return if fFlagDropUnroutableMultiReportOptions then {
				{ value = "avatar", label = var1.surfaceAvatar },
				{ value = "drawing", label = var1.surfaceDrawing },
				{ value = "experience", label = var1.surfaceExperience },
				{ value = "item", label = var1.surfaceItem },
				{ value = "text", label = var1.surfaceTextChat }
			} else {
				{ value = "avatar", label = var1.surfaceAvatar },
				{ value = "drawing", label = var1.surfaceDrawing },
				{ value = "experience", label = var1.surfaceExperience },
				{ value = "item", label = var1.surfaceItem },
				{ value = "movement", label = var1.surfaceMovement },
				{ value = "music", label = var1.surfaceMusic },
				{ value = "text", label = var1.surfaceTextChat },
				{ value = "username", label = var1.surfaceUsername }
			}
		end, {
			var1.surfaceAvatar, var1.surfaceDrawing, var1.surfaceExperience,
			var1.surfaceItem, var1.surfaceMovement, var1.surfaceMusic,
			var1.surfaceTextChat, var1.surfaceUsername
		})
		
		return reactModule.createElement(defaultDualDropdownDialogV2Module, {
			title = var1.title,
			problems = reactModule.useMemo(function()
				-- upvalues: fFlagDropUnroutableMultiReportOptions (copy), var1 (write)
				return if fFlagDropUnroutableMultiReportOptions then {
					{
						value = "bullying",
						label = var1.problemBullying,
						description = var1.problemBullyingDesc
					},
					{
						value = "dating",
						label = var1.problemDating,
						description = var1.problemDatingDesc
					},
					{
						value = "hate",
						label = var1.problemHate,
						description = var1.problemHateDesc
					},
					{
						value = "offsite links",
						label = var1.problemLinks,
						description = var1.problemLinksDesc
					},
					{
						value = "personal question",
						label = var1.problemPersonal,
						description = var1.problemPersonalDesc
					},
					{
						value = "swearing",
						label = var1.problemSwearing,
						description = var1.problemSwearingDesc
					},
					{
						value = "violence",
						label = var1.problemViolence,
						description = var1.problemViolenceDesc
					},
					{
						value = "ip infringement",
						label = var1.problemIPInfringement,
						description = var1.problemIPInfringementDesc
					}
				} else {
					{
						value = "bullying",
						label = var1.problemBullying,
						description = var1.problemBullyingDesc
					},
					{
						value = "exploiting",
						label = var1.problemCheating,
						description = var1.problemCheatingDesc
					},
					{
						value = "dating",
						label = var1.problemDating,
						description = var1.problemDatingDesc
					},
					{
						value = "hate",
						label = var1.problemHate,
						description = var1.problemHateDesc
					},
					{
						value = "offsite links",
						label = var1.problemLinks,
						description = var1.problemLinksDesc
					},
					{
						value = "personal question",
						label = var1.problemPersonal,
						description = var1.problemPersonalDesc
					},
					{
						value = "scamming",
						label = var1.problemScamming,
						description = var1.problemScammingDesc
					},
					{
						value = "swearing",
						label = var1.problemSwearing,
						description = var1.problemSwearingDesc
					},
					{
						value = "violence",
						label = var1.problemViolence,
						description = var1.problemViolenceDesc
					},
					{
						value = "ip infringement",
						label = var1.problemIPInfringement,
						description = var1.problemIPInfringementDesc
					}
				}
			end, {
				var1.problemBullying, var1.problemBullyingDesc, var1.problemCheating,
				var1.problemCheatingDesc, var1.problemDating, var1.problemDatingDesc,
				var1.problemHate, var1.problemHateDesc, var1.problemLinks,
				var1.problemLinksDesc, var1.problemPersonal, var1.problemPersonalDesc,
				var1.problemScamming, var1.problemScammingDesc, var1.problemSwearing,
				var1.problemSwearingDesc, var1.problemViolence, var1.problemViolenceDesc,
				var1.problemIPInfringement, var1.problemIPInfringementDesc
			}),
			surfaces = var4,
			preselected = reactModule.useMemo(function()
				-- upvalues: var2 (ref), var4 (ref)
				local var5 = nil
				
				if var2 ~= nil and var4 ~= nil then
					local var6
					for i = 1, #var4 do
						var6 = var4[i]
						
						if not var6 or var6.value ~= var2 then
							continue
						end
						var5 = var6
						break
					end
				end
				return { surface = var5 }
			end, { var2, var4 }),
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
				formSubmit = if fFlagUpdateInGameAssetReportingCTAs then "Feature.ReportAbuse.Label.Report" else "Feature.ReportAbuse.Action.Submit"
			},
			onSubmitProps = {
				hasNextSteps = true,
				onProceedToNextStep = if fFlagGenericAbuseReportingGranularExports then function(p1, p2, p3)
					-- upvalues: value (ref)
					value.onSubmit(p1, p2, p3)
					
					return true
				end else value.onSubmit
			},
			onCloseProps = { hasPreviousSteps = false, onAbandon = value.onBack },
			footerContent = function()
				-- upvalues: isShowUKOSAIllegalContentReportingLink (copy), reactModule (copy), view (copy), OSAReportLink (copy)
				return if isShowUKOSAIllegalContentReportingLink() then reactModule.createElement(view, { tag = "size-full-0 auto-y" }, { OSALink = reactModule.createElement(OSAReportLink) }) else nil
			end,
			reportProblems = if fFlagDropUnroutableMultiReportOptions then {
				{
					localizationKey = "Feature.ReportAbuse.Problem.Bullying",
					value = "bullying",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Bullying"
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
					localizationKey = "Feature.ReportAbuse.Problem.Swearing",
					value = "swearing",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Swearing"
				},
				{
					localizationKey = "Feature.ReportAbuse.Problem.Violence",
					value = "violence",
					descriptionLocalizationKey = "Feature.ReportAbuse.ProblemDescription.Violence"
				}
			} else {
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
			reportSurfaces = if fFlagDropUnroutableMultiReportOptions then {
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
					localizationKey = "Feature.ReportAbuse.ProblemSurface.TextChat",
					value = "text"
				}
			} else {
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