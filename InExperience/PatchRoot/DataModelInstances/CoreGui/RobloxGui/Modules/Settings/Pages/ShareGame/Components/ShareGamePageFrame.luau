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
local var1 = 10
local var2 = 44

if getFFlagEnableNewInviteMenuModule() then
	var1 = 16
	var2 = 52
end
local shareGamePageFrame = roactModule.PureComponent:extend("ShareGamePageFrame")
local errorToasterModule = require(shareGame.Components.ErrorToaster)

function shareGamePageFrame.init(p1)
	p1.state = { serverType = nil }
end

function shareGamePageFrame.shouldShowInviteLink(p1, p2)
	-- upvalues: constants (ref), utilityModule (ref)
	return p1.props.experienceInviteShareLinkEnabled and p1.state.serverType == constants.STANDARD_SERVER and utilityModule:IsExperienceOlderThanOneWeek(p2)
end

function shareGamePageFrame.didMount(p1)
	-- upvalues: promiseModule (ref), robloxReplicatedStorageService (ref)
	p1.props.fetchGameInfo()
	
	if p1.state.serverType == nil then
		promiseModule.try(function()
			-- upvalues: robloxReplicatedStorageService (copy)
			return robloxReplicatedStorageService:WaitForChild("GetServerType", 1e999):InvokeServer()
		end):andThen(function(p2)
			-- upvalues: p1 (ref)
			p1:setState({ serverType = p2 })
		end)
	end
end

function shareGamePageFrame.render(p1)
	-- upvalues: constantsModule (ref), backButtonModule (ref), var2 (write), roactModule (ref), coreGuiService (ref), errorToasterModule (ref), headerModule (ref), shareInviteLinkModule (ref), conversationListModule (ref), var1 (write)
	local analytics = p1.props.analytics
	local deviceLayout = p1.props.deviceLayout
	local zIndex = p1.props.zIndex
	local closePage = p1.props.closePage
	local searchAreaActive = p1.props.searchAreaActive
	local searchText = p1.props.searchText
	local var3 = constantsModule.LayoutSpecific[deviceLayout]
	local HEADER_HEIGHT = var3.HEADER_HEIGHT
	local var4 = deviceLayout == constantsModule.DeviceLayout.DESKTOP
	local var5 = if not var4 then backButtonModule.IconType.Arrow else backButtonModule.IconType.None
	local var6 = not var4
	local isVisible = p1.props.isVisible
	local gameInfo = p1:shouldShowInviteLink(p1.props.gameInfo)
	local var7 = 0
	local var8 = 0
	
	if gameInfo then
		var7 -= var2
		var8 = 10
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
			toggleSearchIcon = var6,
			iconType = var5,
			analytics = analytics
		}),
		ShareInviteLink = gameInfo and roactModule.createElement(shareInviteLinkModule, {
			layoutOrder = 1,
			position = UDim2.new(0, 0, 0, var8),
			analytics = analytics,
			deviceLayout = deviceLayout,
			size = UDim2.new(1, 0, 0, var2),
			zIndex = zIndex
		}) or nil,
		ConversationList = roactModule.createElement(conversationListModule, {
			trigger = "GameMenu",
			analytics = analytics,
			size = UDim2.new(1, 0, 1, var3.EXTEND_BOTTOM_SIZE - var1 + var7),
			topPadding = if gameInfo then var1 + var2 + var8 else var1,
			layoutOrder = if gameInfo then 2 else 1,
			zIndex = zIndex,
			searchText = searchText,
			isVisible = isVisible
		})
	})
end

return roactAppPolicy.connect(function(p1)
	return {
		experienceInviteShareLinkEnabled = p1.getExperienceInviteShareLinkEnabled()
	}
end)(roactRoduxModule.connect(function(p1)
	return { gameInfo = p1.GameInfo }
end, function(p1)
	-- upvalues: httpRequestModule (ref), httpRbxApiService (ref), getGameNameAndDescription (ref), setGameInfoCreatedModule (ref)
	return {
		fetchGameInfo = function()
			-- upvalues: httpRequestModule (copy), httpRbxApiService (copy), getGameNameAndDescription (copy), p1 (ref), setGameInfoCreatedModule (copy)
			getGameNameAndDescription(httpRequestModule(httpRbxApiService), game.GameId):andThen(function(p2)
				-- upvalues: p1 (copy), setGameInfoCreatedModule (copy)
				p1(setGameInfoCreatedModule(p2.Created))
			end)
		end
	}
end)(shareGamePageFrame))