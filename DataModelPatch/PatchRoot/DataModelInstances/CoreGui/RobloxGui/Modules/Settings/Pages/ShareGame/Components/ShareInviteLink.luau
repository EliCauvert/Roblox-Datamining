local CorePackages = game:GetService("CorePackages")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local UserInputService = game:GetService("UserInputService")
local Default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local ReducerDependencies = require(CorePackages.Workspace.Packages.NotificationsCommon).ReducerDependencies
local ConstantsModule = require(ShareGame.Constants)
local ShareButtonModule = require(ShareGame.Components.ShareButton)
local Translator = require(ShareGame.getTranslator)()
local ShareInviteLinkMapDispatchToPropsModule = require(ShareGame.Components.ShareInviteLinkMapDispatchToProps)
local ShareInviteLinkMapStateToPropsModule = require(ShareGame.Components.ShareInviteLinkMapStateToProps)
local ShareLinksRodux = ReducerDependencies.ShareLinksRodux
local NetworkStatus = ReducerDependencies.RoduxNetworking.Enum.NetworkStatus
local ThemeModule = require(RobloxGui.Modules.Settings.Theme)
local ShareInviteLink = RoactModule.PureComponent:extend("ShareInviteLink")
local Offset = 12
local Offset1 = 8
local XOffset = 69

if require(RobloxGui.Modules.Flags.GetFFlagEnableNewInviteMenu)() then
	Offset = 16
	Offset1 = 12
	XOffset = 66
end
local _Color3 = Color3.fromRGB(79, 84, 95)
local FeatureSocialShareActionShare = Translator:FormatByKey("Feature.SocialShare.Action.Share")
local FeatureSocialShareLabelCopied = Translator:FormatByKey("Feature.SocialShare.Label.Copied")
local Platform = UserInputService:GetPlatform()
ShareInviteLink.defaultProps = {
	externalContentSharingProtocol = Default,
	isDesktopClient = Platform == Enum.Platform.Windows or (Platform == Enum.Platform.OSX or Platform == Enum.Platform.UWP)
}

function ShareInviteLink.init(p1)
	p1.state = { showCopiedText = false }
	
	function p1.displayShareSheet(ShareInviteLink)
		-- upvalues: p1 (copy)
		local Props = p1.props
		
		if Props.externalContentSharingProtocol then
			Props.externalContentSharingProtocol:shareUrl({ context = "V1Menu", url = ShareInviteLink.shortUrl })
			
			if Props.isDesktopClient then
				p1:setState({ showCopiedText = true })
				task.delay(1, function()
					-- upvalues: p1 (upval)
					p1:setState({ showCopiedText = false })
				end)
			end
		end
	end
end

function ShareInviteLink.didUpdate(p1, p2)
	-- upvalues: ShareLinksRodux (copy)
	local Props = p1.props
	
	if p2.shareInviteLink == nil and p1.props.shareInviteLink ~= nil then
		p1.props.analytics:linkGenerated({
			linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue(),
			linkId = p1.props.shareInviteLink.linkId
		})
		p1.displayShareSheet(Props.shareInviteLink)
	end
end

function ShareInviteLink.render(p1)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), ThemeModule (copy), _Color3 (copy), Offset (ref), Offset1 (ref), Translator (copy), XOffset (ref), ShareButtonModule (copy), FeatureSocialShareLabelCopied (copy), FeatureSocialShareActionShare (copy), NetworkStatus (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = p1.props.size,
		Position = p1.props.position,
		LayoutOrder = p1.props.layoutOrder,
		BackgroundColor3 = ThemeModule.color("PlayerRowFrame", _Color3),
		BackgroundTransparency = ThemeModule.transparency("PlayerRowFrame", 0),
		ZIndex = p1.props.zIndex
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = ThemeModule.MenuContainerCornerRadius }),
		UIPadding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset),
			PaddingTop = UDim.new(0, Offset1),
			PaddingBottom = UDim.new(0, Offset1)
		}),
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = Translator:FormatByKey("Feature.SocialShare.Label.ShareServerLink"),
			Size = UDim2.new(1, -XOffset, 1, 0),
			TextSize = ThemeModule.textSize(ConstantsModule.LayoutSpecific[p1.props.deviceLayout].PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"),
			TextColor3 = ConstantsModule.Color.WHITE,
			Font = ThemeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		}),
		ShareButton = RoactModule.createElement(ShareButtonModule, {
			layoutOrder = 1,
			size = UDim2.new(0, XOffset, 1, 0),
			onShare = function()
				-- upvalues: p1 (copy)
				local Props = p1.props
				p1.props.analytics:onShareButtonClick()
				
				if p1.props.shareInviteLink == nil then
					p1.props.fetchShareInviteLink()
					
					return
				else
					p1.displayShareSheet(Props.shareInviteLink)
				end
			end,
			text = if p1.state.showCopiedText then FeatureSocialShareLabelCopied else FeatureSocialShareActionShare,
			isEnabled = p1.props.fetchShareInviteLinkNetworkStatus ~= NetworkStatus.Fetching and not p1.state.showCopiedText
		})
	})
end

return (RoactRoduxModule.connect(ShareInviteLinkMapStateToPropsModule, ShareInviteLinkMapDispatchToPropsModule)(ShareInviteLink))