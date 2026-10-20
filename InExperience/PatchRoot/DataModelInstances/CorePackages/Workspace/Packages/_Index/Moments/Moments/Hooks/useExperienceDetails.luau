local Parent = script:FindFirstAncestor("Moments").Parent
local GameGetGameInfoStoreModule = require(Parent.DataHydration.GameGetGameInfoStore)
local FFlagMomentsServeEDPVideos = require(Parent.SharedFlags).FFlagMomentsServeEDPVideos
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = {
	name = nil,
	creatorName = nil,
	isCreatorVerified = false,
	rootPlaceId = nil
}
local Computed = require(Parent.Signals).createComputed(function()
	return nil
end)

return function(p1)
	-- upvalues: GameGetGameInfoStoreModule (copy), Computed (copy), UseSignalStateFunction (copy), config (copy), FFlagMomentsServeEDPVideos (copy)
	local Text = if p1 and p1 ~= 0 then tostring(p1) else nil
	local UseSignalStateResult = UseSignalStateFunction(if Text then GameGetGameInfoStoreModule(false).getAndFetchGameInfo(Text).data else Computed)
	
	if UseSignalStateResult == nil then
		return config
	else
		local Creator = UseSignalStateResult.creator
		
		return {
			name = UseSignalStateResult.name,
			creatorName = if Creator then Creator.name else nil,
			isCreatorVerified = if Creator then Creator.hasVerifiedBadge == true else false,
			rootPlaceId = if FFlagMomentsServeEDPVideos then tonumber(UseSignalStateResult.rootPlaceId) else nil
		}
	end
end