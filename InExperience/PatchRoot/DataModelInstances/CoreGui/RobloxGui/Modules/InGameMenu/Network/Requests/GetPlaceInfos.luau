local urlModule = require(script.Parent.Parent.Parent.Network.Url)

return function(p0, p1) --[[ line: 4 ]]
	-- upvalues: urlModule (ref)
	for i, v in ipairs(p1) do
		p1[i] = tostring(v)
	end
	return p0(string.format("%s/v1/games/multiget-place-details?%s", urlModule.GAME_URL, urlModule:makeQueryString({ placeIds = p1 })), "GET")
end