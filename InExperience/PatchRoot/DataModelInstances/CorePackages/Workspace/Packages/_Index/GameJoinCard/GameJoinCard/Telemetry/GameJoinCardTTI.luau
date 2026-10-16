local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local TimeToInteractiveTracker = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local FFlagMobileGameJoinCardTTITracking = require(Parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local EventName = {
	MobileCardMounted = "MobileGameJoinCardOpened_Mounted",
	MobileBannerMounted = "MobileGameJoinCardOpened_BannerLoaded",
	PeopleListMounted = "PeopleListContextualMenuOpen_Mounted"
}
local Surface = {
	MobileGameJoinCard = "mobile_game_join_card",
	PeopleListContextualMenu = "people_list_contextual_menu"
}
local ScaledCurrentTime = nil

return {
	EventName = EventName,
	Surface = Surface,
	trackMobileCardClickStart = function() --[[ Line: 51 ]]
		-- upvalues: ScaledCurrentTime (ref), FFlagMobileGameJoinCardTTITracking (copy), TimeToInteractiveTracker (copy), EventName (copy), Surface (copy)
		ScaledCurrentTime = tick() * 1000
		
		if FFlagMobileGameJoinCardTTITracking then
			TimeToInteractiveTracker.trackStart(EventName.MobileCardMounted, true)
			TimeToInteractiveTracker.updateMetadata(EventName.MobileCardMounted, {
				category = "social_game_join_card",
				page = Surface.MobileGameJoinCard
			})
			TimeToInteractiveTracker.trackStart(EventName.MobileBannerMounted, true)
			TimeToInteractiveTracker.updateMetadata(EventName.MobileBannerMounted, {
				category = "social_game_join_card",
				page = Surface.MobileGameJoinCard
			})
			
			return
		end
	end,
	consumeMobileCardClickStartMs = function() --[[ Line: 71 ]]
		-- upvalues: ScaledCurrentTime (ref)
		local ScaledCurrentTime1 = ScaledCurrentTime
		ScaledCurrentTime = nil
		
		return ScaledCurrentTime1
	end,
	trackCardMounted = function() --[[ Line: 77 ]]
		-- upvalues: FFlagMobileGameJoinCardTTITracking (copy), TimeToInteractiveTracker (copy), EventName (copy)
		if FFlagMobileGameJoinCardTTITracking then
			TimeToInteractiveTracker.trackEnd(EventName.MobileCardMounted)
			
			return
		end
	end,
	trackBannerLoaded = function() --[[ Line: 85 ]]
		-- upvalues: FFlagMobileGameJoinCardTTITracking (copy), TimeToInteractiveTracker (copy), EventName (copy)
		if FFlagMobileGameJoinCardTTITracking then
			TimeToInteractiveTracker.trackEnd(EventName.MobileBannerMounted)
			
			return
		end
	end,
	trackPeopleListClickStart = function() --[[ Line: 93 ]]
		-- upvalues: FFlagMobileGameJoinCardTTITracking (copy), TimeToInteractiveTracker (copy), EventName (copy), Surface (copy)
		if FFlagMobileGameJoinCardTTITracking then
			TimeToInteractiveTracker.trackStart(EventName.PeopleListMounted, true)
			TimeToInteractiveTracker.updateMetadata(EventName.PeopleListMounted, {
				category = "social_game_join_card",
				page = Surface.PeopleListContextualMenu
			})
			
			return
		end
	end,
	trackPeopleListMounted = function() --[[ Line: 105 ]]
		-- upvalues: FFlagMobileGameJoinCardTTITracking (copy), TimeToInteractiveTracker (copy), EventName (copy)
		if FFlagMobileGameJoinCardTTITracking then
			TimeToInteractiveTracker.trackEnd(EventName.PeopleListMounted)
			
			return
		end
	end
}