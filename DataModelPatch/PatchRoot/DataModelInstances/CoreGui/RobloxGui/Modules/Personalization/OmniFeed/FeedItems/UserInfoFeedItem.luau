local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local PromiseModule = require(CorePackages.Packages.Promise)
local SetNetworkingErrorToastFunction = require(CorePackages.Workspace.Packages.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local PreloadUsersThumbnailFunction = require(CorePackages.Workspace.Packages.UserLib).Thunks.PreloadUsersThumbnail
local AvatarThumbnailRequests = require(CorePackages.Workspace.Packages.UserLib).Utils.AvatarThumbnailRequests
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local HomeUserInfoWidgetModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Home.HomeUserInfoWidget)
local FFlagLuaAppCompositionAlways = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways
local GAMECAROUSELSIDECOMPACTPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING
local GAMECAROUSELSIDEWIDEPADDING = DiscoveryTypesModule.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING
local UserInfoFeedItem = RoactModule.PureComponent:extend("UserInfoFeedItem")
UserInfoFeedItem.validateProps = TModule.strictInterface({
	[OmniFeedProps.key] = OmniFeedProps.interface,
	formFactor = TModule.string,
	localUserModel = TModule.optional(TModule.table),
	refresh = TModule.callback,
	networking = TModule.any
})

function UserInfoFeedItem.init(p1)
	-- upvalues: OmniFeedProps (copy)
	p1.isMounted = false
	p1.refreshSignalConnection = p1.props[OmniFeedProps.key].refreshSignal:connect(function()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.refresh(p1.props.networking, p1.props.localUserModel)
		end
	end)
end

function UserInfoFeedItem.didMount(p1)
	p1.isMounted = true
end

function UserInfoFeedItem.render(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), OmniFeedProps (copy), FormFactor (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), GAMECAROUSELSIDEWIDEPADDING (copy), RoactModule (copy), HomeUserInfoWidgetModule (copy)
	local FormFactor1 = p1.props.formFactor
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1.props[OmniFeedProps.key].appCompositionEnabled
	
	return RoactModule.createElement(HomeUserInfoWidgetModule, {
		sideMargin = if AppCompositionEnabled then 0 elseif FormFactor1 == FormFactor.COMPACT then GAMECAROUSELSIDECOMPACTPADDING else GAMECAROUSELSIDEWIDEPADDING
	})
end

function UserInfoFeedItem.willUnmount(p1)
	p1.isMounted = false
	
	if p1.refreshSignalConnection then
		p1.refreshSignalConnection:disconnect()
		p1.refreshSignalConnection = nil
	end
end

local MemoizeResult = MemoizeFunction(function(p1, p2)
	return p1[p2]
end)

return (RoactServices.connect({ networking = RoactNetworking })((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: MemoizeResult (copy)
	return {
		formFactor = p1.FormFactor,
		localUserModel = MemoizeResult(p1.Users, p1.LocalUserId)
	}
end, function(Callback)
	-- upvalues: PreloadUsersThumbnailFunction (copy), AvatarThumbnailRequests (copy), PromiseModule (copy), SetNetworkingErrorToastFunction (copy)
	return {
		refresh = function(_, p1)
			-- upvalues: Callback (copy), PreloadUsersThumbnailFunction (upval), AvatarThumbnailRequests (upval), PromiseModule (upval), SetNetworkingErrorToastFunction (upval)
			return PromiseModule.all({
				(Callback(PreloadUsersThumbnailFunction({ p1.id }, AvatarThumbnailRequests.HOME_HEADER_USER, nil)))
			}):andThen(function(Result)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve(Result)
			end, function(p2)
				-- upvalues: Callback (upval), SetNetworkingErrorToastFunction (upval), PromiseModule (upval)
				Callback((SetNetworkingErrorToastFunction(p2)))
				
				return PromiseModule.reject(p2)
			end)
		end
	}
end)(UserInfoFeedItem))))