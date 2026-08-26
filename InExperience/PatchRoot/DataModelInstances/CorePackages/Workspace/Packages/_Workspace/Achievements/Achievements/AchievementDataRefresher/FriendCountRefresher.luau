local achievements = script:FindFirstAncestor("Achievements")
local loggerModule = require(achievements.Logger)
local _ = require(achievements.Parent.Signal)

return {
	init = function(p1, p2, p3)
		p1.fireFriendCountChanged = p2
		p1.playersService = p3
		p1.friendIds = {}
		p1.friendCount = 0
	end,
	start = function(p1)
		p1.friendIds = p1:_getFriendIds()
		
		for i, v in pairs(p1.playersService:GetPlayers()) do
			p1:_onPlayerAdded(v)
		end
		p1.playerAdded = p1.playersService.PlayerAdded:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:_onPlayerAdded(p2)
		end)
		p1.playerRemoving = p1.playersService.PlayerRemoving:Connect(function(p2)
			-- upvalues: p1 (ref)
			p1:_onPlayerRemoving(p2)
		end)
	end,
	_getFriendIds = function(p2)
		-- upvalues: loggerModule (ref)
		local function _(p3)
			return coroutine.wrap(function()
				-- upvalues: p3 (ref)
				local var1 = 1
				while true do
					for i, v in ipairs(p3:GetCurrentPage()) do
						coroutine.yield(v, var1)
					end
					if p3.IsFinished then break end
					p3:AdvanceToNextPageAsync()
					var1 += 1
				end
			end)
		end
		
		local ok, status = pcall(function()
			-- upvalues: p2 (ref)
			local t = {}
			
			if p2.playersService.LocalPlayer then
				local userIdFriendsAsync = p2.playersService:GetFriendsAsync(p2.playersService.LocalPlayer.UserId)
				
				for i, v in coroutine.wrap(function()
					-- upvalues: userIdFriendsAsync (ref)
					local var2 = 1
					while true do
						for i, v in ipairs(userIdFriendsAsync:GetCurrentPage()) do
							coroutine.yield(v, var2)
						end
						if userIdFriendsAsync.IsFinished then
							break
						end
						break
						userIdFriendsAsync:AdvanceToNextPageAsync()
						var2 += 1
					end
				end) do
					t[i.Id] = true
				end
			end
			return t
		end)
		
		if not ok then
			loggerModule:warning(status)
		end
		return if ok then status else {}
	end,
	_onPlayerAdded = function(p4, p5)
		if p4.friendIds[p5.UserId] then
			p4.friendCount += 1
			p4.fireFriendCountChanged(p4.friendCount)
		end
	end,
	_onPlayerRemoving = function(p4, p5)
		if p4.friendIds[p5.UserId] then
			p4.friendCount -= 1
			p4.fireFriendCountChanged(p4.friendCount)
		end
	end,
	stop = function(p4)
		if p4.playerAdded then
			p4.playerAdded:Disconnect()
			p4.playerAdded = nil
		end
		if p4.playerRemoving then
			p4.playerRemoving:Disconnect()
			p4.playerRemoving = nil
		end
		p4.friendIds = {}
		p4.friendCount = 0
	end
}