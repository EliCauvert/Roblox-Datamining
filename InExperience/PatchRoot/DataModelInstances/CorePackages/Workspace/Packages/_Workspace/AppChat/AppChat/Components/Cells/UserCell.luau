local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local _ = require(parent.UIBlox)
local cryoModule = require(parent.Cryo)
local presenceBubbleCellStyledModule = require(script.Parent.PresenceBubbleCellStyled)
local userModel = require(parent.UserLib).Models.UserModel
local circle25 = require(parent.UIBlox).App.ImageSet.Images["component_assets/circle_25"]
local testStyle = require(appChat.SocialLibraries).Components.TestStyle
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local t = {
	subTitleText = "subTitleText",
	childWidth = 0,
	showDivider = true,
	boldTitle = true,
	user = {},
	style = cryoModule.Dictionary.join(testStyle, { Tokens = { Color = { None = {} } } })
}

return reactModule.memo(function(p0) --[[ line: 49 | named "UserCell" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), presenceBubbleCellStyledModule (ref), userModel (ref), circle25 (ref)
	local var5 = cryoModule.Dictionary.join(t, p0)
	local user = var5.user
	
	return reactModule.createElement(presenceBubbleCellStyledModule, {
		style = var5.style,
		childWidth = var5.childWidth,
		onActivated = reactModule.useCallback(function() --[[ line: 51 ]]
			-- upvalues: var5 (ref)
			if var5.onActivated then
				var5.onActivated(var5.user)
			end
		end),
		onCircleActivated = var5.onCircleActivated,
		subTitleText = var5.subTitleText,
		showDivider = var5.showDivider,
		boldTitle = if user.metadata and user.metadata.isPending then false else var5.boldTitle,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(if user.id then tostring(user.id) else nil) else nil else nil,
		avatarCirclePresenceImage = if user.presence == userModel.PresenceType.OFFLINE or user.presence == nil then nil else circle25,
		titleText = user.displayName,
		secondaryTitleText = user.alias,
		thumbnails = reactModule.useMemo(function() --[[ line: 65 ]]
			-- upvalues: user (ref)
			return { user.thumbnail }
		end, { user.thumbnail })
	}, var5.children or {})
end)