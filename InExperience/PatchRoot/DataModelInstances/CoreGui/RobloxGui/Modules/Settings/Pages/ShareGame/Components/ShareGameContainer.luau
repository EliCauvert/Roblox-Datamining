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

function shareGameContainer.init(p0) --[[ line: 30 ]]
	p0.props.reFetch()
end

function shareGameContainer.render(p1) --[[ line: 34 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement(p1.props.skeletonComponent, p1.props)
end

return roactRoduxModule.UNSTABLE_connect2(function(p2, _) --[[ line: 38 ]]
	return {
		deviceLayout = p2.DeviceInfo.DeviceLayout,
		searchAreaActive = p2.ConversationsSearch.SearchAreaActive,
		searchText = p2.ConversationsSearch.SearchText
	}
end, function(p3) --[[ line: 44 ]]
	-- upvalues: closePageModule (ref), constantsModule (ref), playersService (ref), httpRequestModule (ref), httpRbxApiService (ref), fetchUserFriendsModule (ref)
	return {
		closePage = function() --[[ line: 46 ]]
			-- upvalues: p3 (ref), closePageModule (copy), constantsModule (copy)
			p3(closePageModule(constantsModule.PageRoute.SHARE_GAME))
		end,
		reFetch = function() --[[ line: 50 ]]
			-- upvalues: playersService (copy), httpRequestModule (copy), httpRbxApiService (copy), p3 (ref), fetchUserFriendsModule (copy)
			p3(fetchUserFriendsModule(httpRequestModule(httpRbxApiService), tostring(playersService.LocalPlayer.UserId)))
		end
	}
end)(shareGameContainer)