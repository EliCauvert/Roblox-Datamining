local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local agentDetailMenuModule = require(script.Parent.AgentDetailMenu)
local buildOverflowMenuButtonModule = require(script.Parent.BuildOverflowMenuButton)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)
local fFlagBuildExperienceRemoveAgentTaskUiModule = require(buildExperience.Flags.FFlagBuildExperienceRemoveAgentTaskUi)

return function(p1)
	-- upvalues: getBuildOverflowMenuStoreModule (ref), publishStatusModule (ref), reactModule (ref), view (ref), fFlagBuildExperienceRemoveAgentTaskUiModule (ref), agentDetailMenuModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), buildOverflowMenuButtonModule (ref)
	local var1 = publishStatusModule.usePublishStatus(p1.target)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			testId = p1.testId
		}, {
			AgentDetail = if not fFlagBuildExperienceRemoveAgentTaskUiModule then reactModule.createElement(agentDetailMenuModule, {
				layoutOrder = 1,
				onActivated = p1.onOpenAgentsPage or function() end
			}) else nil,
			AssetLibrary = if fFlagBuildExperienceAssetLibraryModule then reactModule.createElement(iconButton, {
				LayoutOrder = 2,
				isCircular = true,
				testId = "build-header-asset-library-menu",
				icon = iconName.SquaresGridPlus,
				onActivated = p1.onOpenAssetLibraryPage,
				size = inputSize.Medium,
				variant = buttonVariant.Utility
			}) else nil,
			Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
				layoutOrder = 3,
				icon = iconName.ThreeDotsHorizontal,
				store = p1.store or getBuildOverflowMenuStoreModule(),
				target = p1.target,
				hasPublishedTurn = var1.hasPublishedTurn,
				hasPublishedVersion = var1.hasPublishedVersion,
				onAction = reactModule.useCallback(function(p2)
					-- upvalues: p1 (ref)
					if p2.type == "openPage" then
						if p1.onOpenPage then
							p1.onOpenPage(p2.page)
							
							return
						end
					elseif p2.type == "openInvitePicker" then
						if p1.onOpenInvitePicker then
							p1.onOpenInvitePicker()
							
							return
						end
					elseif p1.onAction then
						p1.onAction(p2)
					end
				end, { p1.onAction, p1.onOpenPage, p1.onOpenInvitePicker }),
				onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage
			})
		})
	})
end