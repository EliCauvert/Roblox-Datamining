local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildShareDisabledOnPrivateModule = require(buildExperience.Flags.FFlagBuildShareDisabledOnPrivate)
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local var1 = if not fFlagBuildShareDisabledOnPrivateModule then require(buildExperience.Components.ShareAudience.PrivateShareTooltip) else nil
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local useSharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local var2 = if not fFlagBuildExperienceMonetizationNativeUIModule then require(parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products") else nil
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
local releaseAnyFocusModule = require(parent.BuildExperiencePlaytestLaunch.releaseAnyFocus)
local buildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

local function _(p1, p2)
	return if p1.getText == nil then p1.text else p1.getText(p2)
end

return function(p1)
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), useOpenWebView (ref), reactModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), fFlagBuildShareDisabledOnPrivateModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildAdPromotionModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), badgeVariant (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var2 (ref), localizationStringsModule (ref), releaseAnyFocusModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), fFlagBuildAgentRollbackModule (ref), menu (ref), popoverSide (ref), fFlagBuildDesktopReadinessModule (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref), var1 (ref), fFlagBuildExperienceTooltipsLightDismissModule (ref)
	local var3 = useScaledValue(buildOverflowMenuWidth)
	local var4 = useOpenWebView()
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(nil)
	local var12 = if fFlagBuildExperiencePrivateInvitesModule or fFlagBuildShareDisabledOnPrivateModule then useExperienceShareFlowModule(p1.target.universeId, p1.target.placeId) else nil
	local var13 = if var12 ~= nil then nil else var12.onShare
	local var14 = useSharePublishedExperience(p1.target.universeId)
	local var15, var16 = reactModule.useState(nil)
	local var17 = p1.onOpenCreatorCreditPage ~= nil
	local var18 = fFlagEnableBuildAdPromotionModule and (p1.onOpenGetUsersPage ~= nil and (p1.target.universeId ~= nil and p1.target.universeId ~= 0))
	local var19 = if fFlagEnableBuildAdPromotionModule then useGetAdCampaignEligibilityModule(if var18 then p1.target.universeId else nil) else nil
	local var20 = var19 ~= nil and var19.userEligible == true
	local var21 = var19 ~= nil and (var19.universeEligible == true and p1.isUniversePublic == true)
	local var22 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var19)
	local var23 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var17)) else true
	local var24 = p1.hasPublishedTurn == true
	local var25 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var12 (ref), var24 (ref), var18 (ref), var20 (ref), var21 (ref), var22 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			shareAudience = if var12 ~= nil then nil else var12.audience,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var24,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = var18,
			getUsersUserEligible = var20,
			getUsersUniverseEligible = var21,
			getUsersFreeCreditsRemaining = var22
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		if var12 ~= nil then nil else var12.audience, p1.target.isNewGameTarget, var24,
		p1.hasPublishedVersion, var18, var20, var21, var22
	})
	local var26 = p1.store.useItems(var25)
	local t = {}
	
	if var25 ~= nil then
		for i, v in var26 do
			for i_1, v_1 in v.items do
				t[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var25)
				local var27 = if v_1.getTrailingText ~= nil then nil else v_1.getTrailingText(var25)
				
				if var27 ~= nil then
					t[v_1.id .. ":trailing"] = var27
				end
			end
		end
	end
	local var28 = useLocalization(t)
	local var29 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: var28 (ref)
		return var28[p2.id]
	end
	
	local function i(p2)
		-- upvalues: var25 (ref), var28 (ref), badgeVariant (copy)
		return if p2.getTrailingText == nil then nil elseif p2.getTrailingText(var25) == nil then nil else {
			type = "Badge",
			text = var28[p2.id .. ":trailing"],
			variant = badgeVariant.Standard
		}
	end
	
	local var30 = (function()
		-- upvalues: var23 (ref), var25 (ref), var26 (ref), var28 (ref), badgeVariant (copy), var11 (ref), var17 (ref), var29 (ref)
		local t = {}
		
		if not var23 then
			if var25 ~= nil then
				for i, v in var26 do
					local t_1 = { items = {} }
					
					for i_1, v_1 in v.items do
						table.insert(t_1.items, {
							id = v_1.id,
							text = var28[v_1.id],
							icon = v_1.icon,
							isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var25),
							trailing = if v_1.getTrailingText == nil then nil elseif v_1.getTrailingText(var25) == nil then nil else {
								type = "Badge",
								text = var28[v_1.id .. ":trailing"],
								variant = badgeVariant.Standard
							},
							ref = if v_1.id == "share" then var11 else nil
						})
					end
					table.insert(t, t_1)
				end
			end
			if var17 then
				table.insert(t, { items = { var29.item } })
			end
		end
		return t
	end)()
	local var31 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), var10 (ref), var6 (ref), p1 (ref)
		if var23 then return end
		var10(false)
		var6(function(p2)
			return not p2
		end)
		
		if p1.onActivated then
			p1.onActivated()
		end
	end, { var23, p1.onActivated })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var10 (ref)
		var6(false)
		var10(false)
	end, {})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var8 (ref)
		var8(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var5 and not var23,
			items = var30,
			side = popoverSide.Bottom,
			size = if fFlagBuildDesktopReadinessModule then inputSize.Large else nil,
			align = popoverAlign.End,
			onPressedOutside = var32,
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: var17 (ref), var29 (ref), var6 (ref), var25 (ref), var26 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var4 (ref), var2 (copy), localizationStringsModule (copy), p1 (ref), releaseAnyFocusModule (copy), var8 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), var13 (ref), var14 (ref), var16 (ref), var10 (ref), leaveExperienceModule (copy)
				if var17 and var29 ~= nil and p2 == var29.item.id then
					var29.activate()
					var6(false)
					
					return
				elseif var25 == nil then return end
				for i, v in var26 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var34 = if v_1.onActivated then v_1.onActivated(var25) else nil
							
							if var34 ~= nil then
								if var34.type == "openPage" then
									if var34.page == "monetization" and not fFlagBuildExperienceMonetizationNativeUIModule then
										var4(var2({ universeId = var25.universeId }), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
									elseif p1.onAction then
										p1.onAction(var34)
									end
								elseif var34.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(var34)
									end
								elseif var34.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif var34.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var8(true)
								elseif var34.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule and var13 ~= nil then
										var13()
									elseif var34.placeId ~= nil then
										var14(var34.placeId)
									end
								elseif var34.type == "confirmFriendsShare" then
									var16(var34.placeId)
								elseif var34.type == "showPrivateShareTooltip" then
									var10(function(p3)
										return not p3
									end)
									
									return
								elseif var34.type == "leaveExperience" then
									var6(false)
									leaveExperienceModule()
									
									return
								end
							end
							var6(false)
							
							return
						end
					end
				end
			end, {
				var26, var25, var4, p1.onAction, p1.onOpenGetUsersPage, var13, var14, var17,
				var29
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, var3)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var23,
			onActivated = var31
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule and var12 ~= nil then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var12.activeDialog,
			hasShareError = var12.hasShareError,
			onCancel = var12.onCancelDialog,
			onConfirmFriends = var12.onConfirmFriends,
			onConfirmPlaytesters = var12.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var15 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var16 (ref)
				var16(nil)
			end, {}),
			onShare = reactModule.useCallback(function()
				-- upvalues: var15 (ref), var16 (ref), var14 (ref)
				var16(nil)
				
				if var15 ~= nil then
					var14(var15)
				end
			end, { var15, var14 })
		}),
		PrivateShareTooltip = if not fFlagBuildShareDisabledOnPrivateModule then reactModule.createElement(var1, {
			anchorRef = var11,
			isOpen = var5 and var9,
			onPressedOutside = if fFlagBuildExperienceTooltipsLightDismissModule then var32 else nil
		}) else nil,
		VersionHistory = if var7 and p1.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = var33,
			onAgentRollbackStarted = if fFlagBuildAgentRollbackModule then var33 else nil
		}) else nil
	})
end