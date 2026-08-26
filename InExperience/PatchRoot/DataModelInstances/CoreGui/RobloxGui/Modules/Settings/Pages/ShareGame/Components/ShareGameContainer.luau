local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local playersService = game:GetService("Players")
local modules = coreGuiService.RobloxGui.Modules
local shareGame = modules.Settings.Pages.ShareGame
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local httpRequestModule = require(modules.Common.httpRequest)
local shareGamePageFrameModule = require(shareGame.Components.ShareGamePageFrame)
local constantsModule = require(shareGame.Constants)
local fetchUserFriendsModule = require(shareGame.Thunks.FetchUserFriends)
local closePageModule = require(shareGame.Actions.ClosePage)
local shareGameContainer = roactModule.PureComponent:extend("ShareGameContainer")
shareGameContainer.defaultProps = { skeletonComponent = shareGamePageFrameModule }

function shareGameContainer.init(p1)
	p1.props.reFetch(p1.props.requestImpl)
end

function shareGameContainer.render(p1)
	-- upvalues: roactModule (ref)
	return roactModule.createElement(p1.props.skeletonComponent, p1.props)
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		deviceLayout = p1.DeviceInfo.DeviceLayout,
		searchAreaActive = p1.ConversationsSearch.SearchAreaActive,
		searchText = p1.ConversationsSearch.SearchText
	}
end, function(p1)
	-- upvalues: closePageModule (ref), constantsModule (ref), playersService (ref), httpRequestModule (ref), httpRbxApiService (ref), fetchUserFriendsModule (ref)
	return {
		closePage = function()
			-- upvalues: p1 (ref), closePageModule (copy), constantsModule (copy)
			p1(closePageModule(constantsModule.PageRoute.SHARE_GAME))
		end,
		reFetch = function(p2)
			-- upvalues: playersService (copy), httpRequestModule (copy), httpRbxApiService (copy), p1 (ref), fetchUserFriendsModule (copy)
			p1(fetchUserFriendsModule(p2 or httpRequestModule(httpRbxApiService), tostring(playersService.LocalPlayer.UserId)))
		end
	}
end)(shareGameContainer)