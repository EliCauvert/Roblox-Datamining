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

return function(p1)
	-- upvalues: getBuildOverflowMenuStoreModule (ref), publishStatusModule (ref), reactModule (ref), fFlagBuildExperienceAssetLibraryModule (ref), view (ref), agentDetailMenuModule (ref), iconName (ref), buildOverflowMenuButtonModule (ref)
	local var1 = publishStatusModule.usePublishStatus(p1.target)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Pill = reactModule.createElement(view, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			testId = p1.testId
		}, {
			AgentDetail = reactModule.createElement(agentDetailMenuModule, {
				layoutOrder = 1,
				icon = if fFlagBuildExperienceAssetLibraryModule then iconName.SquaresGridPlus else nil,
				onActivated = reactModule.useCallback(function()
					-- upvalues: fFlagBuildExperienceAssetLibraryModule (copy), p1 (ref)
					if fFlagBuildExperienceAssetLibraryModule and p1.onOpenAssetLibraryPage then
						p1.onOpenAssetLibraryPage()
						
						return
					elseif p1.onOpenAgentsPage then
						p1.onOpenAgentsPage()
					end
				end, { p1.onOpenAgentsPage, p1.onOpenAssetLibraryPage })
			}),
			Overflow = reactModule.createElement(buildOverflowMenuButtonModule, {
				layoutOrder = 2,
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