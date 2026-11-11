local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local GameConfigurationLabelsModule = require(BuildExperience.utils.GameConfigurationLabels)
local ArchiveGameDialogModule = require(BuildExperience.Components.BuildPillMenu.ArchiveGameDialog)
local GameConfigurationActionsModule = require(BuildExperience.utils.GameConfigurationActions)
local UseArchiveGameFlowModule = require(BuildExperience.utils.useArchiveGameFlow)
local GameConfigurationListModule = require(script.Parent.Parent.GameConfigurationList.GameConfigurationList)
local Text = FoundationModule.Text
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local MyStatsMediaSelector = game:DefineFastFlag("MyStatsMediaSelector", false)

return function(p1)
	-- upvalues: UseOpenWebViewFunction (copy), UseArchiveGameFlowModule (copy), ReactModule (copy), UniverseConfigurationModule (copy), ExperienceGuidelinesModule (copy), SignalsReactModule (copy), GameConfigurationLabelsModule (copy), GameConfigurationActionsModule (copy), MyStatsMediaSelector (copy), IconName (copy), View (copy), GameConfigurationListModule (copy), Text (copy), ArchiveGameDialogModule (copy)
	local TestId = p1.testId or "game-configuration-content"
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseArchiveGameFlowModuleResult = UseArchiveGameFlowModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: UniverseConfigurationModule (upval), p1 (copy)
		return UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p1.universeId)
	end, { p1.universeId }).data)
	local AudienceText = if UseSignalStateResult then GameConfigurationLabelsModule.getAudienceText(UseSignalStateResult) or GameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT else "Loading..."
	local ContentRatingText = GameConfigurationLabelsModule.getContentRatingText((SignalsReactModule.useSignalState(ReactModule.useMemo(function()
		-- upvalues: ExperienceGuidelinesModule (upval), p1 (copy)
		return ExperienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p1.universeId)
	end, { p1.universeId }).data))) or "Loading..."
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getCreatorHubConfigureUrl(p1.universeId), "Creator Hub")
	end, { UseOpenWebViewResult, p1.universeId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseOpenWebViewResult (copy), GameConfigurationActionsModule (upval), p1 (copy)
		UseOpenWebViewResult(GameConfigurationActionsModule.getExperienceQuestionnaireUrl(p1.universeId), "Creator Hub")
	end, { UseOpenWebViewResult, p1.universeId })
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge size-full-0 auto-y padding-y-large",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		GameDetails = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 1,
			title = "Game Details",
			body = "Manage how your game appears to others.",
			rows = ReactModule.useMemo(function()
				-- upvalues: MyStatsMediaSelector (upval), IconName (upval), p1 (copy), UseResult (copy)
				return {
					{
						id = "icon-thumbnails",
						title = "Icon & Thumbnails",
						trailingIcon = if MyStatsMediaSelector then nil else IconName.ArrowUpRightFromSquare,
						onActivated = if MyStatsMediaSelector then p1.onOpenMediaSelectionPage else UseResult
					},
					{
						id = "title-description",
						title = "Title & Description",
						trailingIcon = nil,
						description = p1.experienceName,
						onActivated = p1.onOpenTitleDescriptionPage
					}
				}
			end, {
				UseResult,
				p1.experienceName,
				p1.onOpenMediaSelectionPage,
				p1.onOpenTitleDescriptionPage
			}),
			testId = `{TestId}-game-details`
		}),
		Access = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 2,
			title = "Access",
			body = "Choose who can play after you publish this experience.",
			rows = ReactModule.useMemo(function()
				-- upvalues: AudienceText (copy), p1 (copy), ContentRatingText (copy), IconName (upval), UseResult1 (copy)
				return {
					{
						id = "audience",
						title = "Audience",
						trailingIcon = nil,
						description = AudienceText,
						onActivated = p1.onOpenAudiencePage
					},
					{
						id = "content-rating",
						title = "Content rating",
						description = ContentRatingText,
						trailingIcon = IconName.ArrowUpRightFromSquare,
						onActivated = UseResult1
					}
				}
			end, {
				AudienceText,
				ContentRatingText,
				UseResult1,
				p1.onOpenAudiencePage
			}),
			testId = `{TestId}-access`
		}),
		CreatorHub = ReactModule.createElement(GameConfigurationListModule, {
			layoutOrder = 3,
			title = "Creator Hub",
			rows = ReactModule.useMemo(function()
				-- upvalues: IconName (upval), UseResult (copy)
				return {
					{
						id = "creator-hub",
						title = "Creator Hub",
						description = "Manage all settings on Creator Hub",
						trailingIcon = IconName.ArrowUpRightFromSquare,
						onActivated = UseResult
					}
				}
			end, { UseResult }),
			testId = `{TestId}-creator-hub`
		}),
		ArchiveGame = ReactModule.createElement(View, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = ReactModule.useCallback(function()
				-- upvalues: UseArchiveGameFlowModuleResult (copy), p1 (copy)
				UseArchiveGameFlowModuleResult.requestArchive(p1.universeId)
			end, {
				UseArchiveGameFlowModuleResult.requestArchive,
				p1.universeId
			}),
			stateLayer = {},
			testId = `{TestId}-archive-game`
		}, {
			Label = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				Text = "Archive game",
				tag = "fill auto-y text-title-medium text-align-x-left content-default"
			})
		}),
		ArchiveDialog = ReactModule.createElement(ArchiveGameDialogModule, {
			isOpen = UseArchiveGameFlowModuleResult.isOpen,
			onArchive = UseArchiveGameFlowModuleResult.confirm,
			onCancel = UseArchiveGameFlowModuleResult.cancel
		})
	})
end