local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local privateShareTooltipModule = require(buildExperience.Components.ShareAudience.PrivateShareTooltip)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local useSharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local useCreatorCreditMenuItem = require(script.Parent.useCreatorCreditMenuItem).useCreatorCreditMenuItem
local fFlagBuildDesktopReadinessModule = require(buildExperience.Flags.FFlagBuildDesktopReadiness)
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagBuildExperienceTooltipsLightDismissModule = require(buildExperience.Flags.FFlagBuildExperienceTooltipsLightDismiss)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local useScaledValue = foundationModule.Hooks.useScaledValue
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local releaseAnyFocusModule = require(buildExperience.utils.releaseAnyFocus)
local buildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

local function _(p1, p2)
	return if p1.getText == nil then p1.text else p1.getText(p2)
end

return function(p1)
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), fFlagBuildAgentRollbackModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var1 = useScaledValue(buildOverflowMenuWidth)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(nil)
	local var9 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p1.target.universeId, p1.target.placeId) else nil
	local var10 = if var9 ~= nil then nil else var9.onShare
	local var11 = useSharePublishedExperience(p1.target.universeId)
	local var12, var13 = reactModule.useState(nil)
	local var14 = p1.onOpenCreatorCreditPage ~= nil
	local var15 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var14)) else true
	local var16 = p1.hasPublishedTurn == true
	local var17 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var16 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var16,
			hasPublishedVersion = p1.hasPublishedVersion == true
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.isNewGameTarget, var16, p1.hasPublishedVersion
	})
	local var1 = p1.store.useItems(var17)
	local var2 = if fFlagBuildLocalization then {} else nil
	
	if fFlagBuildLocalization and var17 ~= nil then
		for i, v in var1 do
			for i_1, v_1 in v.items do
				var2[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var17)
			end
		end
	end
	local var3 = if fFlagBuildLocalization then useLocalization(var2) else nil
	local var4 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: fFlagBuildLocalization (copy), var3 (ref), var17 (ref)
		return if fFlagBuildLocalization then var3[p2.id] elseif p2.getText == nil then p2.text else p2.getText(var17)
	end
	
	local function buildMenuItems()
		-- upvalues: var15 (ref), var17 (ref), var1 (ref), fFlagBuildLocalization (copy), var3 (ref), var8 (ref), var14 (ref), var4 (ref)
		local t = {}
		
		if not var15 then
			if var17 ~= nil then
				for i, v in var1 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = if fFlagBuildLocalization then var3[v_1.id] elseif v_1.getText ~= nil then v_1.text else v_1.getText(var17),
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var17),
							ref = if v_1.id == "share" then var8 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var14 then
				table.insert(t, { items = { var4.item } })
			end
		end
		return t
	end
	
	local var18 = if fFlagBuildLocalization then buildMenuItems() else reactModule.useMemo(buildMenuItems, {
		var15,
		var18,
		var17,
		var14,
		var4
	})
	local var19 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var7 (ref), var3 (ref), p1 (ref)
		if var15 then return end
		var7(false)
		var3(function(p2)
			return not p2
		end)
		
		if p1.onActivated then
			p1.onActivated()
		end
	end, { var15, p1.onActivated })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var7 (ref)
		var20(false)
		var7(false)
	end, {})
	local var21 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var19 and not var15,
			items = var18,
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var20,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var14 (ref), var21 (ref), var20 (ref), var17 (ref), var18 (ref), p2 (ref), releaseAnyFocusModule (copy), var5 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var10 (ref), var11 (ref), var13 (ref), var7 (ref), leaveExperienceModule (copy)
				if var14 and var21 ~= nil and p2 == var21.item.id then
					var21.activate()
					var20(false)
					
					return
				elseif var17 == nil then return end
				for i, v in var18 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var22 = if v_1.onActivated then v_1.onActivated(var17) else nil
							
							if var22 ~= nil then
								if var22.type == "openPage" then
									if p2.onAction then
										p2.onAction(var22)
									end
								elseif var22.type == "openInvitePicker" then
									if p2.onAction then
										p2.onAction(var22)
									end
								elseif var22.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var5(true)
								elseif var22.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var10 ~= nil then
										var10()
									elseif var22.placeId ~= nil then
										var11(var22.placeId)
									end
								elseif var22.type == "confirmFriendsShare" then
									var13(var22.placeId)
								elseif var22.type == "showPrivateShareTooltip" then
									var7(function(p3)
										return not p3
									end)
									
									return
								elseif var22.type == "leaveExperience" then
									var20(false)
									leaveExperienceModule()
									
									return
								end
							end
							var20(false)
							
							return
						end
					end
				end
			end, {
				var22, var17, p2.onAction, var10, var11, var14, var21
			}),
			LayoutOrder = p2.layoutOrder,
			width = UDim.new(0, var22)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p2.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var15,
			onActivated = var19
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var9 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var9.activeDialog,
			hasShareError = var9.hasShareError,
			onCancel = var9.onCancelDialog,
			onConfirmFriends = var9.onConfirmFriends,
			onConfirmPlaytesters = var9.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var12 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var13 (ref)
				var13(nil)
			end, {}),
			onShare = reactModule.useCallback(function()
				-- upvalues: var12 (ref), var13 (ref), var11 (ref)
				var13(nil)
				
				if var12 ~= nil then
					var11(var12)
				end
			end, { var12, var11 })
		}),
		PrivateShareTooltip = reactModule.createElement(privateShareTooltipModule, {
			anchorRef = var8,
			isOpen = var19 and var6,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var20 else nil
		}),
		VersionHistory = if var21 and p2.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p2.target.universeId,
			placeId = p2.target.placeId,
			onClose = var21,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var21 else nil
		}) else nil
	})
end