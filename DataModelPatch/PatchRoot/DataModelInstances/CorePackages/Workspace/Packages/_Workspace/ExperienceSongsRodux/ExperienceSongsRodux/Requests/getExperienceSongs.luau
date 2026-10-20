local Url = require(script:FindFirstAncestor("ExperienceSongsRodux").Parent.Http).Url

return function(Callback, p1, p2: number)
	-- upvalues: Url (copy)
	if p1 == "" then
		error("GetExperienceSongs: universeId cannot be an empty string")
	end
	return Callback(string.format("%smusic-discovery/v1/experience-songs?universe_id=%s&limit=%s", Url.APIS_URL, tostring(p1), (tostring(if p2 and p2 >= 0 and p2 <= 100 then p2 else 20))), "GET")
end