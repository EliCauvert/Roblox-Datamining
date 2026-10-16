local Achievements = script:FindFirstAncestor("Achievements")
local LoggerModule = require(Achievements.Logger)
local _ = require(Achievements.Parent.Signal)

return {
	init = function(p1, FireFriendCountChanged, PlayersService) --[[ Line: 25 ]]
		p1.fireFriendCountChanged = FireFriendCountChanged
		p1.playersService = PlayersService
		p1.friendIds = {}
		p1.friendCount = 0
	end,
	start = function(p1) --[[ Line: 32 ]]
		p1.friendIds = p1:_getFriendIds()
		
		for _, player in pairs(p1.playersService:GetPlayers()) do
			p1:_onPlayerAdded(player)
		end
		p1.playerAdded = p1.playersService.PlayerAdded:Connect(function(Player) --[[ Line: 37 ]]
			-- upvalues: p1 (copy)
			p1:_onPlayerAdded(Player)
		end)
		p1.playerRemoving = p1.playersService.PlayerRemoving:Connect(function(Player) --[[ Line: 40 ]]
			-- upvalues: p1 (copy)
			p1:_onPlayerRemoving(Player)
		end)
	end,
	_getFriendIds = function(p2) --[[ Line: 45 ]]
		-- upvalues: LoggerModule (copy)
		local function _(Pages) --[[ Line: 46 | Named "iterPageItems" ]]
			return coroutine.wrap(function() --[[ Line: 47 ]]
				-- upvalues: Pages (copy)
				local Count = 1
				while true do
					for _, value in ipairs(Pages:GetCurrentPage()) do
						coroutine.yield(value, Count)
					end
					if Pages.IsFinished then break end
					Pages:AdvanceToNextPageAsync()
					Count += 1
				end
			end)
		end
		
		local Success, Result = pcall(function() --[[ Line: 62 ]]
			-- upvalues: p2 (copy)
			local t = {}
			
			if p2.playersService.LocalPlayer then
				local FriendsAsync = p2.playersService:GetFriendsAsync(p2.playersService.LocalPlayer.UserId)
				
				for i, _ in coroutine.wrap(function() --[[ Line: 47 ]]
					-- upvalues: FriendsAsync (copy)
					local Count = 1
					for _, value in ipairs(FriendsAsync:GetCurrentPage()) do
						coroutine.yield(value, Count)
					end
					if FriendsAsync.IsFinished then
					end
					FriendsAsync:AdvanceToNextPageAsync()
					Count += 1
				end) do
					t[i.Id] = true
				end
			end
			return t
		end)
		
		if not Success then
			LoggerModule:warning(Result)
		end
		return Success and Result or {}
	end,
	_onPlayerAdded = function(p3, Player) --[[ Line: 80 ]]
		if p3.friendIds[Player.UserId] then
			p3.friendCount += 1
			p3.fireFriendCountChanged(p3.friendCount)
		end
	end,
	_onPlayerRemoving = function(p3, Player) --[[ Line: 87 ]]
		if p3.friendIds[Player.UserId] then
			p3.friendCount -= 1
			p3.fireFriendCountChanged(p3.friendCount)
		end
	end,
	stop = function(p3) --[[ Line: 94 ]]
		if p3.playerAdded then
			p3.playerAdded:Disconnect()
			p3.playerAdded = nil
		end
		if p3.playerRemoving then
			p3.playerRemoving:Disconnect()
			p3.playerRemoving = nil
		end
		p3.friendIds = {}
		p3.friendCount = 0
	end
}