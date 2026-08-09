local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local experienceGuidelinesModule = require(parent.DataHydration.ExperienceGuidelines)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local gameConfigurationLabelsModule = require(buildExperience.utils.GameConfigurationLabels)
local archiveGameDialogModule = require(buildExperience.Components.BuildPillMenu.ArchiveGameDialog)
local gameConfigurationActionsModule = require(buildExperience.utils.GameConfigurationActions)
local useArchiveGameFlowModule = require(buildExperience.utils.useArchiveGameFlow)
local gameConfigurationListModule = require(script.Parent.Parent.GameConfigurationList.GameConfigurationList)
local text = foundationModule.Text
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local myStatsMediaSelector = game:DefineFastFlag("MyStatsMediaSelector", false)

return function(p0) --[[ line: 43 | named "GameConfigurationContent" ]]
	-- upvalues: useOpenWebView (ref), useArchiveGameFlowModule (ref), reactModule (ref), universeConfigurationModule (ref), experienceGuidelinesModule (ref), signalsReactModule (ref), gameConfigurationLabelsModule (ref), gameConfigurationActionsModule (ref), myStatsMediaSelector (ref), iconName (ref), view (ref), gameConfigurationListModule (ref), text (ref), archiveGameDialogModule (ref)
	local testId = p0.testId or "game-configuration-content"
	local var13 = useOpenWebView()
	local var14 = useArchiveGameFlowModule()
	local var15 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 47 ]]
		-- upvalues: universeConfigurationModule (copy), p0 (ref)
		return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchConfiguration(p0.universeId)
	end, { p0.universeId }).data)
	local var16 = if var15 then gameConfigurationLabelsModule.getAudienceText(var15) or gameConfigurationLabelsModule.UNKNOWN_AUDIENCE_TEXT else "Loading..."
	local data = gameConfigurationLabelsModule.getContentRatingText(signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: experienceGuidelinesModule (copy), p0 (ref)
		return experienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchDetailedGuidelines(p0.universeId)
	end, { p0.universeId }).data)) or "Loading..."
	local var18 = reactModule.useCallback(function() --[[ line: 60 ]]
		-- upvalues: var13 (ref), gameConfigurationActionsModule (copy), p0 (ref)
		var13(gameConfigurationActionsModule.getCreatorHubConfigureUrl(p0.universeId), "Creator Hub")
	end, { var13, p0.universeId })
	local var19 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var13 (ref), gameConfigurationActionsModule (copy), p0 (ref)
		var13(gameConfigurationActionsModule.getExperienceQuestionnaireUrl(p0.universeId), "Creator Hub")
	end, { var13, p0.universeId })
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-large",
		LayoutOrder = p0.layoutOrder,
		testId = testId
	}, {
		GameDetails = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 1,
			title = "Game Details",
			body = "Manage how your game appears to others.",
			rows = reactModule.useMemo(function() --[[ line: 69 ]]
				-- upvalues: myStatsMediaSelector (copy), iconName (copy), p0 (ref), var18 (ref)
				return {
					{
						id = "icon-thumbnails",
						title = "Icon & Thumbnails",
						trailingIcon = if myStatsMediaSelector then nil else iconName.ArrowUpRightFromSquare,
						onActivated = if myStatsMediaSelector then p0.onOpenMediaSelectionPage else var18
					},
					{
						id = "title-description",
						title = "Title & Description",
						trailingIcon = nil,
						description = p0.experienceName,
						onActivated = p0.onOpenTitleDescriptionPage
					}
				}
			end, {
				var18,
				p0.experienceName,
				p0.onOpenMediaSelectionPage,
				p0.onOpenTitleDescriptionPage
			}),
			testId = `{testId}-game-details`
		}),
		Access = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 2,
			title = "Access",
			body = "Choose who can play after you publish this experience.",
			rows = reactModule.useMemo(function() --[[ line: 91 ]]
				-- upvalues: var16 (ref), p0 (ref), data (ref), iconName (copy), var19 (ref)
				return {
					{
						id = "audience",
						title = "Audience",
						trailingIcon = nil,
						description = var16,
						onActivated = p0.onOpenAudiencePage
					},
					{
						id = "content-rating",
						title = "Content rating",
						description = data,
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var19
					}
				}
			end, { var16, data, var19, p0.onOpenAudiencePage }),
			testId = `{testId}-access`
		}),
		CreatorHub = reactModule.createElement(gameConfigurationListModule, {
			layoutOrder = 3,
			title = "Creator Hub",
			rows = reactModule.useMemo(function() --[[ line: 110 ]]
				-- upvalues: iconName (copy), var18 (ref)
				return {
					{
						id = "creator-hub",
						title = "Creator Hub",
						description = "Manage all settings on Creator Hub",
						trailingIcon = iconName.ArrowUpRightFromSquare,
						onActivated = var18
					}
				}
			end, { var18 }),
			testId = `{testId}-creator-hub`
		}),
		ArchiveGame = reactModule.createElement(view, {
			LayoutOrder = 4,
			tag = "row align-y-center size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			onActivated = reactModule.useCallback(function() --[[ line: 122 ]]
				-- upvalues: var14 (ref), p0 (ref)
				var14.requestArchive(p0.universeId)
			end, { var14.requestArchive, p0.universeId }),
			stateLayer = {},
			testId = `{testId}-archive-game`
		}, {
			Label = reactModule.createElement(text, {
				LayoutOrder = 1,
				Text = "Archive game",
				tag = "fill auto-y text-title-medium text-align-x-left content-default"
			})
		}),
		ArchiveDialog = reactModule.createElement(archiveGameDialogModule, {
			isOpen = var14.isOpen,
			onArchive = var14.confirm,
			onCancel = var14.cancel
		})
	})
end