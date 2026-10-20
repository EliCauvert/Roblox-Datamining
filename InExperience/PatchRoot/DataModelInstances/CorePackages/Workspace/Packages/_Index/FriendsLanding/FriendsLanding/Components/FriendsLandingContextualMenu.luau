local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local WithStyleFunction = UIBlox.Style.withStyle
local WithLocalizationFunction = DependenciesModule.withLocalization
local ContextualMenu = UIBlox.App.Menu.ContextualMenu
local MenuDirection = UIBlox.App.Menu.MenuDirection
local FriendsLandingContextModule = require(FriendsLanding.FriendsLandingContext)
local Images = UIBlox.App.ImageSet.Images
local MapStateToPropsModule = require(FriendsLanding.Components.FriendsLandingContainer.mapStateToProps)
local RoactRodux = DependenciesModule.RoactRodux
local ComposeFunction = DependenciesModule.SocialLibraries.RoduxTools.compose
local FriendsNetworking = DependenciesModule.FriendsNetworking
local EnumScreensModule = require(FriendsLanding.EnumScreens)
local MemoizeFunction = DependenciesModule.memoize
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local FriendsLandingContextualMenu = Roact.PureComponent:extend("FriendsLandingContextualMenu")
local MotorOverrideOptions = {
	motorCallback = DependenciesModule.Otter.instant,
	open = { targetValue = 1 },
	close = { targetValue = 0 }
}

function FriendsLandingContextualMenu.init(p1)
	-- upvalues: MemoizeFunction (copy), EnumScreensModule (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), Images (copy)
	function p1.onClose()
		-- upvalues: p1 (copy)
		if p1.props.navigation then
			p1.props.navigation.goBack()
		end
	end
	
	p1.onUnfriend = MemoizeFunction(function(ToastTitle, IconImage)
		-- upvalues: p1 (copy), EnumScreensModule (upval)
		p1.props.navigation.navigate(EnumScreensModule.GenericToast, {
			toastProps = {
				toastContent = { toastTitle = ToastTitle, iconImage = IconImage }
			}
		})
	end)
	p1.onActivated = MemoizeFunction(function(p2, p3)
		-- upvalues: p1 (copy), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), Images (upval)
		return function()
			-- upvalues: p1 (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), p2 (copy), Images (upval), p3 (copy)
			local UserId = p1.props.navigation.state.params.userId
			
			if UserId ~= nil then
				(if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.Unfriend(UserId) else p1.props.unfriendTargetUserId({
					targetUserId = UserId,
					currentUserId = p1.props.localUserId
				})):andThen(function()
					-- upvalues: p1 (upval), p2 (upval), Images (upval)
					p1.onUnfriend(p2, Images["icons/actions/friends/friendRemove"])
				end):catch(function()
					-- upvalues: p1 (upval), p3 (upval)
					p1.onUnfriend(p3)
				end)
			end
			p1.onClose()
		end
	end)
end

function FriendsLandingContextualMenu.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), Roact (copy), ContextualMenu (copy), Images (copy), MenuDirection (copy), MotorOverrideOptions (copy)
	return WithStyleFunction(function(_)
		-- upvalues: WithLocalizationFunction (upval), Roact (upval), ContextualMenu (upval), Images (upval), p1 (copy), MenuDirection (upval), MotorOverrideOptions (upval)
		return WithLocalizationFunction({
			unfriend = "Feature.Friends.Action.Unfriend",
			error = "Feature.Toast.NetworkingError.SomethingIsWrong",
			success = "Feature.Friends.Action.FriendRemoved"
		})(function(p2)
			-- upvalues: Roact (upval), ContextualMenu (upval), Images (upval), p1 (upval), MenuDirection (upval), MotorOverrideOptions (upval)
			return Roact.createElement(ContextualMenu, {
				open = true,
				closeBackgroundVisible = false,
				buttonProps = {
					{
						icon = Images["icons/actions/friends/friendRemove"],
						text = p2.unfriend,
						onActivated = p1.onActivated(p2.success, p2.error)
					}
				},
				menuDirection = MenuDirection.Up,
				openPositionY = UDim.new(1, -24),
				screenSize = p1.props.screenSize,
				onDismiss = p1.onClose,
				motorOverrideOptions = MotorOverrideOptions
			})
		end)
	end)
end

return ComposeFunction(RoactRodux.connect(MapStateToPropsModule, function(Callback)
	-- upvalues: FriendsNetworking (copy)
	return {
		unfriendTargetUserId = function(p1)
			-- upvalues: Callback (copy), FriendsNetworking (upval)
			return Callback(FriendsNetworking.UnfriendTargetUserId.API(p1))
		end
	}
end), FriendsLandingContextModule.connect(function(p1, _)
	return { screenSize = p1.screenSize }
end))(FriendsLandingContextualMenu)