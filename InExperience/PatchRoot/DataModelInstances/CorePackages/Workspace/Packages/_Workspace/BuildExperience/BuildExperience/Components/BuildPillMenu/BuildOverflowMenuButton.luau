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
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
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
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildAdPromotionModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), fFlagBuildAgentRollbackModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
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
	local var15 = fFlagEnableBuildAdPromotionModule and (p1.onOpenGetUsersPage ~= nil and (p1.target.universeId ~= nil and p1.target.universeId ~= 0))
	local var16 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var14)) else true
	local var17 = p1.hasPublishedTurn == true
	local var18 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var17 (ref), var15 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var17,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = var15
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.isNewGameTarget, var17, p1.hasPublishedVersion, var15
	})
	local var19 = p1.store.useItems(var18)
	local var20 = if fFlagBuildLocalization then {} else nil
	
	if fFlagBuildLocalization and var18 ~= nil then
		for i, v in var19 do
			for i_1, v_1 in v.items do
				var20[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var18)
			end
		end
	end
	local var21 = if fFlagBuildLocalization then useLocalization(var20) else nil
	local var22 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: fFlagBuildLocalization (copy), var21 (ref), var18 (ref)
		return if fFlagBuildLocalization then var21[p2.id] elseif p2.getText == nil then p2.text else p2.getText(var18)
	end
	
	local function buildMenuItems()
		-- upvalues: var16 (ref), var18 (ref), var19 (ref), fFlagBuildLocalization (copy), var21 (ref), var8 (ref), var14 (ref), var22 (ref)
		local t = {}
		
		if not var16 then
			if var18 ~= nil then
				for i, v in var19 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = if fFlagBuildLocalization then var21[v_1.id] elseif v_1.getText ~= nil then v_1.text else v_1.getText(var18),
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var18),
							ref = if v_1.id == "share" then var8 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var14 then
				table.insert(t, { items = { var22.item } })
			end
		end
		return t
	end
	
	local var23 = if fFlagBuildLocalization then buildMenuItems() else reactModule.useMemo(buildMenuItems, {
		var16,
		var19,
		var18,
		var14,
		var22
	})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var7 (ref), var3 (ref), p1 (ref)
		if var16 then return end
		var7(false)
		var3(function(p2)
			return not p2
		end)
		
		if p1.onActivated then
			p1.onActivated()
		end
	end, { var16, p1.onActivated })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var7 (ref)
		var3(false)
		var7(false)
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var2 and not var16,
			items = var23,
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var25,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var14 (ref), var22 (ref), var3 (ref), var18 (ref), var19 (ref), p1 (ref), releaseAnyFocusModule (copy), var5 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var10 (ref), var11 (ref), var13 (ref), var7 (ref), leaveExperienceModule (copy)
				if var14 and var22 ~= nil and p2 == var22.item.id then
					var22.activate()
					var3(false)
					
					return
				elseif var18 == nil then return end
				for i, v in var19 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var27 = if v_1.onActivated then v_1.onActivated(var18) else nil
							
							if var27 ~= nil then
								if var27.type == "openPage" then
									if p1.onAction then
										p1.onAction(var27)
									end
								elseif var27.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(var27)
									end
								elseif var27.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif var27.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var5(true)
								elseif var27.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var10 ~= nil then
										var10()
									elseif var27.placeId ~= nil then
										var11(var27.placeId)
									end
								elseif var27.type == "confirmFriendsShare" then
									var13(var27.placeId)
								elseif var27.type == "showPrivateShareTooltip" then
									var7(function(p3)
										return not p3
									end)
									
									return
								elseif var27.type == "leaveExperience" then
									var3(false)
									leaveExperienceModule()
									
									return
								end
							end
							var3(false)
							
							return
						end
					end
				end
			end, {
				var19, var18, p1.onAction, p1.onOpenGetUsersPage, var10, var11, var14, var22
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, var1)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var16,
			onActivated = var24
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
			isOpen = var2 and var6,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var25 else nil
		}),
		VersionHistory = if var4 and p1.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = var26,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var26 else nil
		}) else nil
	})
end