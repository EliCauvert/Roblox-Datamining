local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local BuildOverflowMenuButtonModule = require(script.Parent.BuildOverflowMenuButton)
local StopPlaytestButtonModule = require(script.Parent.StopPlaytestButton)
local GetBuildOverflowMenuStoreModule = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local PublishStatusModule = require(BuildExperience.Chat.PublishStatus)
local LeaveExperienceModule = require(BuildExperience.utils.leaveExperience)
local FFlagBuildExperienceMenuImprovementsModule = require(BuildExperience.Flags.FFlagBuildExperienceMenuImprovements)

return function(p1)
	-- upvalues: GetBuildOverflowMenuStoreModule (copy), PublishStatusModule (copy), ReactModule (copy), View (copy), FFlagBuildExperienceMenuImprovementsModule (copy), StopPlaytestButtonModule (copy), LeaveExperienceModule (copy), BuildOverflowMenuButtonModule (copy), IconName (copy)
	local UsePublishStatusResult = PublishStatusModule.usePublishStatus(p1.target)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Pill = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			testId = p1.testId
		}, {
			StopPlaytest = if FFlagBuildExperienceMenuImprovementsModule then ReactModule.createElement(StopPlaytestButtonModule, {
				layoutOrder = 0,
				onActivated = function()
					-- upvalues: LeaveExperienceModule (upval)
					LeaveExperienceModule()
				end
			}) else nil,
			Overflow = ReactModule.createElement(BuildOverflowMenuButtonModule, {
				layoutOrder = 3,
				icon = IconName.ThreeDotsHorizontal,
				store = p1.store or GetBuildOverflowMenuStoreModule(),
				target = p1.target,
				hasPublishedTurn = UsePublishStatusResult.hasPublishedTurn,
				hasPublishedVersion = UsePublishStatusResult.hasPublishedVersion,
				onAction = ReactModule.useCallback(function(p2)
					-- upvalues: p1 (copy)
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
					elseif p2.type == "openInviteManagement" then
						if p1.onOpenPlaytestManagement then
							p1.onOpenPlaytestManagement()
							
							return
						end
					elseif p1.onAction then
						p1.onAction(p2)
					end
				end, {
					p1.onAction,
					p1.onOpenPage,
					p1.onOpenInvitePicker,
					p1.onOpenPlaytestManagement
				}),
				onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage
			})
		})
	})
end