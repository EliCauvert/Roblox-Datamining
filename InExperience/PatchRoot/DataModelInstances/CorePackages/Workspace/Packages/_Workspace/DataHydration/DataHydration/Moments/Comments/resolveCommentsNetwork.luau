local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local FFlagMomentsCommentsUseMockNetwork = require(DataHydration.Parent.SharedFlags).FFlagMomentsCommentsUseMockNetwork
local MomentsCommentsMockLatency = game:DefineFastFlag("MomentsCommentsMockLatency", false)
local MomentsCommentsMockPostedViewer = game:DefineFastFlag("MomentsCommentsMockPostedViewer", false)
local v1 = nil

if FFlagMomentsCommentsUseMockNetwork then
	local LocalPlayer = Players.LocalPlayer
	v1 = require(script.Parent.createCommentsMockNetwork)({
		fetchLatencySeconds = if MomentsCommentsMockLatency then 0.2 else nil,
		postLatencySeconds = if MomentsCommentsMockLatency then 2 else nil,
		postAuthorUserId = if MomentsCommentsMockPostedViewer and LocalPlayer ~= nil and LocalPlayer.UserId > 0 then tostring(LocalPlayer.UserId) else nil
	})
end
return function(p1) --[[ Line: 32 | Named "resolveCommentsNetwork" ]]
	-- upvalues: FFlagMomentsCommentsUseMockNetwork (copy), v1 (ref)
	return if FFlagMomentsCommentsUseMockNetwork then v1 elseif p1 == nil then nil else p1.network
end