local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local Players = game:GetService("Players")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ShareGame = Modules.Settings.Pages.ShareGame
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local HttpRequestModule = require(Modules.Common.httpRequest)
local ConstantsModule = require(ShareGame.Constants)
local FetchUserFriendsModule = require(ShareGame.Thunks.FetchUserFriends)
local ClosePageModule = require(ShareGame.Actions.ClosePage)
local ShareGameContainer = RoactModule.PureComponent:extend("ShareGameContainer")
ShareGameContainer.defaultProps = {
	skeletonComponent = require(ShareGame.Components.ShareGamePageFrame)
}

function ShareGameContainer.init(p1) --[[ Line: 30 ]]
	p1.props.reFetch(p1.props.requestImpl)
end

function ShareGameContainer.render(p1) --[[ Line: 34 ]]
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement(p1.props.skeletonComponent, p1.props)
end

return (RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 38 ]]
	return {
		deviceLayout = p1.DeviceInfo.DeviceLayout,
		searchAreaActive = p1.ConversationsSearch.SearchAreaActive,
		searchText = p1.ConversationsSearch.SearchText
	}
end, function(Callback) --[[ Line: 44 ]]
	-- upvalues: ClosePageModule (copy), ConstantsModule (copy), Players (copy), HttpRequestModule (copy), HttpRbxApiService (copy), FetchUserFriendsModule (copy)
	return {
		closePage = function() --[[ Line: 46 ]]
			-- upvalues: Callback (copy), ClosePageModule (upval), ConstantsModule (upval)
			Callback(ClosePageModule(ConstantsModule.PageRoute.SHARE_GAME))
		end,
		reFetch = function(p1) --[[ Line: 50 ]]
			-- upvalues: Players (upval), HttpRequestModule (upval), HttpRbxApiService (upval), Callback (copy), FetchUserFriendsModule (upval)
			Callback(FetchUserFriendsModule(p1 or HttpRequestModule(HttpRbxApiService), (tostring(Players.LocalPlayer.UserId))))
		end
	}
end)(ShareGameContainer))