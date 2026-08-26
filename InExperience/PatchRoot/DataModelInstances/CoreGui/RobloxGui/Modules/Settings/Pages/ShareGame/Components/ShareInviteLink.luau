local corePackagesService = game:GetService("CorePackages")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local userInputService = game:GetService("UserInputService")
local default = require(corePackagesService.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local reducerDependencies = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies
local constantsModule = require(shareGame.Constants)
local shareButtonModule = require(shareGame.Components.ShareButton)
local var1 = require(shareGame.getTranslator)()
local shareInviteLinkMapDispatchToPropsModule = require(shareGame.Components.ShareInviteLinkMapDispatchToProps)
local shareInviteLinkMapStateToPropsModule = require(shareGame.Components.ShareInviteLinkMapStateToProps)
local shareLinksRodux = reducerDependencies.ShareLinksRodux
local networkStatus = reducerDependencies.RoduxNetworking.Enum.NetworkStatus
local themeModule = require(robloxGui.Modules.Settings.Theme)
local getFFlagEnableNewInviteMenuModule = require(robloxGui.Modules.Flags.GetFFlagEnableNewInviteMenu)
local shareInviteLink = roactModule.PureComponent:extend("ShareInviteLink")
local var2 = 12
local var3 = 8
local var4 = 69

if getFFlagEnableNewInviteMenuModule() then
	var2 = 16
	var3 = 12
	var4 = 66
end
local color = Color3.fromRGB(79, 84, 95)
local var5 = var1:FormatByKey("Feature.SocialShare.Action.Share")
local var6 = var1:FormatByKey("Feature.SocialShare.Label.Copied")
local platform = userInputService:GetPlatform()
shareInviteLink.defaultProps = {
	externalContentSharingProtocol = default,
	isDesktopClient = if platform ~= Enum.Platform.Windows then if platform ~= Enum.Platform.OSX then platform == Enum.Platform.UWP else true else true
}

function shareInviteLink.init(p1)
	p1.state = { showCopiedText = false }
	
	function p0.displayShareSheet(p2)
		-- upvalues: p1 (ref)
		local props = p1.props
		
		if props.externalContentSharingProtocol then
			props.externalContentSharingProtocol:shareUrl({ context = "V1Menu", url = p2.shortUrl })
			
			if props.isDesktopClient then
				p1:setState({ showCopiedText = true })
				task.delay(1, function()
					-- upvalues: p1 (copy)
					p1:setState({ showCopiedText = false })
				end)
			end
		end
	end
end

function shareInviteLink.didUpdate(p1, p2)
	-- upvalues: shareLinksRodux (ref)
	local props = p1.props
	
	if p2.shareInviteLink == nil and p1.props.shareInviteLink ~= nil then
		p1.props.analytics:linkGenerated({
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue(),
			linkId = p1.props.shareInviteLink.linkId
		})
		p1.displayShareSheet(props.shareInviteLink)
	end
end

function shareInviteLink.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref), themeModule (ref), color (ref), var2 (write), var3 (write), var1 (ref), var4 (write), shareButtonModule (ref), var6 (ref), var5 (ref), networkStatus (ref)
	return roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = p1.props.size,
		Position = p1.props.position,
		LayoutOrder = p1.props.layoutOrder,
		BackgroundColor3 = themeModule.color("PlayerRowFrame", color),
		BackgroundTransparency = themeModule.transparency("PlayerRowFrame", 0),
		ZIndex = p1.props.zIndex
	}, {
		Corner = roactModule.createElement("UICorner", { CornerRadius = themeModule.MenuContainerCornerRadius }),
		UIPadding = roactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var2),
			PaddingRight = UDim.new(0, var2),
			PaddingTop = UDim.new(0, var3),
			PaddingBottom = UDim.new(0, var3)
		}),
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 0,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = var1:FormatByKey("Feature.SocialShare.Label.ShareServerLink"),
			Size = UDim2.new(1, -var4, 1, 0),
			TextSize = themeModule.textSize(constantsModule.LayoutSpecific[p1.props.deviceLayout].PAGE_TITLE_TEXT_SIZE, "ShareLinkTitle"),
			TextColor3 = constantsModule.Color.WHITE,
			Font = themeModule.font(Enum.Font.SourceSansSemibold, "Semibold")
		}),
		ShareButton = roactModule.createElement(shareButtonModule, {
			layoutOrder = 1,
			size = UDim2.new(0, var4, 1, 0),
			onShare = function()
				-- upvalues: p1 (ref)
				local props = p1.props
				p1.props.analytics:onShareButtonClick()
				
				if p1.props.shareInviteLink == nil then
					p1.props.fetchShareInviteLink()
					
					return
				end
				p1.displayShareSheet(props.shareInviteLink)
			end,
			text = if p1.state.showCopiedText then var6 else var5,
			isEnabled = p1.props.fetchShareInviteLinkNetworkStatus ~= networkStatus.Fetching and not p1.state.showCopiedText
		})
	})
end

return roactRoduxModule.connect(shareInviteLinkMapStateToPropsModule, shareInviteLinkMapDispatchToPropsModule)(shareInviteLink)