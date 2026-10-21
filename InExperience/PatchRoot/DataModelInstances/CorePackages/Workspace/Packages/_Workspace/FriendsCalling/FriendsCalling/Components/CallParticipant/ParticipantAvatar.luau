local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Avatar = FoundationModule.Avatar
local _ = FoundationModule.Enums.AvatarSize
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Avatar (copy)
	return ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center",
		Size = UDim2.fromOffset(p1.ringSize, p1.ringSize)
	}, {
		SpeakingRing = if p1.isSpeaking then ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center stroke-thick stroke-system-success radius-circle",
			testId = "friends-calling-participant-speaking",
			Size = UDim2.fromOffset(p1.ringSize, p1.ringSize)
		}) else nil,
		Avatar = ReactModule.createElement(View, {
			tag = "position-center-center anchor-center-center auto-xy",
			testId = "friends-calling-participant-avatar",
			GroupTransparency = if p1.isDimmed then 0.7 else nil
		}, {
			Headshot = ReactModule.createElement(Avatar, { size = p1.avatarSize, userId = p1.userId })
		})
	})
end