local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local archiveGameDialogModule = require(script.Parent.ArchiveGameDialog)
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local useScaledValue = foundationModule.Hooks.useScaledValue
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local releaseAnyFocusModule = require(buildExperience.utils.releaseAnyFocus)
local sharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).sharePublishedExperience
local useArchiveGameFlowModule = require(buildExperience.utils.useArchiveGameFlow)
local buildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

return function(p0) --[[ line: 56 | named "BuildOverflowMenuButton" ]]
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), useArchiveGameFlowModule (ref), creatorAgentChatModule (ref), signalsReactModule (ref), releaseAnyFocusModule (ref), sharePublishedExperience (ref), leaveExperienceModule (ref), archiveGameDialogModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	local var11 = useScaledValue(buildOverflowMenuWidth)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState(false)
	local var16 = p0.store.useItems()
	local var17 = useArchiveGameFlowModule()
	local var18 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: creatorAgentChatModule (copy), p0 (ref)
		return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p0.target.universeId, p0.target.placeId, p0.target.sessionId)
	end, {
		p0.target.universeId,
		p0.target.placeId,
		p0.target.sessionId
	}).getHasPublishedTurn)
	local var19 = reactModule.useMemo(function() --[[ line: 68 ]]
		-- upvalues: p0 (ref), var18 (ref)
		return {
			universeId = p0.target.universeId,
			placeId = p0.target.placeId,
			isNewGameTarget = p0.target.isNewGameTarget,
			hasPublishedTurn = var18
		}
	end, {
		p0.target.universeId,
		p0.target.placeId,
		p0.target.isNewGameTarget,
		var18
	})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var12,
			items = reactModule.useMemo(function() --[[ line: 84 ]]
				-- upvalues: var16 (ref), var19 (ref)
				local t = {}
				
				for i, v in var16 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = v_1.text,
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var19)
						})
					end
					table.insert(t, t_1)
				end
				return t
			end, { var16, var19 }),
			side = popoverSide.Bottom,
			align = popoverAlign.End,
			onPressedOutside = reactModule.useCallback(function() --[[ line: 114 ]]
				-- upvalues: var13 (ref)
				var13(false)
			end, {}),
			onActivated = reactModule.useCallback(function(p1) --[[ line: 118 ]]
				-- upvalues: var16 (ref), var19 (ref), var17 (ref), p0 (ref), releaseAnyFocusModule (copy), var15 (ref), sharePublishedExperience (copy), var13 (ref), leaveExperienceModule (copy)
				for i, v in var16 do
					for i_1, v_1 in v.items do
						if v_1.id == p1 then
							local var22 = if v_1.onActivated then v_1.onActivated(var19) else nil
							
							if var22 ~= nil then
								if var22.type == "archive" then
									var17.requestArchive(p0.target.universeId)
								elseif var22.type == "openPage" then
									if p0.onAction then
										p0.onAction(var22)
									end
								elseif var22.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var15(true)
								elseif var22.type == "share" then
									sharePublishedExperience(var22.placeId)
								elseif var22.type == "leaveExperience" then
									var13(false)
									leaveExperienceModule()
									
									return
								end
							end
							var13(false)
							
							return
						end
					end
				end
			end, {
				var16,
				var19,
				p0.onAction,
				var17.requestArchive,
				p0.target.universeId
			}),
			LayoutOrder = p0.layoutOrder,
			width = UDim.new(0, var11)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p0.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			onActivated = reactModule.useCallback(function() --[[ line: 105 ]]
				-- upvalues: var13 (ref), p0 (ref)
				var13(function(p2) --[[ line: 106 ]]
					return not p2
				end)
				
				if p0.onActivated then
					p0.onActivated()
				end
			end, { p0.onActivated })
		})),
		ArchiveDialog = if var17.isOpen then reactModule.createElement(archiveGameDialogModule, {
			isOpen = true,
			onArchive = reactModule.useCallback(function() --[[ line: 152 ]]
				-- upvalues: var17 (ref), p0 (ref)
				var17.confirm()
				
				if p0.onClose then
					p0.onClose()
				end
			end, { var17.confirm, p0.onClose }),
			onCancel = var17.cancel
		}) else nil,
		VersionHistory = if var14 and p0.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			placeId = p0.target.placeId,
			onClose = reactModule.useCallback(function() --[[ line: 148 ]]
				-- upvalues: var15 (ref)
				var15(false)
			end, {})
		}) else nil
	})
end