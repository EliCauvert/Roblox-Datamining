local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local UserInputService = game:GetService("UserInputService")
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local VersionHistoryContainerModule = require(BuildExperience.Components.VersionHistory.VersionHistoryContainer)
local FriendsOnlyShareDialogModule = require(BuildExperience.Components.ShareAudience.FriendsOnlyShareDialog)
local ExperienceShareOverlaysModule = require(BuildExperience.Components.ShareAudience.ExperienceShareOverlays)
local LeaveExperienceModule = require(BuildExperience.utils.leaveExperience)
local UseExperienceShareFlowModule = require(BuildExperience.utils.useExperienceShareFlow)
local UseSharePublishedExperienceFunction = require(BuildExperience.utils.sharePublishedExperience).useSharePublishedExperience
local UseOpenWebViewFunction = require(Parent.WebViewUtils).useOpenWebView
local FFlagBuildExperienceMonetizationNativeUIModule = require(BuildExperience.Flags.FFlagBuildExperienceMonetizationNativeUI)
local DeveloperProducts = if FFlagBuildExperienceMonetizationNativeUIModule then nil else require(Parent.UrlBuilder).UrlBuilder.fromString("create:dashboard/creations/experiences/{universeId}/monetization/developer-products")
local UseCreatorCreditMenuItemFunction = require(script.Parent.useCreatorCreditMenuItem).useCreatorCreditMenuItem
local FFlagBuildExperiencePrivateInvitesModule = require(BuildExperience.Flags.FFlagBuildExperiencePrivateInvites)
local FFlagEnableBuildAdPromotionModule = require(BuildExperience.Flags.FFlagEnableBuildAdPromotion)
local FFlagEnableBuildOverflowMenuForNewGamesModule = require(BuildExperience.Flags.FFlagEnableBuildOverflowMenuForNewGames)
local FFlagBuildExperienceReleaseFocusOnOverflowOpenModule = require(BuildExperience.Flags.FFlagBuildExperienceReleaseFocusOnOverflowOpen)
local UseGetAdCampaignEligibilityModule = require(BuildExperience.Components.Ads.useGetAdCampaignEligibility)
local AdCampaignEligibilityUtilsModule = require(BuildExperience.Components.Ads.adCampaignEligibilityUtils)
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local ReleaseAnyFocusModule = require(Parent.BuildExperiencePlaytestLaunch.releaseAnyFocus)
local BuildOverflowMenuWidth = game:DefineFastInt("BuildOverflowMenuWidth", 172)

local function _(p1, p2)
	return if p1.getText == nil then p1.text else p1.getText(p2)
end

return function(p1)
	-- upvalues: UseScaledValueFunction (copy), BuildOverflowMenuWidth (copy), UseOpenWebViewFunction (copy), ReactModule (copy), UseExperienceShareFlowModule (copy), UseSharePublishedExperienceFunction (copy), FFlagEnableBuildAdPromotionModule (copy), UseGetAdCampaignEligibilityModule (copy), AdCampaignEligibilityUtilsModule (copy), FFlagEnableBuildOverflowMenuForNewGamesModule (copy), UseLocalizationFunction (copy), UseCreatorCreditMenuItemFunction (copy), BadgeVariant (copy), FFlagBuildExperienceReleaseFocusOnOverflowOpenModule (copy), UserInputService (copy), FFlagBuildExperienceMonetizationNativeUIModule (copy), DeveloperProducts (copy), LocalizationStringsModule (copy), ReleaseAnyFocusModule (copy), FFlagBuildExperiencePrivateInvitesModule (copy), LeaveExperienceModule (copy), VersionHistoryContainerModule (copy), Menu (copy), PopoverSide (copy), InputSize (copy), PopoverAlign (copy), IconButton (copy), ButtonVariant (copy), ExperienceShareOverlaysModule (copy), FriendsOnlyShareDialogModule (copy)
	local UseScaledValueResult = UseScaledValueFunction(BuildOverflowMenuWidth)
	local UseOpenWebViewResult = UseOpenWebViewFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseExperienceShareFlowModuleResult = UseExperienceShareFlowModule(p1.target.universeId, p1.target.placeId)
	local OnShareFunction = UseExperienceShareFlowModuleResult.onShare
	local UseSharePublishedExperienceResult = UseSharePublishedExperienceFunction(p1.target.universeId)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local HasOnOpenCreatorCreditPage = p1.onOpenCreatorCreditPage ~= nil
	local IsNotUniverseIdMatch: boolean = FFlagEnableBuildAdPromotionModule and (p1.onOpenGetUsersPage ~= nil and (p1.target.universeId ~= nil and p1.target.universeId ~= 0))
	local UseGetAdCampaignEligibilityModuleResult = if FFlagEnableBuildAdPromotionModule then UseGetAdCampaignEligibilityModule(if IsNotUniverseIdMatch then p1.target.universeId else nil) else nil
	local IsUserEligible: boolean = UseGetAdCampaignEligibilityModuleResult ~= nil and UseGetAdCampaignEligibilityModuleResult.userEligible == true
	local IsIsUniversePublic: boolean = UseGetAdCampaignEligibilityModuleResult ~= nil and (UseGetAdCampaignEligibilityModuleResult.universeEligible == true and p1.isUniversePublic == true)
	local FreeCreditsRemainingResult = AdCampaignEligibilityUtilsModule.freeCreditsRemaining(UseGetAdCampaignEligibilityModuleResult)
	local HasOnOpenCreatorCreditPage1: boolean = FFlagEnableBuildOverflowMenuForNewGamesModule and (p1.target.universeId == nil and HasOnOpenCreatorCreditPage)
	local IsIsDisabled: boolean = p1.isDisabled == true or p1.target.universeId == nil and not HasOnOpenCreatorCreditPage1
	local IsHasPublishedTurn = p1.hasPublishedTurn == true
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseExperienceShareFlowModuleResult (copy), IsHasPublishedTurn (copy), IsNotUniverseIdMatch (copy), IsUserEligible (copy), IsIsUniversePublic (copy), FreeCreditsRemainingResult (copy)
		return if p1.target.universeId == nil then nil else {
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			sessionId = p1.target.sessionId,
			shareAudience = UseExperienceShareFlowModuleResult.audience,
			isNewGameTarget = p1.target.isNewGameTarget,
			hasPublishedTurn = IsHasPublishedTurn,
			hasPublishedVersion = p1.hasPublishedVersion == true,
			canOpenGetUsers = IsNotUniverseIdMatch,
			getUsersUserEligible = IsUserEligible,
			getUsersUniverseEligible = IsIsUniversePublic,
			getUsersFreeCreditsRemaining = FreeCreditsRemainingResult
		}
	end, {
		p1.target.universeId, p1.target.placeId, p1.target.sessionId,
		UseExperienceShareFlowModuleResult.audience, p1.target.isNewGameTarget,
		IsHasPublishedTurn, p1.hasPublishedVersion, IsNotUniverseIdMatch,
		IsUserEligible, IsIsUniversePublic, FreeCreditsRemainingResult
	})
	local UseItemsResult = p1.store.useItems(UseMemoResult)
	local TrailingTexts = {}
	
	if UseMemoResult ~= nil then
		for _, value in UseItemsResult do
			for _, item in value.items do
				TrailingTexts[item.id] = if item.getText == nil then item.text else item.getText(UseMemoResult)
				local TrailingText = if item.getTrailingText == nil then nil else item.getTrailingText(UseMemoResult)
				
				if TrailingText ~= nil then
					TrailingTexts[item.id .. ":trailing"] = TrailingText
				end
			end
		end
	end
	local UseLocalizationResult = UseLocalizationFunction(TrailingTexts)
	local UseCreatorCreditMenuItemResult = UseCreatorCreditMenuItemFunction({ onOpenCreatorCreditPage = p1.onOpenCreatorCreditPage })
	
	local function _(p2)
		-- upvalues: UseLocalizationResult (copy)
		return UseLocalizationResult[p2.id]
	end
	
	local _ = function(p2)
		-- upvalues: UseMemoResult (copy), UseLocalizationResult (copy), BadgeVariant (upval)
		return if p2.getTrailingText == nil then nil elseif p2.getTrailingText(UseMemoResult) == nil then nil else {
			type = "Badge",
			text = UseLocalizationResult[p2.id .. ":trailing"],
			variant = BadgeVariant.Standard
		}
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), UseSharePublishedExperienceResult (copy)
		UseStateResult2_2(nil)
		
		if UseStateResult3 ~= nil then
			UseSharePublishedExperienceResult(UseStateResult3)
		end
	end, { UseStateResult3, UseSharePublishedExperienceResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(nil)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Menu = ReactModule.createElement(Menu, {
			isOpen = UseStateResult and not IsIsDisabled,
			items = (function()
				-- upvalues: IsIsDisabled (copy), UseMemoResult (copy), UseItemsResult (copy), UseLocalizationResult (copy), BadgeVariant (upval), HasOnOpenCreatorCreditPage (copy), UseCreatorCreditMenuItemResult (copy)
				local List = {}
				
				if not IsIsDisabled then
					if UseMemoResult ~= nil then
						for _, value in UseItemsResult do
							local config = { items = {} }
							
							for _, item in value.items do
								table.insert(config.items, {
									id = item.id,
									text = UseLocalizationResult[item.id],
									icon = item.icon,
									isDisabled = if item.isDisabled == nil then nil else item.isDisabled(UseMemoResult),
									trailing = if item.getTrailingText == nil then nil elseif item.getTrailingText(UseMemoResult) == nil then nil else {
										type = "Badge",
										text = UseLocalizationResult[item.id .. ":trailing"],
										variant = BadgeVariant.Standard
									}
								})
							end
							table.insert(List, config)
						end
					end
					if HasOnOpenCreatorCreditPage then
						table.insert(List, { items = { UseCreatorCreditMenuItemResult.item } })
					end
				end
				return List
			end)(),
			side = PopoverSide.Bottom,
			size = InputSize.Large,
			align = PopoverAlign.End,
			onPressedOutside = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end, {}),
			onActivated = ReactModule.useCallback(function(Id)
				-- upvalues: UserInputService (upval), HasOnOpenCreatorCreditPage (copy), UseCreatorCreditMenuItemResult (copy), UseStateResult2 (copy), UseMemoResult (copy), UseItemsResult (copy), FFlagBuildExperienceMonetizationNativeUIModule (upval), UseOpenWebViewResult (copy), DeveloperProducts (upval), LocalizationStringsModule (upval), p1 (copy), ReleaseAnyFocusModule (upval), UseStateResult2_1 (copy), FFlagBuildExperiencePrivateInvitesModule (upval), OnShareFunction (copy), UseSharePublishedExperienceResult (copy), UseStateResult2_2 (copy), LeaveExperienceModule (upval)
				local FocusedTextBox = UserInputService:GetFocusedTextBox()
				
				if FocusedTextBox then
					FocusedTextBox:ReleaseFocus()
				end
				if HasOnOpenCreatorCreditPage and UseCreatorCreditMenuItemResult ~= nil and Id == UseCreatorCreditMenuItemResult.item.id then
					UseCreatorCreditMenuItemResult.activate()
					UseStateResult2(false)
					
					return
				end
				if UseMemoResult == nil then return end
				for _, value in UseItemsResult do
					for _, item in value.items do
						if item.id == Id then
							local OnActivatedResult = if item.onActivated then item.onActivated(UseMemoResult) else nil
							
							if OnActivatedResult ~= nil then
								if OnActivatedResult.type == "openPage" then
									if OnActivatedResult.page == "monetization" and not FFlagBuildExperienceMonetizationNativeUIModule then
										UseOpenWebViewResult(DeveloperProducts({ universeId = UseMemoResult.universeId }), LocalizationStringsModule.GAME_CONFIGURATION_CREATOR_HUB)
									elseif p1.onAction then
										p1.onAction(OnActivatedResult)
									end
								elseif OnActivatedResult.type == "openInvitePicker" then
									if p1.onAction then
										p1.onAction(OnActivatedResult)
									end
								elseif OnActivatedResult.type == "openInviteManagement" then
									if p1.onAction then
										p1.onAction(OnActivatedResult)
									end
								elseif OnActivatedResult.type == "openGetUsers" then
									if p1.onOpenGetUsersPage then
										p1.onOpenGetUsersPage()
									end
								elseif OnActivatedResult.type == "openVersionHistory" then
									ReleaseAnyFocusModule()
									UseStateResult2_1(true)
								elseif OnActivatedResult.type == "share" then
									if FFlagBuildExperiencePrivateInvitesModule then
										OnShareFunction()
									elseif OnActivatedResult.placeId ~= nil then
										UseSharePublishedExperienceResult(OnActivatedResult.placeId)
									end
								elseif OnActivatedResult.type == "confirmFriendsShare" then
									UseStateResult2_2(OnActivatedResult.placeId)
								elseif OnActivatedResult.type == "leaveExperience" then
									UseStateResult2(false)
									LeaveExperienceModule()
									break
								end
							end
							UseStateResult2(false)
							break
						end
					end
				end
			end, {
				UseItemsResult, UseMemoResult, UseOpenWebViewResult, p1.onAction,
				p1.onOpenGetUsersPage, OnShareFunction, UseSharePublishedExperienceResult,
				HasOnOpenCreatorCreditPage, UseCreatorCreditMenuItemResult
			}),
			LayoutOrder = p1.layoutOrder,
			width = UDim.new(0, UseScaledValueResult)
		}, ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = "build-header-overflow-button",
			icon = p1.icon,
			variant = ButtonVariant.Utility,
			size = InputSize.Medium,
			isDisabled = IsIsDisabled,
			onActivated = ReactModule.useCallback(function()
				-- upvalues: IsIsDisabled (copy), FFlagBuildExperienceReleaseFocusOnOverflowOpenModule (upval), UserInputService (upval), UseStateResult2 (copy), p1 (copy)
				if IsIsDisabled then return end
				if FFlagBuildExperienceReleaseFocusOnOverflowOpenModule then
					local FocusedTextBox = UserInputService:GetFocusedTextBox()
					
					if FocusedTextBox then
						FocusedTextBox:ReleaseFocus()
					end
				end
				UseStateResult2(function(p2): boolean
					return not p2
				end)
				
				if p1.onActivated then
					p1.onActivated()
				end
			end, { IsIsDisabled, p1.onActivated })
		})),
		ShareOverlays = if FFlagBuildExperiencePrivateInvitesModule then ReactModule.createElement(ExperienceShareOverlaysModule, {
			activeDialog = UseExperienceShareFlowModuleResult.activeDialog,
			hasShareError = UseExperienceShareFlowModuleResult.hasShareError,
			onCancel = UseExperienceShareFlowModuleResult.onCancelDialog,
			onConfirmFriends = UseExperienceShareFlowModuleResult.onConfirmFriends,
			onConfirmPlaytesters = UseExperienceShareFlowModuleResult.onConfirmPlaytesters
		}) else nil,
		FriendsOnlyShareDialog = if FFlagBuildExperiencePrivateInvitesModule or UseStateResult3 == nil then nil else ReactModule.createElement(FriendsOnlyShareDialogModule, { onCancel = UseResult2, onShare = UseResult1 }),
		VersionHistory = if UseStateResult1 and p1.target.placeId ~= nil then ReactModule.createElement(VersionHistoryContainerModule, {
			isOpen = true,
			testId = "build-version-history",
			universeId = p1.target.universeId,
			placeId = p1.target.placeId,
			onClose = UseResult,
			onAgentRollbackStarted = UseResult
		}) else nil
	})
end