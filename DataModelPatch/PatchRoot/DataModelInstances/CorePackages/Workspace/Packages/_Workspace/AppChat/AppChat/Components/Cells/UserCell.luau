local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.UIBlox)
local CryoModule = require(Parent.Cryo)
local PresenceBubbleCellStyledModule = require(script.Parent.PresenceBubbleCellStyled)
local UserModel = require(Parent.UserLib).Models.UserModel
local ComponentAssetsCircle25 = require(Parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local config = {
	subTitleText = "subTitleText",
	childWidth = 0,
	showDivider = true,
	boldTitle = true,
	user = {},
	style = CryoModule.Dictionary.join(require(AppChat.SocialLibraries).Components.TestStyle, { Tokens = { Color = { None = {} } } })
}

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), PresenceBubbleCellStyledModule (copy), UserModel (copy), ComponentAssetsCircle25 (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local User = JoinResult.user
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(if User.id then tostring(User.id) else nil) else nil
	
	return ReactModule.createElement(PresenceBubbleCellStyledModule, {
		style = JoinResult.style,
		childWidth = JoinResult.childWidth,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: JoinResult (copy)
			if JoinResult.onActivated then
				JoinResult.onActivated(JoinResult.user)
			end
		end),
		onCircleActivated = JoinResult.onCircleActivated,
		subTitleText = JoinResult.subTitleText,
		showDivider = JoinResult.showDivider,
		boldTitle = not (User.metadata and User.metadata.isPending) and JoinResult.boldTitle,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil,
		avatarCirclePresenceImage = if User.presence == UserModel.PresenceType.OFFLINE or User.presence == nil then nil else ComponentAssetsCircle25,
		titleText = User.displayName,
		secondaryTitleText = User.alias,
		thumbnails = ReactModule.useMemo(function()
			-- upvalues: User (copy)
			return { User.thumbnail }
		end, { User.thumbnail })
	}, JoinResult.children or {})
end)