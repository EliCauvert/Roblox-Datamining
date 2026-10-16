local FriendsRodux = script:FindFirstAncestor("FriendsRodux")
local Parent = FriendsRodux.Parent
local RoduxModule = require(Parent.Rodux)
local _ = require(FriendsRodux.roduxFriendsTypes)
local FFlagAddFriendsPageHighlightUnseenRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local FFlagAddFriendsRefreshRequestOrder = require(Parent.SharedFlags).FFlagAddFriendsRefreshRequestOrder
local t = {}

local function parkTrailingScores(p1, List) --[[ Line: 16 ]]
	local t = {}
	
	for _, value in ipairs(List) do
		t[tostring(value.id)] = true
	end
	local List1 = {}
	local Iterator = pairs
	local RequestsById = p1 and p1.requestsById or {}
	for UserId, Score in Iterator(RequestsById) do
		if not t[UserId] then
			table.insert(List1, { userId = UserId, score = Score })
		end
	end
	table.sort(List1, function(A, B): boolean --[[ Line: 28 ]]
		return A.score < B.score
	end)
	local t1 = {}
	
	for i, value1 in ipairs(List1) do
		t1[value1.userId] = #List + i
	end
	return t1, #List1
end

return function(p2) --[[ Line: 42 ]]
	-- upvalues: RoduxModule (copy), t (copy), FFlagAddFriendsRefreshRequestOrder (copy), parkTrailingScores (copy), FFlagAddFriendsPageHighlightUnseenRequests (copy)
	return RoduxModule.createReducer(t, {
		[p2.friendsNetworking.GetFriendRequests.Succeeded.name] = function(p3, p4) --[[ Line: 46 ]]
			-- upvalues: FFlagAddFriendsRefreshRequestOrder (upval), parkTrailingScores (upval), FFlagAddFriendsPageHighlightUnseenRequests (upval)
			local Amount = 0
			
			if FFlagAddFriendsRefreshRequestOrder and p4.queryArgs and p4.queryArgs.cursor == nil then
				local ParkTrailingScoresResult, ParkTrailingScoresResult2 = parkTrailingScores(p3, p4.responseBody.data)
				p3 = { requestsById = ParkTrailingScoresResult }
				Amount = ParkTrailingScoresResult2
			end
			local P5 = p3 or {}
			local Count = P5.count or 0
			local RequestsById = P5.requestsById or {}
			local Data = p4.responseBody.data
			local NextPageCursor = p4.responseBody.nextPageCursor
			
			if NextPageCursor == P5.lastCursor and NextPageCursor ~= nil then
				return P5
			end
			for i, entry in ipairs(Data) do
				local NewCount = Count + i
				
				if not RequestsById[tostring(entry.id)] then
					if FFlagAddFriendsRefreshRequestOrder then
						RequestsById[tostring(entry.id)] = NewCount
					elseif not FFlagAddFriendsPageHighlightUnseenRequests then
						RequestsById[tostring(entry.id)] = NewCount
					elseif entry.isUnseen then
						RequestsById[tostring(entry.id)] = -(tonumber((string.gsub(string.gsub(entry.friendRequest.sentAt, "%.%d+Z$", "Z"), "%D", ""))) or 0)
					else
						RequestsById[tostring(entry.id)] = NewCount
					end
				end
			end
			local NewCount = Count + #Data
			
			if FFlagAddFriendsRefreshRequestOrder then
				NewCount += Amount
			end
			return {
				count = NewCount,
				lastCursor = NextPageCursor,
				requestsById = RequestsById
			}
		end
	})
end