local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local DataHydrationModule = require(Parent.DataHydration)
local _ = require(Parent.DataHydration.FriendsRequests)
local UseCarouselVisibilityModule = require(SocialCarousel.Hooks.useCarouselVisibility)
local UseFriendRequestPollTriggerModule = require(SocialCarousel.Hooks.useFriendRequestPollTrigger)
local GetResult = if require(Parent.SharedFlags).FFlagShowRequestsInCarouselForAllUsers then DataHydrationModule.Presence.PresenceStore.get() else nil

return function(Current, p1, p2, p3)
	-- upvalues: UseCarouselVisibilityModule (copy), ReactModule (copy), GetResult (copy), UseFriendRequestPollTriggerModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	UseFriendRequestPollTriggerModule(UseCarouselVisibilityModule(#Current > 0, p3), ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), GetResult (upval)
		for _, value in UseRefResult.current do
			GetResult.RefreshPresenceByUserId((tostring(value.id)))
		end
	end, {}), p1, p2)
end