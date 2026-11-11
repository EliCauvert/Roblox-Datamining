local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local MarketplaceService = game:GetService("MarketplaceService")
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local GameInviteRewardsInfoModalModule = require(GameInvite.Components.GameInviteRewardsInfoModal)
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")

local function v10(CreatorId)
	-- upvalues: GroupService (copy), Players (copy)
	local Name = ""
	
	if CreatorId == nil or CreatorId == 0 then
		return ""
	end
	if game.CreatorType == Enum.CreatorType.Group then
		local Success, Result = pcall(function()
			-- upvalues: GroupService (upval), CreatorId (copy)
			return GroupService:GetGroupInfoAsync(CreatorId)
		end)
		
		if not Success then
			Name = ""
		end
		if Result then
			Name = Result.Name
			
			return Name
		end
	elseif game.CreatorType == Enum.CreatorType.User then
		local Success1
		Success1, Name = pcall(function()
			-- upvalues: Players (upval), CreatorId (copy)
			return Players:GetNameFromUserIdAsync(CreatorId)
		end)
		
		if not Success1 then
			Name = ""
		end
	end
	return Name
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), MarketplaceService (copy), v10 (copy), ReactModule (copy), GameInviteRewardsInfoModalModule (copy), FoundationModule (copy), IconButton (copy), IconSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		rewardsModalTitle = "Roblox.ReferralRewards.RewardBannerModalTitle",
		rewardsDetailsTitle = "Roblox.ReferralRewards.RewardBannerModalRewardDetails",
		rewardsLimitsTitle = "Roblox.ReferralRewards.AdditionalCreatorTerms",
		rewardsExpiresText = "Roblox.ReferralRewards.Expires",
		rewardsTerms = "Roblox.ReferralRewards.ReferralProgramTerms",
		rewardsHeader = {
			"Roblox.ReferralRewards.RewardBannerHeader",
			rewardName = p1.rewardMetadata and p1.rewardMetadata.name or ""
		},
		rewardsBody = {
			"Roblox.ReferralRewards.RewardBannerBody",
			gameName = if game.PlaceId == nil or game.PlaceId == 0 then "" elseif game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(game.PlaceId).Name else MarketplaceService:GetProductInfo(game.PlaceId).Name,
			rewardName = p1.rewardMetadata and p1.rewardMetadata.name or ""
		},
		rewardsCreatorSupportText = {
			"Roblox.ReferralRewards.RewardBannerModalCreatorSupport",
			creatorName = if game.CreatorId == nil or game.CreatorId == 0 then "" else v10(game.CreatorId) or ""
		}
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		RewardInfoModal = UseStateResult and p1.rewardMetadata and UseLocalizationResult and ReactModule.createElement(GameInviteRewardsInfoModalModule, {
			title = UseLocalizationResult.rewardsModalTitle,
			rewardDetailsTitle = UseLocalizationResult.rewardsDetailsTitle,
			rewardDetailsBody = p1.rewardMetadata.description or "",
			rewardLimitsTitle = UseLocalizationResult.rewardsLimitsTitle,
			rewardLimitsBody = p1.rewardMetadata.limits or "",
			rewardCreatorSupportText = UseLocalizationResult.rewardsCreatorSupportText,
			rewardsExpiresText = UseLocalizationResult.rewardsExpiresText,
			rewardsTerms = UseLocalizationResult.rewardsTerms,
			expiryUtc = p1.rewardMetadata.rewardTimeOffset.endUtc or "",
			modalOpen = UseStateResult,
			setModalOpen = UseStateResult2
		}) or nil,
		RewardBannerContainer = ReactModule.createElement(FoundationModule.View, {
			tag = "row padding-x-xxlarge size-full-0 auto-y items-center",
			layoutOrder = p1.layoutOrder
		}, {
			RewardBannerCard = ReactModule.createElement(FoundationModule.View, {
				tag = "row size-full-0 auto-y wrap bg-surface-300 gap-medium padding-medium radius-medium align-y-top"
			}, {
				RewardIcon = p1.rewardMetadata and p1.rewardMetadata.iconAssetId ~= nil and p1.rewardMetadata.iconAssetId ~= "" and ReactModule.createElement(FoundationModule.Image, {
					tag = "col shrink size-1200-1200 radius-medium self-end",
					LayoutOrder = 0,
					Image = "rbxassetid://" .. p1.rewardMetadata.iconAssetId
				}) or nil,
				RewardTextContainer = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-xy items-start", LayoutOrder = 1 }, {
					Text = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-title-medium text-wrap text-align-x-left",
						LayoutOrder = 0,
						Text = UseLocalizationResult.rewardsHeader
					}),
					Subtext = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy text-body-small text-wrap text-align-x-left",
						LayoutOrder = 1,
						Text = UseLocalizationResult.rewardsBody
					})
				}),
				RewardInfoButtonView = ReactModule.createElement(FoundationModule.View, { tag = "col auto-xy items-end", LayoutOrder = 2 }, {
					RewardInfoButton = ReactModule.createElement(IconButton, {
						testId = "RewardInfoButton",
						icon = "icons/actions/info_small",
						size = IconSize.Small,
						onActivated = function()
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(true)
						end
					})
				})
			})
		})
	})
end