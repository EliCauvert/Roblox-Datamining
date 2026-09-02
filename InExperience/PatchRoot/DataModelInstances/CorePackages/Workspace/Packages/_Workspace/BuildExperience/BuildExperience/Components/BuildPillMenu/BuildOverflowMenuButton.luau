local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local privateShareTooltipModule = require(buildExperience.Components.ShareAudience.PrivateShareTooltip)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local useSharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local var1 = if not fFlagBuildExperienceMonetizationNativeUIModule then require(parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products") else nil
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
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), useOpenWebView (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildAdPromotionModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), badgeVariant (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var1 (ref), localizationStringsModule (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), fFlagBuildAgentRollbackModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), privateShareTooltipModule (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var2 = useScaledValue(buildOverflowMenuWidth)
	local var3 = useOpenWebView()
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useRef(nil)
	local var11 = if fFlagBuildExperiencePrivateInvitesModule then useExperienceShareFlowModule(p1.target.universeId, p1.target.placeId) else nil
	local var12 = if var11 ~= nil then nil else var11.onShare
	local var13 = useSharePublishedExperience(p1.target.universeId)
	local var14, var15 = reactModule.useState(nil)
	local var16 = p1.onOpenCreatorCreditPage ~= nil
	local var17 = fFlagEnableBuildAdPromotionModule and (p1.onOpenGetUsersPage ~= nil and (p1.target.universeId ~= nil and p1.target.universeId ~= 0))
	local var18 = if fFlagEnableBuildAdPromotionModule then useGetAdCampaignEligibilityModule(if var17 then p1.target.universeId else nil) else nil
	local var19 = var18 ~= nil and var18.userEligible == true
	local var20 = var18 ~= nil and (var18.universeEligible == true and p1.isUniversePublic == true)
	local var21 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var18)
	local var22 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var16)) else true
	local var23 = p1.hasPublishedTurn == true
	local var24 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var23 (ref), var17 (ref), var19 (ref), var20 (ref), var21 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var23,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = var17,
			getUsersUserEligible = var19,
			getUsersUniverseEligible = var20,
			getUsersFreeCreditsRemaining = var21
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		p1.target.isNewGameTarget, var23, p1.hasPublishedVersion, var17, var19, var20,
		var21
	})
	local var25 = p1.store.useItems(var24)
	local t = {}
	
	if var24 ~= nil then
		for i, v in var25 do
			for i_1, v_1 in v.items do
				t[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var24)
				local var26 = if v_1.getTrailingText ~= nil then nil else v_1.getTrailingText(var24)
				
				if var26 ~= nil then
					t[v_1.id .. ":trailing"] = var26
				end
			end
		end
	end
	local var27 = useLocalization(t)
	local var28 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: var27 (ref)
		return var27[p2.id]
	end
	
	local function i(p2)
		-- upvalues: var24 (ref), var27 (ref), badgeVariant (copy)
		return if p2.getTrailingText == nil then nil elseif p2.getTrailingText(var24) == nil then nil else {
			type = "Badge",
			text = var27[p2.id .. ":trailing"],
			variant = badgeVariant.Standard
		}
	end
	
	local var29 = (function()
		-- upvalues: var22 (ref), var24 (ref), var25 (ref), var27 (ref), badgeVariant (copy), var10 (ref), var16 (ref), var28 (ref)
		local t = {}
		
		if not var22 then
			if var24 ~= nil then
				for i, v in var25 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = var27[v_1.id],
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var24),
							trailing = if v_1.getTrailingText == nil then nil elseif v_1.getTrailingText(var24) == nil then nil else {
								type = "Badge",
								text = var27[v_1.id .. ":trailing"],
								variant = badgeVariant.Standard
							},
							ref = if v_1.id == "share" then var10 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var16 then
				table.insert(t, { items = { var28.item } })
			end
		end
		return t
	end)()
	local var30 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var9 (ref), var5 (ref), p1 (ref)
		if var22 then return end
		var9(false)
		var5(function(p2)
			return not p2
		end)
		
		if p1.onActivated then
			p1.onActivated()
		end
	end, { var22, p1.onActivated })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var9 (ref)
		var5(false)
		var9(false)
	end, {})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var4 and not var22,
			items = var29,
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var31,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var16 (ref), var28 (ref), var5 (ref), var24 (ref), var25 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var3 (ref), var1 (copy), localizationStringsModule (copy), p1 (ref), releaseAnyFocusModule (copy), var7 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var12 (ref), var13 (ref), var15 (ref), var9 (ref), leaveExperienceModule (copy)
				if var16 and var28 ~= nil and p2 == var28.item.id then
					var28.activate()
					var5(false)
					
					return
				elseif var24 == nil then return end
				for i, v in var25 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var33 = if v_1.onActivated then v_1.onActivated(var24) else nil
							
							if var33 ~= nil then
								if var33.type == "openPage" then
									if var33.page == "monetization" and not fFlagBuildExperienceMonetizationNativeUIModule then
										var3(var1({ universeId = var24.universeId }), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
									elseif p1.onAction then
										p1.onAction(var33)
									end
								elseif var33.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(var33)
									end
								elseif var33.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif var33.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var7(true)
								elseif var33.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var12 ~= nil then
										var12()
									elseif var33.placeId ~= nil then
										var13(var33.placeId)
									end
								elseif var33.type == "confirmFriendsShare" then
									var15(var33.placeId)
								elseif var33.type == "showPrivateShareTooltip" then
									var9(function(p3)
										return not p3
									end)
									
									return
								elseif var33.type == "leaveExperience" then
									var5(false)
									leaveExperienceModule()
									
									return
								end
							end
							var5(false)
							
							return
						end
					end
				end
			end, {
				var25, var24, var3, p1.onAction, p1.onOpenGetUsersPage, var12, var13, var16,
				var28
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, var2)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var22,
			onActivated = var30
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var11 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var11.activeDialog,
			hasShareError = var11.hasShareError,
			onCancel = var11.onCancelDialog,
			onConfirmFriends = var11.onConfirmFriends,
			onConfirmPlaytesters = var11.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var14 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var15 (ref)
				var15(nil)
			end, {}),
			onShare = reactModule.useCallback(function()
				-- upvalues: var14 (ref), var15 (ref), var13 (ref)
				var15(nil)
				
				if var14 ~= nil then
					var13(var14)
				end
			end, { var14, var13 })
		}),
		PrivateShareTooltip = reactModule.createElement(privateShareTooltipModule, {
			anchorRef = var10,
			isOpen = var4 and var8,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var31 else nil
		}),
		VersionHistory = if var6 and p1.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = var32,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var32 else nil
		}) else nil
	})
end