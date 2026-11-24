local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local BlockingUtilityModule = require(Parent.BlockingUtility)
local SignalsModule = require(Parent.Signals)
local GetLocalUserIdModule = require(FriendsChat.Utils.getLocalUserId)
local CreateInServerPlayersStoreModule = require(script.createInServerPlayersStore)
local Players = game:GetService("Players")

local function _(Signal, p1)
	local Connection = Signal:Connect(function(Player)
		-- upvalues: p1 (copy)
		p1(Player.UserId)
	end)
	
	return function()
		-- upvalues: Connection (copy)
		Connection:Disconnect()
	end
end

return SignalsModule.createComputed(function()
	-- upvalues: CreateInServerPlayersStoreModule (copy), GetLocalUserIdModule (copy), Players (copy), BlockingUtilityModule (copy)
	return CreateInServerPlayersStoreModule({
		getLocalUserId = GetLocalUserIdModule,
		getPlayerUserIds = function()
			-- upvalues: Players (upval)
			local List = {}
			
			for _, player in Players:GetPlayers() do
				table.insert(List, player.UserId)
			end
			return List
		end,
		onPlayerAdded = function(p1)
			-- upvalues: Players (upval)
			local PlayerAddedConnection = Players.PlayerAdded:Connect(function(Player)
				-- upvalues: p1 (copy)
				p1(Player.UserId)
			end)
			
			return function()
				-- upvalues: PlayerAddedConnection (copy)
				PlayerAddedConnection:Disconnect()
			end
		end,
		onPlayerRemoving = function(Callback)
			-- upvalues: Players (upval)
			local PlayerRemovingConnection = Players.PlayerRemoving:Connect(function(Player)
				-- upvalues: Callback (copy)
				Callback(Player.UserId)
			end)
			
			return function()
				-- upvalues: PlayerRemovingConnection (copy)
				PlayerRemovingConnection:Disconnect()
			end
		end,
		isBlocked = function(p1)
			-- upvalues: BlockingUtilityModule (upval)
			return BlockingUtilityModule:IsPlayerBlockedByUserId(p1)
		end,
		onBlockedStatusChanged = function(Callback)
			-- upvalues: BlockingUtilityModule (upval)
			local Connection = BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(Callback)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	})
end)