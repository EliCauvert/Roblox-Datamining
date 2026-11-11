local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local Constants = require(CorePackages.Workspace.Packages.CoreScriptsCommon).Constants
local Modules = CoreGui.RobloxGui.Modules
local ShareGame = Modules.Settings.Pages.ShareGame
local PromiseModule = require(CorePackages.Packages.Promise)
local UtilityModule = require(CoreGui:WaitForChild("RobloxGui", 1e999).Modules.Settings.Utility)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local HttpRequestModule = require(Modules.Common.httpRequest)
local HeaderModule = require(ShareGame.Components.Header)
local ConversationListModule = require(ShareGame.Components.ConversationList)
local ConstantsModule = require(ShareGame.Constants)
local ShareInviteLinkModule = require(ShareGame.Components.ShareInviteLink)
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local BackButtonModule = require(ShareGame.Components.BackButton)
local SetGameInfoCreatedModule = require(ShareGame.Actions.SetGameInfoCreated)
local v1 = 10
local YOffset = 44

if require(Modules.Flags.GetFFlagEnableNewInviteMenu)() then
	v1 = 16
	YOffset = 52
end
local ShareGamePageFrame = RoactModule.PureComponent:extend("ShareGamePageFrame")
local ErrorToasterModule = require(ShareGame.Components.ErrorToaster)

function ShareGamePageFrame.init(p1)
	p1.state = { serverType = nil }
end

function ShareGamePageFrame.shouldShowInviteLink(p1, GameInfo): boolean
	-- upvalues: Constants (copy), UtilityModule (copy)
	return if p1.props.experienceInviteShareLinkEnabled and p1.state.serverType == Constants.STANDARD_SERVER and UtilityModule:IsExperienceOlderThanOneWeek(GameInfo) then true else false
end

function ShareGamePageFrame.didMount(p1)
	-- upvalues: PromiseModule (copy), RobloxReplicatedStorage (copy)
	p1.props.fetchGameInfo()
	
	if p1.state.serverType == nil then
		PromiseModule.try(function()
			-- upvalues: RobloxReplicatedStorage (upval)
			return RobloxReplicatedStorage:WaitForChild("GetServerType", 1e999):InvokeServer()
		end):andThen(function(Result)
			-- upvalues: p1 (copy)
			p1:setState({ serverType = Result })
		end)
	end
end

function ShareGamePageFrame.render(p1)
	-- upvalues: ConstantsModule (copy), BackButtonModule (copy), YOffset (ref), RoactModule (copy), CoreGui (copy), ErrorToasterModule (copy), HeaderModule (copy), ShareInviteLinkModule (copy), ConversationListModule (copy), v1 (ref)
	local Analytics = p1.props.analytics
	local DeviceLayout = p1.props.deviceLayout
	local ZIndex = p1.props.zIndex
	local ClosePage = p1.props.closePage
	local SearchAreaActive = p1.props.searchAreaActive
	local SearchText = p1.props.searchText
	local LayoutSpecificEntry = ConstantsModule.LayoutSpecific[DeviceLayout]
	local HEADERHEIGHT = LayoutSpecificEntry.HEADER_HEIGHT
	local IsDeviceLayoutMatch = DeviceLayout == ConstantsModule.DeviceLayout.DESKTOP
	local None = if IsDeviceLayoutMatch then BackButtonModule.IconType.None else BackButtonModule.IconType.Arrow or BackButtonModule.IconType.None
	local NoIsDeviceLayoutMatch = not IsDeviceLayoutMatch
	local IsVisible = p1.props.isVisible
	local ShouldShowInviteLink = p1:shouldShowInviteLink(p1.props.gameInfo)
	local Total = 0
	local YOffset1 = 0
	
	if ShouldShowInviteLink then
		Total -= YOffset
		YOffset1 = 10
	end
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutoLocalize = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		ZIndex = ZIndex
	}, {
		toasterPortal = RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, { Toaster = RoactModule.createElement(ErrorToasterModule) }),
		Header = RoactModule.createElement(HeaderModule, {
			layoutOrder = 0,
			deviceLayout = DeviceLayout,
			size = UDim2.new(1, 0, 0, HEADERHEIGHT),
			position = UDim2.new(0, 0, 0, -HEADERHEIGHT),
			zIndex = ZIndex,
			closePage = ClosePage,
			searchAreaActive = SearchAreaActive,
			toggleSearchIcon = NoIsDeviceLayoutMatch,
			iconType = None,
			analytics = Analytics
		}),
		ShareInviteLink = ShouldShowInviteLink and RoactModule.createElement(ShareInviteLinkModule, {
			layoutOrder = 1,
			position = UDim2.new(0, 0, 0, YOffset1),
			analytics = Analytics,
			deviceLayout = DeviceLayout,
			size = UDim2.new(1, 0, 0, YOffset),
			zIndex = ZIndex
		}) or nil,
		ConversationList = RoactModule.createElement(ConversationListModule, {
			trigger = "GameMenu",
			analytics = Analytics,
			size = UDim2.new(1, 0, 1, LayoutSpecificEntry.EXTEND_BOTTOM_SIZE - v1 + Total),
			topPadding = ShouldShowInviteLink and v1 + YOffset + YOffset1 or v1,
			layoutOrder = if ShouldShowInviteLink then 2 else 1,
			zIndex = ZIndex,
			searchText = SearchText,
			isVisible = IsVisible
		})
	})
end

return (RoactAppPolicy.connect(function(p1)
	return {
		experienceInviteShareLinkEnabled = p1.getExperienceInviteShareLinkEnabled()
	}
end)((RoactRoduxModule.connect(function(p1)
	return { gameInfo = p1.GameInfo }
end, function(Callback)
	-- upvalues: HttpRequestModule (copy), HttpRbxApiService (copy), GetGameNameAndDescriptionFunction (copy), SetGameInfoCreatedModule (copy)
	return {
		fetchGameInfo = function()
			-- upvalues: HttpRequestModule (upval), HttpRbxApiService (upval), GetGameNameAndDescriptionFunction (upval), Callback (copy), SetGameInfoCreatedModule (upval)
			GetGameNameAndDescriptionFunction(HttpRequestModule(HttpRbxApiService), game.GameId):andThen(function(Result)
				-- upvalues: Callback (upval), SetGameInfoCreatedModule (upval)
				Callback(SetGameInfoCreatedModule(Result.Created))
			end)
		end
	}
end)(ShareGamePageFrame))))