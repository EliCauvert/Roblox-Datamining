local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local RoactUtilsModule = require(Parent.RoactUtils)
local ThrottleFunction = require(Parent.NotificationsCommon).Throttle
local ReducerDependencies = require(Parent.NotificationsCommon).ReducerDependencies
local Default = require(Parent.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local GameInviteAnalyticsManagerModule = require(GameInvite.analytics.GameInviteAnalyticsManager)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local ShareLinksNetworking = ReducerDependencies.ShareLinksNetworking
local ShareLinksRodux = ReducerDependencies.ShareLinksRodux
local NetworkStatus = ReducerDependencies.RoduxNetworking.Enum.NetworkStatus
local GetLocalizedStringsFunction = require(Parent.NotificationsCommon).LocalizationHelper.getLocalizedStrings
local LinkButton = UIBloxModule.App.Button.LinkButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Images = UIBloxModule.App.ImageSet.Images
game:DefineFastFlag("generateGameInviteShareLinkOnClick", false)
local IconsActionsShare = Images["icons/actions/share"]
local IconsMenuLink = Images["icons/menu/link"]
local config = {
	copied = "Feature.SocialShare.Label.Copied",
	copyLink = "Feature.SocialShare.Action.CopyLink"
}

return function(p1) --[[ Line: 46 ]]
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), UseStyleFunction (copy), UseDispatchFunction (copy), GetLocalizedStringsFunction (copy), config (copy), ShareLinksNetworking (copy), ShareLinksRodux (copy), GameInviteAnalyticsManagerModule (copy), Default (copy), ThrottleFunction (copy), LinkButton (copy), NetworkStatus (copy), ImageSetButton (copy), IconsMenuLink (copy), IconsActionsShare (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 49 ]]
		return p2
	end)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local LocalizedStrings = GetLocalizedStringsFunction(config)
	local ShareInviteLink = UseSelectorResult.ShareLinks.Invites.ShareInviteLink
	
	local function v24() --[[ Line: 61 ]]
		-- upvalues: UseDispatchResult (copy), ShareLinksNetworking (upval), ShareLinksRodux (upval), GameInviteAnalyticsManagerModule (upval), Default (upval)
		UseDispatchResult(ShareLinksNetworking.GenerateLink.API({
			linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})):andThen(function(Result) --[[ Line: 64 ]]
			-- upvalues: GameInviteAnalyticsManagerModule (upval), ShareLinksRodux (upval), Default (upval)
			GameInviteAnalyticsManagerModule:linkGenerated({
				linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue(),
				linkId = Result.responseBody.linkId
			})
			
			if game:GetFastFlag("generateGameInviteShareLinkOnClick") and Result and Result.responseBody and Result.responseBody.shortUrl and Default then
				Default:shareUrl({ context = "V1Menu", url = Result.responseBody.shortUrl })
			end
		end)
	end
	
	ReactModule.useEffect(function() --[[ Line: 86 ]]
		-- upvalues: ShareInviteLink (copy), v24 (copy)
		if not game:GetFastFlag("generateGameInviteShareLinkOnClick") and not ShareInviteLink then
			v24()
		end
	end, {})
	local Status = ShareLinksNetworking.GenerateLink.getStatus(UseSelectorResult, {
		linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
	})
	local ThrottleResult = ThrottleFunction(function() --[[ Line: 100 ]]
		-- upvalues: ShareInviteLink (copy), GameInviteAnalyticsManagerModule (upval), Default (upval), v24 (copy), p1 (copy), UseStateResult2 (copy)
		GameInviteAnalyticsManagerModule:onShareButtonClick(if ShareInviteLink then ShareInviteLink.linkId else nil)
		
		if ShareInviteLink then
			if Default then
				Default:shareUrl({ context = "V1Menu", url = ShareInviteLink.shortUrl })
			end
		else
			v24()
		end
		if p1.isDesktop then
			UseStateResult2(true)
			task.delay(1, function() --[[ Line: 116 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
		end
	end)
	
	return if p1.isDesktop then if p1.isFullSize then ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		LinkButton = ReactModule.createElement(LinkButton, {
			isLoading = false,
			isDisabled = Status == NetworkStatus.Fetching or UseStateResult,
			onActivated = ThrottleResult,
			size = p1.size,
			text = UseStateResult and LocalizedStrings.copied or LocalizedStrings.copyLink
		})
	}) else ReactModule.createElement(ImageSetButton, {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = p1.size,
		[ReactModule.Event.Activated] = ThrottleResult,
		Image = IconsMenuLink,
		ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
		ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	}) else ReactModule.createElement(ImageSetButton, {
		LayoutOrder = p1.layoutOrder,
		BackgroundTransparency = 1,
		Size = p1.size,
		[ReactModule.Event.Activated] = ThrottleResult,
		Image = IconsActionsShare,
		ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color,
		ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
		BorderSizePixel = 0
	})
end