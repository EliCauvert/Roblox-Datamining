local appsFlyerUtilModule = require(script.Parent.utils.AppsFlyerUtil)

return function(p1)
	-- upvalues: appsFlyerUtilModule (ref)
	local t = {}
	t.info = {
		webpage = p1.fromString("www:games/{placeId}"),
		store = p1.fromString("www:games/store-section/{universeId}"),
		badges = p1.fromString("www:games/badges-section/{universeId}"),
		servers = p1.fromString("www:games/servers-section/{universeId}"),
		serversPreopenCreateVip = p1.fromString("www:games/servers-section-preopen-create-vip/{universeId}"),
		group = p1.fromString("www:communities/{creatorId}"),
		user = p1.fromString("www:users/{creatorId}/profile"),
		pass = p1.fromString("www:game-pass/{passId}"),
		creator = function(p2)
			-- upvalues: t (ref)
			if p2.creatorType == "Group" then
				return t.info.group(p2)
			elseif p2.creatorType == "User" then
				return t.info.user(p2)
			end
			warn(string.format("%s - unknown creatorType of %s", tostring(script.name), tostring(p2.creatorType)))
			
			return nil
		end,
		appsflyer = function(p2)
			-- upvalues: p1 (ref), appsFlyerUtilModule (copy), t (ref)
			local description = p2.description
			local image = p2.image
			local title = p2.title
			
			return if description and image and title then p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_og_title={title}&af_og_image={image}&af_og_description={description}&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				image = image,
				title = title,
				description = appsFlyerUtilModule.sanitizeDescription(description),
				mobileUrl = p1.fromString("mobilenav:game_details?gameId={universeId}")(p2),
				webUrl = t.info.webpage(p2)
			}) else p1.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p1.fromString("mobilenav:game_details?gameId={universeId}")(p2),
				webUrl = t.info.webpage(p2)
			})
		end
	}
	t.details = p1.fromString("games:games?{universeIds}")
	t.playability = p1.fromString("games:games/multiget-playability-status?{universeIds}")
	t.media = p1.fromString("games:games/{universeId}/media")
	t.favorite = p1.fromString("games:games/{universeId}/favorites")
	t.social = p1.fromString("games:games/{universeId}/social-links/list")
	t.recommended = p1.fromString("games:games/recommendations/game/{universeId}?{paginationKey|}&{maxRows|6}")
	t.thumbnail = p1.fromString("games:games/game-thumbnails?{height|150}&{width|150}&{imageTokens}")
	t.vote = {
		all = p1.fromString("games:games/{universeId}/votes"),
		get = p1.fromString("games:games/{universeId}/votes/user"),
		set = p1.fromString("games:games/{universeId}/user-votes")
	}
	t.follow = {
		get = p1.fromString("followings:users/{userId}/universes/{universeId}/status"),
		set = p1.fromString("followings:users/{userId}/universes/{universeId}")
	}
	t.report = p1.fromString("www:abusereport/asset?id={placeId}")
	t.place = p1.fromString("games:games/multiget-place-details?{placeIds}")
	
	return t
end