local appsFlyerUtilModule = require(script.Parent.utils.AppsFlyerUtil)

return function(p0) --[[ line: 4 ]]
	-- upvalues: appsFlyerUtilModule (ref)
	local t = {}
	t.info = {
		webpage = p0.fromString("www:games/{placeId}"),
		store = p0.fromString("www:games/store-section/{universeId}"),
		badges = p0.fromString("www:games/badges-section/{universeId}"),
		servers = p0.fromString("www:games/servers-section/{universeId}"),
		serversPreopenCreateVip = p0.fromString("www:games/servers-section-preopen-create-vip/{universeId}"),
		group = p0.fromString("www:communities/{creatorId}"),
		user = p0.fromString("www:users/{creatorId}/profile"),
		pass = p0.fromString("www:game-pass/{passId}"),
		creator = function(p1) --[[ line: 19 ]]
			-- upvalues: t (ref)
			if p1.creatorType == "Group" then
				return t.info.group(p1)
			elseif p1.creatorType == "User" then
				return t.info.user(p1)
			end
			warn(string.format("%s - unknown creatorType of %s", tostring(script.name), tostring(p1.creatorType)))
			
			return nil
		end,
		appsflyer = function(p2) --[[ line: 28 ]]
			-- upvalues: p0 (ref), appsFlyerUtilModule (copy), t (ref)
			local description = p2.description
			local image = p2.image
			local title = p2.title
			
			return if description and image and title then p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_og_title={title}&af_og_image={image}&af_og_description={description}&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				image = image,
				title = title,
				description = appsFlyerUtilModule.sanitizeDescription(description),
				mobileUrl = p0.fromString("mobilenav:game_details?gameId={universeId}")(p2),
				webUrl = t.info.webpage(p2)
			}) else p0.fromString("appsflyer:Ebh5?pid=share&is_retargeting=true&af_dp={mobileUrl}&af_web_dp={webUrl}")({
				mobileUrl = p0.fromString("mobilenav:game_details?gameId={universeId}")(p2),
				webUrl = t.info.webpage(p2)
			})
		end
	}
	t.details = p0.fromString("games:games?{universeIds}")
	t.playability = p0.fromString("games:games/multiget-playability-status?{universeIds}")
	t.media = p0.fromString("games:games/{universeId}/media")
	t.favorite = p0.fromString("games:games/{universeId}/favorites")
	t.social = p0.fromString("games:games/{universeId}/social-links/list")
	t.recommended = p0.fromString("games:games/recommendations/game/{universeId}?{paginationKey|}&{maxRows|6}")
	t.thumbnail = p0.fromString("games:games/game-thumbnails?{height|150}&{width|150}&{imageTokens}")
	t.vote = {
		all = p0.fromString("games:games/{universeId}/votes"),
		get = p0.fromString("games:games/{universeId}/votes/user"),
		set = p0.fromString("games:games/{universeId}/user-votes")
	}
	t.follow = {
		get = p0.fromString("followings:users/{userId}/universes/{universeId}/status"),
		set = p0.fromString("followings:users/{userId}/universes/{universeId}")
	}
	t.report = p0.fromString("www:abusereport/asset?id={placeId}")
	t.place = p0.fromString("games:games/multiget-place-details?{placeIds}")
	
	return t
end