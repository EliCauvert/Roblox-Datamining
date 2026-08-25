local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local agentDetailMenuModule = require(script.Parent.AgentDetailMenu)
local buildOverflowMenuButtonModule = require(script.Parent.BuildOverflowMenuButton)
local getBuildOverflowMenuStoreModule = require(buildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local publishStatusModule = require(buildExperience.Chat.PublishStatus)
local fFlagBuildExperienceAssetLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceAssetLibrary)

return function(p0)
	-- upvalues: getBuildOverflowMenuStoreModule (ref), publishStatusModule (ref), reactModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), view (ref), agentDetailMenuModule (ref), iconName (ref), buildOverflowMenuButtonModule (ref)
	local var8 = publishStatusModule.usePublishStatus(p0.target)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p0.position,
			AnchorPoint = p0.anchorPoint,
			LayoutOrder = p0.layoutOrder,
			testId = p0.testId
		}, {
			AgentDetail = reactModule.createElement(agentDetailMenuModule, {
				layoutOrder = 1,
				icon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
				onActivated = reactModule.useCallback(function()
					-- upvalues: fFlagBuildExperienceAssetLibraryModule (copy), p0 (ref)
					if fFlagBuildExperienceAssetLibraryModule and p0.onOpenAssetLibraryPage then
						p0.onOpenAssetLibraryPage()
						
						return
					elseif p0.onOpenAgentsPage then
						p0.onOpenAgentsPage()
					end
				end, { p0.onOpenAgentsPage, p0.onOpenAssetLibraryPage })
			}),
			Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
				layoutOrder = 2,
				icon = iconName.ThreeDotsHorizontal,
				store = p0.store or getBuildOverflowMenuStoreModule(),
				target = p0.target,
				hasPublishedTurn = var8.hasPublishedTurn,
				hasPublishedVersion = var8.hasPublishedVersion,
				onAction = reactModule.useCallback(function(p1)
					-- upvalues: p0 (ref)
					if p1.type == "openPage" then
						if p0.onOpenPage then
							p0.onOpenPage(p1.page)
							
							return
						end
					elseif p1.type == "openInvitePicker" then
						if p0.onOpenInvitePicker then
							p0.onOpenInvitePicker()
							
							return
						end
					elseif p0.onAction then
						p0.onAction(p1)
					end
				end, { p0.onAction, p0.onOpenPage, p0.onOpenInvitePicker }),
				onOpenCreatorCreditPage = p0.onOpenCreatorCreditPage
			})
		})
	})
end