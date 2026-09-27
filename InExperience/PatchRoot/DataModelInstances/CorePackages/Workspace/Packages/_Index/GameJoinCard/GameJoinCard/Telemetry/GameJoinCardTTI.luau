local parent = script:FindFirstAncestor("GameJoinCard").Parent
local timeToInteractiveTracker = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local t = {
	MobileCardMounted = "MobileGameJoinCardOpened_Mounted",
	MobileBannerMounted = "MobileGameJoinCardOpened_BannerLoaded",
	PeopleListMounted = "PeopleListContextualMenuOpen_Mounted"
}
local t_1 = {
	MobileGameJoinCard = "mobile_game_join_card",
	PeopleListContextualMenu = "people_list_contextual_menu"
}
local t_2 = { EventName = t, Surface = t_1 }
local var1 = nil

function t_2.trackMobileCardClickStart()
	-- upvalues: var1 (write), fFlagMobileGameJoinCardTTITracking (ref), timeToInteractiveTracker (ref), t (ref), t_1 (ref)
	var1 = tick() * 1000
	
	if fFlagMobileGameJoinCardTTITracking then
		timeToInteractiveTracker.trackStart(t.MobileCardMounted, true)
		timeToInteractiveTracker.updateMetadata(t.MobileCardMounted, {
			category = "social_game_join_card",
			page = t_1.MobileGameJoinCard
		})
		timeToInteractiveTracker.trackStart(t.MobileBannerMounted, true)
		timeToInteractiveTracker.updateMetadata(t.MobileBannerMounted, {
			category = "social_game_join_card",
			page = t_1.MobileGameJoinCard
		})
		
		return
	end
end

function t_2.consumeMobileCardClickStartMs()
	-- upvalues: var1 (write)
	var1 = nil
	
	return var1
end

function t_2.trackCardMounted()
	-- upvalues: fFlagMobileGameJoinCardTTITracking (ref), timeToInteractiveTracker (ref), t (ref)
	if fFlagMobileGameJoinCardTTITracking then
		timeToInteractiveTracker.trackEnd(t.MobileCardMounted)
		
		return
	end
end

function t_2.trackBannerLoaded()
	-- upvalues: fFlagMobileGameJoinCardTTITracking (ref), timeToInteractiveTracker (ref), t (ref)
	if fFlagMobileGameJoinCardTTITracking then
		timeToInteractiveTracker.trackEnd(t.MobileBannerMounted)
		
		return
	end
end

function t_2.trackPeopleListClickStart()
	-- upvalues: fFlagMobileGameJoinCardTTITracking (ref), timeToInteractiveTracker (ref), t (ref), t_1 (ref)
	if fFlagMobileGameJoinCardTTITracking then
		timeToInteractiveTracker.trackStart(t.PeopleListMounted, true)
		timeToInteractiveTracker.updateMetadata(t.PeopleListMounted, {
			category = "social_game_join_card",
			page = t_1.PeopleListContextualMenu
		})
		
		return
	end
end

function t_2.trackPeopleListMounted()
	-- upvalues: fFlagMobileGameJoinCardTTITracking (ref), timeToInteractiveTracker (ref), t (ref)
	if fFlagMobileGameJoinCardTTITracking then
		timeToInteractiveTracker.trackEnd(t.PeopleListMounted)
		
		return
	end
end

return t_2