local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local userInputService = game:GetService("UserInputService")
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local friendsOnlyShareDialogModule = require(buildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local experienceShareOverlaysModule = require(buildExperience.Components.ShareAudience.ExperienceShareOverlays)
local leaveExperienceModule = require(buildExperience.utils.leaveExperience)
local useExperienceShareFlowModule = require(buildExperience.utils.useExperienceShareFlow)
local useSharePublishedExperience = require(buildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local useOpenWebView = require(parent.WebViewUtils).useOpenWebView
local fFlagBuildExperienceMonetizationNativeUIModule = require(buildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local var1 = if not fFlagBuildExperienceMonetizationNativeUIModule then require(parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products") else nil
local useCreatorCreditMenuItem = require(script.Parent.useCreatorCreditMenuItem).useCreatorCreditMenuItem
local fFlagBuildExperiencePrivateInvitesModule = require(buildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local fFlagEnableBuildAdPromotionModule = require(buildExperience.Flags.FFlagEnableBuildAdPromotion)
local fFlagEnableBuildOverflowMenuForNewGamesModule = require(buildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local fFlagBuildExperienceReleaseFocusOnOverflowOpenModule = require(buildExperience.Flags.FFlagBuildExperienceReleaseFocusOnOverflowOpen)
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
	-- upvalues: useScaledValue (ref), buildOverflowMenuWidth (ref), useOpenWebView (ref), reactModule (ref), useExperienceShareFlowModule (ref), useSharePublishedExperience (ref), fFlagEnableBuildAdPromotionModule (ref), useGetAdCampaignEligibilityModule (ref), adCampaignEligibilityUtilsModule (ref), fFlagEnableBuildOverflowMenuForNewGamesModule (ref), useLocalization (ref), useCreatorCreditMenuItem (ref), badgeVariant (ref), fFlagBuildExperienceReleaseFocusOnOverflowOpenModule (ref), userInputService (ref), fFlagBuildExperienceMonetizationNativeUIModule (ref), var1 (ref), localizationStringsModule (ref), releaseAnyFocusModule (ref), fFlagBuildExperiencePrivateInvitesModule (ref), leaveExperienceModule (ref), versionHistoryContainerModule (ref), menu (ref), popoverSide (ref), inputSize (ref), popoverAlign (ref), iconButton (ref), buttonVariant (ref), experienceShareOverlaysModule (ref), friendsOnlyShareDialogModule (ref)
	local var2 = useScaledValue(buildOverflowMenuWidth)
	local var3 = useOpenWebView()
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(false)
	local var8 = useExperienceShareFlowModule(p1.target.universeId, p1.target.placeId)
	local onShare = var8.onShare
	local var9 = useSharePublishedExperience(p1.target.universeId)
	local var10, var11 = reactModule.useState(nil)
	local var12 = p1.onOpenCreatorCreditPage ~= nil
	local var13 = fFlagEnableBuildAdPromotionModule and (p1.onOpenGetUsersPage ~= nil and (p1.target.universeId ~= nil and p1.target.universeId ~= 0))
	local var14 = if fFlagEnableBuildAdPromotionModule then useGetAdCampaignEligibilityModule(if var13 then p1.target.universeId else nil) else nil
	local var15 = var14 ~= nil and var14.userEligible == true
	local var16 = var14 ~= nil and (var14.universeEligible == true and p1.isUniversePublic == true)
	local var17 = adCampaignEligibilityUtilsModule.freeCreditsRemaining(var14)
	local var18 = if p1.isDisabled ~= true then p1.target.universeId == nil and not (fFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and var12)) else true
	local var19 = p1.hasPublishedTurn == true
	local var20 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var8 (ref), var19 (ref), var13 (ref), var15 (ref), var16 (ref), var17 (ref)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			shareAudience = var8.audience,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = var19,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = var13,
			getUsersUserEligible = var15,
			getUsersUniverseEligible = var16,
			getUsersFreeCreditsRemaining = var17
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId, var8.audience,
		p1.target.isNewGameTarget, var19, p1.hasPublishedVersion, var13, var15, var16,
		var17
	})
	local var21 = p1.store.useItems(var20)
	local t = {}
	
	if var20 ~= nil then
		for i, v in var21 do
			for i_1, v_1 in v.items do
				t[v_1.id] = if v_1.getText ~= nil then v_1.text else v_1.getText(var20)
				local var22 = if v_1.getTrailingText ~= nil then nil else v_1.getTrailingText(var20)
				
				if var22 ~= nil then
					t[v_1.id .. ":trailing"] = var22
				end
			end
		end
	end
	local var23 = useLocalization(t)
	local var24 = useCreatorCreditMenuItem({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: var23 (ref)
		return var23[p2.id]
	end
	
	local function i(p2)
		-- upvalues: var20 (ref), var23 (ref), badgeVariant (copy)
		return if p2.getTrailingText == nil then nil elseif p2.getTrailingText(var20) == nil then nil else {
			type = "Badge",
			text = var23[p2.id .. ":trailing"],
			variant = badgeVariant.Standard
		}
	end
	
	local var25 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Menu = reactModule.createElement(menu, {
			isOpen = var4 and not var18,
			items = (function()
				-- upvalues: var18 (ref), var20 (ref), var21 (ref), var23 (ref), badgeVariant (copy), var12 (ref), var24 (ref)
				local t = {}
				
				if not var18 then
					if var20 ~= nil then
						for i, v in var21 do
							local t_1 = { items = {} }
							
							for i_1, v_1 in v.items do
								table.insert(t_1.items, {
									id = v_1.id,
									text = var23[v_1.id],
									icon = v_1.icon,
									isDisabled = if v_1.isDisabled ~= nil then nil else v_1.isDisabled(var20),
									trailing = if v_1.getTrailingText == nil then nil elseif v_1.getTrailingText(var20) == nil then nil else {
										type = "Badge",
										text = var23[v_1.id .. ":trailing"],
										variant = badgeVariant.Standard
									}
								})
							end
							table.insert(t, t_1)
						end
					end
					if var12 then
						table.insert(t, { items = { var24.item } })
					end
				end
				return t
			end)(),
			side = popoverSide.Bottom,
			size = inputSize.Large,
			align = popoverAlign.End,
			onPressedOutside = reactModule.useCallback(function()
				-- upvalues: var5 (ref)
				var5(false)
			end, {}),
			onActivated = reactModule.useCallback(function(p2)
				-- upvalues: userInputService (copy), var12 (ref), var24 (ref), var5 (ref), var20 (ref), var21 (ref), fFlagBuildExperienceMonetizationNativeUIModule (copy), var3 (ref), var1 (copy), localizationStringsModule (copy), p1 (ref), releaseAnyFocusModule (copy), var7 (ref), fFlagBuildExperiencePrivateInvitesModule (copy), onShare (ref), var9 (ref), var11 (ref), leaveExperienceModule (copy)
				local focusedTextBox = userInputService:GetFocusedTextBox()
				
				if focusedTextBox then
					focusedTextBox:ReleaseFocus()
				end
				if var12 and var24 ~= nil and p2 == var24.item.id then
					var24.activate()
					var5(false)
					
					return
				elseif var20 == nil then return end
				for i, v in var21 do
					for i_1, v_1 in v.items do
						if v_1.id == p2 then
							local var26 = if v_1.onActivated then v_1.onActivated(var20) else nil
							
							if var26 ~= nil then
								if var26.type == "openPage" then
									if var26.page == "monetization" and not fFlagBuildExperienceMonetizationNativeUIModule then
										var3(var1({ universeId = var20.universeId }), localizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
									elseif p1.onAction then
										p1.onAction(var26)
									end
								elseif var26.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(var26)
									end
								elseif var26.type == "openInviteManagement" then
									if p1.onAction then
										p1.onAction(var26)
									end
								elseif var26.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif var26.type == "openVersionHistory" then
									releaseAnyFocusModule()
									var7(true)
								elseif var26.type == "share" then
									if fFlagBuildExperiencePrivateInvitesModule then
										onShare()
									elseif var26.placeId ~= nil then
										var9(var26.placeId)
									end
								elseif var26.type == "confirmFriendsShare" then
									var11(var26.placeId)
								elseif var26.type == "leaveExperience" then
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
				var21, var20, var3, p1.onAction, p1.onOpenGetUsersPage, onShare, var9, var12,
				var24
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, var2)
		}, reactModule.createElement(iconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = buttonVariant.Utility,
			size = inputSize.Medium,
			isDisabled = var18,
			onActivated = reactModule.useCallback(function()
				-- upvalues: var18 (ref), fFlagBuildExperienceReleaseFocusOnOverflowOpenModule (copy), userInputService (copy), var5 (ref), p1 (ref)
				if var18 then return end
				if fFlagBuildExperienceReleaseFocusOnOverflowOpenModule then
					local focusedTextBox = userInputService:GetFocusedTextBox()
					
					if focusedTextBox then
						focusedTextBox:ReleaseFocus()
					end
				end
				var5(function(p3)
					return not p3
				end)
				
				if p1.onActivated then
					p1.onActivated()
				end
			end, { var18, p1.onActivated })
		})),
		ShareOverlays = if fFlagBuildExperiencePrivateInvitesModule then reactModule.createElement(experienceShareOverlaysModule, {
			activeDialog = var8.activeDialog,
			hasShareError = var8.hasShareError,
			onCancel = var8.onCancelDialog,
			onConfirmFriends = var8.onConfirmFriends,
			onConfirmPlaytesters = var8.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if fFlagBuildExperiencePrivateInvitesModule or var10 == nil then nil else reactModule.createElement(friendsOnlyShareDialogModule, {
			onCancel = reactModule.useCallback(function()
				-- upvalues: var11 (ref)
				var11(nil)
			end, {}),
			onShare = reactModule.useCallback(function()
				-- upvalues: var10 (ref), var11 (ref), var9 (ref)
				var11(nil)
				
				if var10 ~= nil then
					var9(var10)
				end
			end, { var10, var9 })
		}),
		VersionHistory = if var6 and p1.target.placeId ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = var25,
			onAgentRollbackStarted = var25
		}) else nil
	})
end