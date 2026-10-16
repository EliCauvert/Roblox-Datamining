local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local Parent = InGameAssetReporting.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local DsaIllegalContentReportingModule = require(Parent.DsaIllegalContentReporting)
local IsShowUKOSAIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowUKOSAIllegalContentReportingLink
local OSAReportLink = DsaIllegalContentReportingModule.OSAReportLink
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DefaultDualDropdownDialogModule = require(Parent.GenericAbuseReporting.DefaultDualDropdownDialog)
local DefaultDualDropdownDialogV2Module = require(Parent.GenericAbuseReporting.DefaultDualDropdownDialogV2)
local ConstantsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local GetPreselectedSurfaceValueModule = require(InGameAssetReporting.Utility.getPreselectedSurfaceValue)
local _ = require(InGameAssetReporting.Analysis.SceneAnalysis)
local FFlagPrefillPreciseSelectionChoices = require(Parent.SharedFlags).FFlagPrefillPreciseSelectionChoices
local FFlagGenericAbuseReportingGranularExports = require(Parent.SharedFlags).FFlagGenericAbuseReportingGranularExports
local FFlagDropUnroutableMultiReportOptions = require(Parent.SharedFlags).FFlagDropUnroutableMultiReportOptions

return function(p1) --[[ Line: 37 | Named "InGameAssetReportSubmitDialog" ]]
	-- upvalues: FFlagPrefillPreciseSelectionChoices (copy), UseLocalizationFunction (copy), GetPreselectedSurfaceValueModule (copy), ReactModule (copy), ConstantsModule (copy), FFlagDropUnroutableMultiReportOptions (copy), DefaultDualDropdownDialogV2Module (copy), DefaultDualDropdownDialogModule (copy), FFlagGenericAbuseReportingGranularExports (copy), IsShowUKOSAIllegalContentReportingLinkFunction (copy), View (copy), OSAReportLink (copy)
	local UseLocalizationResult = if FFlagPrefillPreciseSelectionChoices then UseLocalizationFunction({
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
	
	if FFlagPrefillPreciseSelectionChoices then
		local PreselectedSurfaceValueModule = GetPreselectedSurfaceValueModule(p1.extractionResult)
		local SurfaceAvatar = if PreselectedSurfaceValueModule == "avatar" then UseLocalizationResult.surfaceAvatar elseif PreselectedSurfaceValueModule == "item" then UseLocalizationResult.surfaceItem elseif PreselectedSurfaceValueModule == "text" then UseLocalizationResult.surfaceTextChat else nil
		ReactModule.useEffect(function() --[[ Line: 81 ]]
			-- upvalues: SurfaceAvatar (copy), p1 (copy), ConstantsModule (upval)
			if SurfaceAvatar then
				p1.analyticsDispatch({
					type = ConstantsModule.AnalyticsActions.SetPrefilledSurfaceSelection,
					prefilled_surface_selection = SurfaceAvatar
				})
			end
		end, { SurfaceAvatar })
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 195 ]]
			-- upvalues: FFlagDropUnroutableMultiReportOptions (upval), UseLocalizationResult (ref)
			return if FFlagDropUnroutableMultiReportOptions then {
				{
					value = "avatar",
					label = UseLocalizationResult.surfaceAvatar
				},
				{
					value = "drawing",
					label = UseLocalizationResult.surfaceDrawing
				},
				{
					value = "experience",
					label = UseLocalizationResult.surfaceExperience
				},
				{
					value = "item",
					label = UseLocalizationResult.surfaceItem
				},
				{
					value = "text",
					label = UseLocalizationResult.surfaceTextChat
				}
			} else {
				{
					value = "avatar",
					label = UseLocalizationResult.surfaceAvatar
				},
				{
					value = "drawing",
					label = UseLocalizationResult.surfaceDrawing
				},
				{
					value = "experience",
					label = UseLocalizationResult.surfaceExperience
				},
				{
					value = "item",
					label = UseLocalizationResult.surfaceItem
				},
				{
					value = "movement",
					label = UseLocalizationResult.surfaceMovement
				},
				{
					value = "music",
					label = UseLocalizationResult.surfaceMusic
				},
				{
					value = "text",
					label = UseLocalizationResult.surfaceTextChat
				},
				{
					value = "username",
					label = UseLocalizationResult.surfaceUsername
				}
			}
		end, {
			UseLocalizationResult.surfaceAvatar, UseLocalizationResult.surfaceDrawing,
			UseLocalizationResult.surfaceExperience, UseLocalizationResult.surfaceItem,
			UseLocalizationResult.surfaceMovement, UseLocalizationResult.surfaceMusic,
			UseLocalizationResult.surfaceTextChat, UseLocalizationResult.surfaceUsername
		})
		
		return ReactModule.createElement(DefaultDualDropdownDialogV2Module, {
			title = UseLocalizationResult.title,
			problems = ReactModule.useMemo(function() --[[ Line: 90 ]]
				-- upvalues: FFlagDropUnroutableMultiReportOptions (upval), UseLocalizationResult (ref)
				return if FFlagDropUnroutableMultiReportOptions then {
					{
						value = "bullying",
						label = UseLocalizationResult.problemBullying,
						description = UseLocalizationResult.problemBullyingDesc
					},
					{
						value = "dating",
						label = UseLocalizationResult.problemDating,
						description = UseLocalizationResult.problemDatingDesc
					},
					{
						value = "hate",
						label = UseLocalizationResult.problemHate,
						description = UseLocalizationResult.problemHateDesc
					},
					{
						value = "offsite links",
						label = UseLocalizationResult.problemLinks,
						description = UseLocalizationResult.problemLinksDesc
					},
					{
						value = "personal question",
						label = UseLocalizationResult.problemPersonal,
						description = UseLocalizationResult.problemPersonalDesc
					},
					{
						value = "swearing",
						label = UseLocalizationResult.problemSwearing,
						description = UseLocalizationResult.problemSwearingDesc
					},
					{
						value = "violence",
						label = UseLocalizationResult.problemViolence,
						description = UseLocalizationResult.problemViolenceDesc
					},
					{
						value = "ip infringement",
						label = UseLocalizationResult.problemIPInfringement,
						description = UseLocalizationResult.problemIPInfringementDesc
					}
				} else {
					{
						value = "bullying",
						label = UseLocalizationResult.problemBullying,
						description = UseLocalizationResult.problemBullyingDesc
					},
					{
						value = "exploiting",
						label = UseLocalizationResult.problemCheating,
						description = UseLocalizationResult.problemCheatingDesc
					},
					{
						value = "dating",
						label = UseLocalizationResult.problemDating,
						description = UseLocalizationResult.problemDatingDesc
					},
					{
						value = "hate",
						label = UseLocalizationResult.problemHate,
						description = UseLocalizationResult.problemHateDesc
					},
					{
						value = "offsite links",
						label = UseLocalizationResult.problemLinks,
						description = UseLocalizationResult.problemLinksDesc
					},
					{
						value = "personal question",
						label = UseLocalizationResult.problemPersonal,
						description = UseLocalizationResult.problemPersonalDesc
					},
					{
						value = "scamming",
						label = UseLocalizationResult.problemScamming,
						description = UseLocalizationResult.problemScammingDesc
					},
					{
						value = "swearing",
						label = UseLocalizationResult.problemSwearing,
						description = UseLocalizationResult.problemSwearingDesc
					},
					{
						value = "violence",
						label = UseLocalizationResult.problemViolence,
						description = UseLocalizationResult.problemViolenceDesc
					},
					{
						value = "ip infringement",
						label = UseLocalizationResult.problemIPInfringement,
						description = UseLocalizationResult.problemIPInfringementDesc
					}
				}
			end, {
				UseLocalizationResult.problemBullying,
				UseLocalizationResult.problemBullyingDesc,
				UseLocalizationResult.problemCheating,
				UseLocalizationResult.problemCheatingDesc, UseLocalizationResult.problemDating,
				UseLocalizationResult.problemDatingDesc, UseLocalizationResult.problemHate,
				UseLocalizationResult.problemHateDesc, UseLocalizationResult.problemLinks,
				UseLocalizationResult.problemLinksDesc, UseLocalizationResult.problemPersonal,
				UseLocalizationResult.problemPersonalDesc,
				UseLocalizationResult.problemScamming,
				UseLocalizationResult.problemScammingDesc,
				UseLocalizationResult.problemSwearing,
				UseLocalizationResult.problemSwearingDesc,
				UseLocalizationResult.problemViolence,
				UseLocalizationResult.problemViolenceDesc,
				UseLocalizationResult.problemIPInfringement,
				UseLocalizationResult.problemIPInfringementDesc
			}),
			surfaces = UseMemoResult,
			preselected = ReactModule.useMemo(function() --[[ Line: 227 ]]
				-- upvalues: PreselectedSurfaceValueModule (copy), UseMemoResult (copy)
				local Surface = nil
				
				if PreselectedSurfaceValueModule ~= nil and UseMemoResult ~= nil then
					local UseMemoResultEntry = nil
					for i = 1, #UseMemoResult do
						UseMemoResultEntry = UseMemoResult[i]
						
						if not UseMemoResultEntry or UseMemoResultEntry.value ~= PreselectedSurfaceValueModule then
							continue
						end
						Surface = UseMemoResultEntry
						break
					end
				end
				return { surface = Surface }
			end, { PreselectedSurfaceValueModule, UseMemoResult }),
			onClose = p1.onBack,
			onSubmit = p1.onSubmit
		})
	else
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 10,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			SubmitReportDialog = ReactModule.createElement(DefaultDualDropdownDialogModule, {
				analyticsContext = "Test",
				localizationKeys = {
					formTitle = "Feature.ReportAbuse.Title.SelectInSceneFinishYourReport",
					formSubmit = "Feature.ReportAbuse.Label.Report"
				},
				onSubmitProps = {
					hasNextSteps = true,
					onProceedToNextStep = if FFlagGenericAbuseReportingGranularExports then function(p2, p3, p4): boolean --[[ Line: 371 ]]
						-- upvalues: p1 (copy)
						p1.onSubmit(p2, p3, p4)
						
						return true
					end else p1.onSubmit
				},
				onCloseProps = { hasPreviousSteps = false, onAbandon = p1.onBack },
				footerContent = function() --[[ Line: 381 ]]
					-- upvalues: IsShowUKOSAIllegalContentReportingLinkFunction (upval), ReactModule (upval), View (upval), OSAReportLink (upval)
					return if IsShowUKOSAIllegalContentReportingLinkFunction() then ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, { OSALink = ReactModule.createElement(OSAReportLink) }) else nil
				end,
				reportProblems = if FFlagDropUnroutableMultiReportOptions then {
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
				reportSurfaces = if FFlagDropUnroutableMultiReportOptions then {
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
end