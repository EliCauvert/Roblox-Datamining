local achievements = script:FindFirstAncestor("Achievements")
local loggerModule = require(achievements.Logger)
local _ = require(achievements.Parent.Signal)

return {
	init = function(p0, p1, p2)
		p0.fireFriendCountChanged = p1
		p0.playersService = p2
		p0.friendIds = {}
		p0.friendCount = 0
	end,
	start = function(p3)
		p3.friendIds = p3:_getFriendIds()
		
		for i, v in pairs(p3.playersService:GetPlayers()) do
			p3:_onPlayerAdded(v)
		end
		p3.playerAdded = p3.playersService.PlayerAdded:Connect(function(p4)
			-- upvalues: p3 (ref)
			p3:_onPlayerAdded(p4)
		end)
		p3.playerRemoving = p3.playersService.PlayerRemoving:Connect(function(p5)
			-- upvalues: p3 (ref)
			p3:_onPlayerRemoving(p5)
		end)
	end,
	_getFriendIds = function(p6)
		-- upvalues: loggerModule (ref)
		local function _(p7)
			return coroutine.wrap(function()
				-- upvalues: p7 (ref)
				local var2 = 1
				while true do
					for i, v in ipairs(p7:GetCurrentPage()) do
						coroutine.yield(v, var2)
					end
					if p7.IsFinished then break end
					p7:AdvanceToNextPageAsync()
					var2 += 1
				end
			end)
		end
		
		local ok, status = pcall(function()
			-- upvalues: p6 (ref)
			local t = {}
			
			if p6.playersService.LocalPlayer then
				local userIdFriendsAsync = p6.playersService:GetFriendsAsync(p6.playersService.LocalPlayer.UserId)
				
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
	_onPlayerAdded = function(p8, p9)
		if p8.friendIds[p9.UserId] then
			p8.friendCount += 1
			p8.fireFriendCountChanged(p8.friendCount)
		end
	end,
	_onPlayerRemoving = function(p10, p11)
		if p10.friendIds[p11.UserId] then
			p10.friendCount -= 1
			p10.fireFriendCountChanged(p10.friendCount)
		end
	end,
	stop = function(p12)
		if p12.playerAdded then
			p12.playerAdded:Disconnect()
			p12.playerAdded = nil
		end
		if p12.playerRemoving then
			p12.playerRemoving:Disconnect()
			p12.playerRemoving = nil
		end
		p12.friendIds = {}
		p12.friendCount = 0
	end
}