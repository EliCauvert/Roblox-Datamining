local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local fFlagMomentsCommentsUseMockNetwork = require(dataHydration.Parent.SharedFlags).FFlagMomentsCommentsUseMockNetwork
local momentsCommentsMockLatency = game:DefineFastFlag("MomentsCommentsMockLatency", false)
local momentsCommentsMockPostedViewer = game:DefineFastFlag("MomentsCommentsMockPostedViewer", false)
local var1 = nil

if fFlagMomentsCommentsUseMockNetwork then
	local localPlayer = playersService.LocalPlayer
	var1 = require(script.Parent.createCommentsMockNetwork)({
		fetchLatencySeconds = if momentsCommentsMockLatency then 0.2 else nil,
		postLatencySeconds = if momentsCommentsMockLatency then 2 else nil,
		postAuthorUserId = if momentsCommentsMockPostedViewer and localPlayer ~= nil and localPlayer.UserId > 0 then tostring(localPlayer.UserId) else nil
	})
end
return function(p1)
	-- upvalues: fFlagMomentsCommentsUseMockNetwork (ref), var1 (write)
	return if fFlagMomentsCommentsUseMockNetwork then var1 elseif p1 == nil then nil else p1.network
end