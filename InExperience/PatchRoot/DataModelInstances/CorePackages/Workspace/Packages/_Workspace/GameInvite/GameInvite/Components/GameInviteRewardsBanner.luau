local gameInvite = script:FindFirstAncestor("GameInvite")
local parent = gameInvite.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local marketplaceService = game:GetService("MarketplaceService")
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local gameInviteRewardsInfoModalModule = require(gameInvite.Components.GameInviteRewardsInfoModal)
local groupService = game:GetService("GroupService")
local playersService = game:GetService("Players")

local var1 = function(p1)
	-- upvalues: groupService (ref), playersService (ref)
	local var2 = ""
	
	if p1 == nil or p1 == 0 then
		return ""
	elseif game.CreatorType == Enum.CreatorType.Group then
		local ok, status = pcall(function()
			-- upvalues: groupService (copy), p1 (ref)
			return groupService:GetGroupInfoAsync(p1)
		end)
		
		if not ok then
			var2 = ""
		end
		if status then
			var2 = status.Name
			
			return var2
		end
	elseif game.CreatorType == Enum.CreatorType.User then
		local _ = nil
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), p1 (ref)
			return playersService:GetNameFromUserIdAsync(p1)
		end)
		var2 = if not ok then "" else status
	end
	return var2
end

return function(p1)
	-- upvalues: useLocalization (ref), marketplaceService (ref), var1 (ref), reactModule (ref), gameInviteRewardsInfoModalModule (ref), foundationModule (ref), iconButton (ref), iconSize (ref)
	local creatorId
	local t = {
		rewardsModalTitle = "Roblox.ReferralRewards.RewardBannerModalTitle",
		rewardsDetailsTitle = "Roblox.ReferralRewards.RewardBannerModalRewardDetails",
		rewardsLimitsTitle = "Roblox.ReferralRewards.AdditionalCreatorTerms",
		rewardsExpiresText = "Roblox.ReferralRewards.Expires",
		rewardsTerms = "Roblox.ReferralRewards.ReferralProgramTerms",
		rewardsHeader = {
			"Roblox.ReferralRewards.RewardBannerHeader",
			rewardName = if p1.rewardMetadata then p1.rewardMetadata.name else ""
		},
		rewardsBody = {
			"Roblox.ReferralRewards.RewardBannerBody",
			gameName = if game.PlaceId == nil or game.PlaceId == 0 then "" else marketplaceService:GetProductInfoAsync(game.PlaceId).Name,
			rewardName = if p1.rewardMetadata then p1.rewardMetadata.name else ""
		}
	}
	local list = { "Roblox.ReferralRewards.RewardBannerModalCreatorSupport" }
	
	if game.CreatorId ~= nil and game.CreatorId ~= 0 then
		creatorId = var1(game.CreatorId) or ""
	end
	local var2
	list.creatorName = creatorId
	t.rewardsCreatorSupportText = list
	local var3 = useLocalization(t)
	local var4, var5 = reactModule.useState(false)
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var6 = nil
	local t_1 = {}
	
	if var4 then
		var2 = p1.rewardMetadata and (var3 and (reactModule.createElement(gameInviteRewardsInfoModalModule, {
			title = var3.rewardsModalTitle,
			rewardDetailsTitle = var3.rewardsDetailsTitle,
			rewardDetailsBody = p1.rewardMetadata.description or "",
			rewardLimitsTitle = var3.rewardsLimitsTitle,
			rewardLimitsBody = p1.rewardMetadata.limits or "",
			rewardCreatorSupportText = var3.rewardsCreatorSupportText,
			rewardsExpiresText = var3.rewardsExpiresText,
			rewardsTerms = var3.rewardsTerms,
			expiryUtc = p1.rewardMetadata.rewardTimeOffset.endUtc or "",
			modalOpen = var4,
			setModalOpen = var5
		}) or nil))
	end
	local image
	t_1.RewardInfoModal = var2
	local createElement_1 = reactModule.createElement
	local view = foundationModule.View
	local t_2 = {
		tag = "row padding-x-xxlarge size-full-0 auto-y items-center",
		layoutOrder = p1.layoutOrder
	}
	local t_3 = {}
	local createElement_2 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_4 = {
		tag = "row size-full-0 auto-y wrap bg-surface-300 gap-medium padding-medium radius-medium align-y-top"
	}
	local t_5 = {}
	
	if p1.rewardMetadata and p1.rewardMetadata.iconAssetId ~= nil and p1.rewardMetadata.iconAssetId ~= "" then
		image = reactModule.createElement(foundationModule.Image, {
			tag = "col shrink size-1200-1200 radius-medium self-end",
			LayoutOrder = 0,
			Image = "rbxassetid://" .. p1.rewardMetadata.iconAssetId
		}) or nil
	end
	t_5.RewardIcon = image
	t_5.RewardTextContainer = reactModule.createElement(foundationModule.View, { tag = "col fill auto-xy items-start", LayoutOrder = 1 }, {
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-title-medium text-wrap text-align-x-left",
			LayoutOrder = 0,
			Text = var3.rewardsHeader
		}),
		Subtext = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-body-small text-wrap text-align-x-left",
			LayoutOrder = 1,
			Text = var3.rewardsBody
		})
	})
	t_5.RewardInfoButtonView = reactModule.createElement(foundationModule.View, { tag = "col auto-xy items-end", LayoutOrder = 2 }, {
		RewardInfoButton = reactModule.createElement(iconButton, {
			testId = "RewardInfoButton",
			icon = "icons/actions/info_small",
			size = iconSize.Small,
			onActivated = function()
				-- upvalues: var5 (ref)
				var5(true)
			end
		})
	})
	t_3.RewardBannerCard = createElement_2(view_1, t_4, t_5)
	t_1.RewardBannerContainer = createElement_1(view, t_2, t_3)
	
	return createElement(fragment, var6, t_1)
end