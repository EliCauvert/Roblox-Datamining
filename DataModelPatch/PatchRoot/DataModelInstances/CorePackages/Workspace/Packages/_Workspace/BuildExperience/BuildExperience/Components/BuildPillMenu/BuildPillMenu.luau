local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local AgentDetailMenuModule = require(script.Parent.AgentDetailMenu)
local BuildOverflowMenuButtonModule = require(script.Parent.BuildOverflowMenuButton)
local GetBuildOverflowMenuStoreModule = require(BuildExperience.Stores.GetBuildOverflowMenuStore)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local UseSessionSummaryModule = require(BuildExperience.Chat.useSessionSummary)

return function(p1)
	-- upvalues: GetBuildOverflowMenuStoreModule (copy), ReactModule (copy), CreatorAgentChatModule (copy), UseSessionSummaryModule (copy), View (copy), AgentDetailMenuModule (copy), BuildOverflowMenuButtonModule (copy), IconName (copy)
	local Store = p1.store or GetBuildOverflowMenuStoreModule()
	local UseSessionSummaryModuleResult = UseSessionSummaryModule((ReactModule.useMemo(function()
		-- upvalues: CreatorAgentChatModule (upval), p1 (copy)
		return CreatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p1.target.universeId, p1.target.placeId, p1.target.sessionId)
	end, {
		p1.target.universeId,
		p1.target.placeId,
		p1.target.sessionId
	})))
	local SubagentTaskState = UseSessionSummaryModuleResult.subagentTaskState
	local v1: boolean = SubagentTaskState ~= nil and #SubagentTaskState.groups > 0
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Pill = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall size-0-1100 auto-x padding-x-xsmall radius-circle clip bg-over-media-0",
			Position = p1.position,
			AnchorPoint = p1.anchorPoint,
			LayoutOrder = p1.layoutOrder,
			testId = p1.testId
		}, {
			AgentDetail = ReactModule.createElement(AgentDetailMenuModule, {
				layoutOrder = 1,
				isDisabled = not v1,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: v1 (copy), p1 (copy)
					if not v1 then return end
					if p1.onOpenAgentsPage then
						p1.onOpenAgentsPage()
					end
				end, { v1, p1.onOpenAgentsPage })
			}),
			Overflow = ReactModule.createElement(BuildOverflowMenuButtonModule, {
				layoutOrder = 2,
				icon = IconName.ThreeDotsHorizontal,
				store = Store,
				target = p1.target,
				hasPublishedTurn = UseSessionSummaryModuleResult.hasPublishedTurn,
				onAction = ReactModule.useCallback(function(p2)
					-- upvalues: p1 (copy)
					if p2.type == "openPage" then
						if p1.onOpenPage then
							p1.onOpenPage(p2.page)
							
							return
						end
					elseif p1.onAction then
						p1.onAction(p2)
					end
				end, { p1.onAction, p1.onOpenPage })
			})
		})
	})
end