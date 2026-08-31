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
local useGetAdCampaignEligibilityModule = require(buildExperience.Components.Ads.useGetAdCampaignEligibility)
local adCampaignEligibilityUtilsModule = require(buildExperience.Components.Ads.adCampaignEligibilityUtils)
local iconButton = foundationModule.IconButton
local menu = foundationModule.Menu
local useScaledValue = foundationModule.Hooks.useScaledValue
local badgeVariant = foundationModule.Enums.BadgeVariant
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
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildAdPromotionModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), badgeVariant (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), fFlagBuildAgentRollbackModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
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
	local var16 = if fFlagEnableBuildAdPromotionModule then useGetAdCampaignEligibilityModule(if var15 then p1.target.universeId else nil) else nil
	local var17 = var16 ~= nil and var16.userEligible == true
	local var18 = var16 ~= nil and (var16.universeEligible == true and p1.isUniversePublic == true)
	local var19 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var16)
	local var20 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var14)) else true
	local var21 = p1.hasPublishedTurn == true
	local var22 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var21 (ref), var15 (ref), var17 (ref), var18 (ref), var19 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var21,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = var15,
			getUsersUserEligible = var17,
			getUsersUniverseEligible = var18,
			getUsersFreeCreditsRemaining = var19
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.isNewGameTarget, var21, p1.hasPublishedVersion, var15, var17, var18,
		var19
	})
	local var23 = p1.store.useItems(var22)
	local var24 = if fFlagBuildLocalization then {} else nil
	
	if fFlagBuildLocalization and var22 ~= nil then
		for i, v in var23 do
			for i_1, v_1 in v.items do
				var24[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var22)
				local var25 = if v_1.getTrailingText ~= nil then nil else v_1.getTrailingText(var22)
				
				if var25 ~= nil then
					var24[v_1.id .. ":trailing"] = var25
				end
			end
		end
	end
	local var26 = if fFlagBuildLocalization then useLocalization(var24) else nil
	local var27 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: fFlagBuildLocalization (copy), var26 (ref), var22 (ref)
		return if fFlagBuildLocalization then var26[p2.id] elseif p2.getText == nil then p2.text else p2.getText(var22)
	end
	
	local function getItemTrailing(p2)
		-- upvalues: var22 (ref), fFlagBuildLocalization (copy), var26 (ref), badgeVariant (copy)
		if p2.getTrailingText == nil then
			return nil
		end
		local trailingText = p2.getTrailingText(var22)
		
		return if trailingText == nil then nil else {
			type = "Badge",
			text = if fFlagBuildLocalization then var26[p2.id .. ":trailing"] else trailingText,
			variant = badgeVariant.Standard
		}
	end
	
	local function buildMenuItems()
		-- upvalues: var20 (ref), var22 (ref), var23 (ref), fFlagBuildLocalization (copy), var26 (ref), getItemTrailing (ref), var8 (ref), var14 (ref), var27 (ref)
		local t = {}
		
		if not var20 then
			if var22 ~= nil then
				for i, v in var23 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = if fFlagBuildLocalization then var26[v_1.id] elseif v_1.getText ~= nil then v_1.text else v_1.getText(var22),
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var22),
							trailing = getItemTrailing(v_1),
							ref = if v_1.id == "share" then var8 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var14 then
				table.insert(t, { items = { var27.item } })
			end
		end
		return t
	end
	
	local var28 = if fFlagBuildLocalization then buildMenuItems() else reactModule.useMemo(buildMenuItems, {
		var20,
		var23,
		var22,
		var14,
		var27
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var7 (ref), var3 (ref), p1 (ref)
		if var20 then return end
		var7(false)
		var3(function(p2)
			return not p2
		end)
		
		if p1.onActivated then
			p1.onActivated()
		end
	end, { var20, p1.onActivated })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var7 (ref)
		var3(false)
		var7(false)
	end, {})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var5 (ref)
		var5(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var2 and not var20,
			items = var28,
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var30,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var14 (ref), var27 (ref), var3 (ref), var22 (ref), var23 (ref), p1 (ref), releaseAnyFocusModule (copy), var5 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var10 (ref), var11 (ref), var13 (ref), var7 (ref), leaveExperienceModule (copy)
				if var14 and var27 ~= nil and p2 == var27.item.id then
					var27.activate()
					var3(false)
					
					return
				elseif var22 == nil then return end
				for i, v in var23 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var32 = if v_1.onActivated then v_1.onActivated(var22) else nil
							
							if var32 ~= nil then
								if var32.type == "openPage" then
									if p1.onAction then
										p1.onAction(var32)
									end
								elseif var32.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(var32)
									end
								elseif var32.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif var32.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var5(true)
								elseif var32.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var10 ~= nil then
										var10()
									elseif var32.placeId ~= nil then
										var11(var32.placeId)
									end
								elseif var32.type == "confirmFriendsShare" then
									var13(var32.placeId)
								elseif var32.type == "showPrivateShareTooltip" then
									var7(function(p3)
										return not p3
									end)
									
									return
								elseif var32.type == "leaveExperience" then
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
				var23, var22, p1.onAction, p1.onOpenGetUsersPage, var10, var11, var14, var27
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, var1)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var20,
			onActivated = var29
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
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var30 else nil
		}),
		VersionHistory = if var4 and p1.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = var31,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var31 else nil
		}) else nil
	})
end