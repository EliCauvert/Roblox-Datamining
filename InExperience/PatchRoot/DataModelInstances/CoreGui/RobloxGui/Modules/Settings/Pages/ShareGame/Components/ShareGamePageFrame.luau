local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local robloxGui = coreGuiService:WaitForChild("RobloxGui", 1e999)
local constants = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).Constants
local modules = coreGuiService.RobloxGui.Modules
local shareGame = modules.Settings.Pages.ShareGame
local promiseModule = require(corePackagesService.Packages.Promise)
local utilityModule = require(robloxGui.Modules.Settings.Utility)
local getFFlagEnableNewInviteMenuModule = require(modules.Flags.GetFFlagEnableNewInviteMenu)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local roactAppPolicy = require(corePackagesService.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local httpRequestModule = require(modules.Common.httpRequest)
local headerModule = require(shareGame.Components.Header)
local conversationListModule = require(shareGame.Components.ConversationList)
local constantsModule = require(shareGame.Constants)
local shareInviteLinkModule = require(shareGame.Components.ShareInviteLink)
local getGameNameAndDescription = require(corePackagesService.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local backButtonModule = require(shareGame.Components.BackButton)
local setGameInfoCreatedModule = require(shareGame.Actions.SetGameInfoCreated)
local var17 = 10
local var18 = 44

if getFFlagEnableNewInviteMenuModule() then
	var17 = 16
	var18 = 52
end
local shareGamePageFrame = roactModule.PureComponent:extend("ShareGamePageFrame")
local errorToasterModule = require(shareGame.Components.ErrorToaster)

function shareGamePageFrame.init(p0)
	p0.state = { serverType = nil }
end

function shareGamePageFrame.shouldShowInviteLink(p1, p2)
	-- upvalues: constants (ref), utilityModule (ref)
	return p1.props.experienceInviteShareLinkEnabled and p1.state.serverType == constants.STANDARD_SERVER and utilityModule:IsExperienceOlderThanOneWeek(p2)
end

function shareGamePageFrame.didMount(p3)
	-- upvalues: promiseModule (ref), robloxReplicatedStorageService (ref)
	p3.props.fetchGameInfo()
	
	if p3.state.serverType == nil then
		promiseModule.try(function()
			-- upvalues: robloxReplicatedStorageService (copy)
			return robloxReplicatedStorageService:WaitForChild("GetServerType", 1e999):InvokeServer()
		end):andThen(function(p4)
			-- upvalues: p3 (ref)
			p3:setState({ serverType = p4 })
		end)
	end
end

function shareGamePageFrame.render(p5)
	-- upvalues: constantsModule (ref), backButtonModule (ref), var18 (write), roactModule (ref), coreGuiService (ref), errorToasterModule (ref), headerModule (ref), shareInviteLinkModule (ref), conversationListModule (ref), var17 (write)
	local analytics = p5.props.analytics
	local deviceLayout = p5.props.deviceLayout
	local zIndex = p5.props.zIndex
	local closePage = p5.props.closePage
	local searchAreaActive = p5.props.searchAreaActive
	local searchText = p5.props.searchText
	local var21 = constantsModule.LayoutSpecific[deviceLayout]
	local HEADER_HEIGHT = var21.HEADER_HEIGHT
	local var22 = deviceLayout == constantsModule.DeviceLayout.DESKTOP
	local var23 = if not var22 then backButtonModule.IconType.Arrow else backButtonModule.IconType.None
	local var24 = not var22
	local isVisible = p5.props.isVisible
	local gameInfo = p5:shouldShowInviteLink(p5.props.gameInfo)
	local var26 = 0
	local var27 = 0
	
	if gameInfo then
		var26 -= var18
		var27 = 10
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutoLocalize = false,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		ZIndex = zIndex
	}, {
		toasterPortal = roactModule.createElement(roactModule.Portal, { target = coreGuiService }, { Toaster = roactModule.createElement(errorToasterModule) }),
		Header = roactModule.createElement(headerModule, {
			layoutOrder = 0,
			deviceLayout = deviceLayout,
			size = UDim2.new(1, 0, 0, HEADER_HEIGHT),
			position = UDim2.new(0, 0, 0, -HEADER_HEIGHT),
			zIndex = zIndex,
			closePage = closePage,
			searchAreaActive = searchAreaActive,
			toggleSearchIcon = var24,
			iconType = var23,
			analytics = analytics
		}),
		ShareInviteLink = gameInfo and roactModule.createElement(shareInviteLinkModule, {
			layoutOrder = 1,
			position = UDim2.new(0, 0, 0, var27),
			analytics = analytics,
			deviceLayout = deviceLayout,
			size = UDim2.new(1, 0, 0, var18),
			zIndex = zIndex
		}) or nil,
		ConversationList = roactModule.createElement(conversationListModule, {
			trigger = "GameMenu",
			analytics = analytics,
			size = UDim2.new(1, 0, 1, var21.EXTEND_BOTTOM_SIZE - var17 + var26),
			topPadding = if gameInfo then var17 + var18 + var27 else var17,
			layoutOrder = if gameInfo then 2 else 1,
			zIndex = zIndex,
			searchText = searchText,
			isVisible = isVisible
		})
	})
end

return roactAppPolicy.connect(function(p9)
	return {
		experienceInviteShareLinkEnabled = p9.getExperienceInviteShareLinkEnabled()
	}
end)(roactRoduxModule.connect(function(p6)
	return { gameInfo = p6.GameInfo }
end, function(p7)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getGameNameAndDescription (ref), setGameInfoCreatedModule (ref)
	return {
		fetchGameInfo = function()
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getGameNameAndDescription (copy), p7 (ref), setGameInfoCreatedModule (copy)
			getGameNameAndDescription(httpRequestModule(httpRbxApiService), game.GameId):andThen(function(p8)
				-- upvalues: p7 (copy), setGameInfoCreatedModule (copy)
				p7(setGameInfoCreatedModule(p8.Created))
			end)
		end
	}
end)(shareGamePageFrame))