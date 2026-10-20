local ResultModule = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Result)
local GameCoPlayModule = {
	new = function()
		return {}
	end
}

function GameCoPlayModule.mock()
	-- upvalues: GameCoPlayModule (copy)
	local NewGameCoPlay = GameCoPlayModule.new()
	NewGameCoPlay.rootPlaceId = tostring(12345)
	NewGameCoPlay.name = "Racing Game"
	NewGameCoPlay.thumbnailAssetId = tostring(4948327354)
	NewGameCoPlay.coplayUsers = {
		{
			userDisplayName = "Mr Mittens",
			userId = tostring(4340043999)
		}
	}
	
	return NewGameCoPlay
end

function GameCoPlayModule.fromJsonData(p1)
	-- upvalues: GameCoPlayModule (copy), ResultModule (copy)
	local NewGameCoPlay = GameCoPlayModule.new()
	NewGameCoPlay.rootPlaceId = tostring(p1.rootPlaceId)
	NewGameCoPlay.name = p1.name
	NewGameCoPlay.thumbnailAssetId = tostring(p1.thumbnailAssetId)
	local CoplayUsers = {}
	
	for i = 1, #p1.coplayUsers do
		local CoplayUser = p1.coplayUsers[i]
		table.insert(CoplayUsers, {
			userId = tostring(CoplayUser.userId),
			userDisplayName = CoplayUser.userDisplayName
		})
	end
	NewGameCoPlay.coplayUsers = CoplayUsers
	
	return ResultModule.success(NewGameCoPlay)
end

return GameCoPlayModule