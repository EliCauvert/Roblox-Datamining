local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local TModule = require(CorePackages.Packages.t)
local MessageBus = require(CorePackages.Workspace.Packages.MessageBus).MessageBus
local MessageDescriptor = {
	mid = MessageBus.getMessageId("CoplaySession", "statusChanged"),
	validateParams = TModule.strictInterface({
		universeId = TModule.string,
		isCoplaySession = TModule.boolean
	})
}

local function createCoplaySessionReporter(p1)
	local Tbl = {}
	local Flag = false
	local Flag1 = false
	
	local function _(IsCoplaySession)
		-- upvalues: p1 (copy)
		p1.publish({
			universeId = p1.getUniverseId(),
			isCoplaySession = IsCoplaySession
		})
	end
	
	local function reportFriendStatus(Player, FriendStatus)
		-- upvalues: p1 (copy), Flag (ref), Flag1 (ref), Tbl (copy)
		local LocalPlayer = p1.players.LocalPlayer
		
		if Flag and LocalPlayer and LocalPlayer.Parent == p1.players and Player ~= LocalPlayer and Player.Parent == p1.players and FriendStatus == Enum.FriendStatus.Friend then
			Flag1 = true
			Flag = false
			
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
			p1.publish({ isCoplaySession = true, universeId = p1.getUniverseId() })
		end
	end
	
	local function lookUpFriendStatus(p2, LocalPlayer)
		-- upvalues: p1 (copy), Flag (ref), Flag1 (ref), Tbl (copy)
		local Success, Result = pcall(p2.GetFriendStatus, p2, LocalPlayer)
		
		if Success then
			local LocalPlayer1 = p1.players.LocalPlayer
			
			if Flag and LocalPlayer1 and LocalPlayer1.Parent == p1.players and LocalPlayer ~= LocalPlayer1 and LocalPlayer.Parent == p1.players and Result == Enum.FriendStatus.Friend then
				Flag1 = true
				Flag = false
				
				for _, Connection in Tbl do
					Connection:Disconnect()
				end
				table.clear(Tbl)
				p1.publish({ isCoplaySession = true, universeId = p1.getUniverseId() })
			end
		end
	end
	
	local function checkPlayer(Player)
		-- upvalues: p1 (copy), Flag (ref), lookUpFriendStatus (copy)
		local LocalPlayer = p1.players.LocalPlayer
		
		if Flag and LocalPlayer and LocalPlayer.Parent == p1.players and Player ~= LocalPlayer and Player.Parent == p1.players then
			task.spawn(lookUpFriendStatus, LocalPlayer, Player)
		end
	end
	
	return {
		start = function()
			-- upvalues: p1 (copy), Flag (ref), Flag1 (ref), Tbl (copy), reportFriendStatus (copy), checkPlayer (copy), lookUpFriendStatus (copy)
			local LocalPlayer = p1.players.LocalPlayer
			
			if Flag or Flag1 or not LocalPlayer then return end
			Flag = true
			p1.publish({ isCoplaySession = false, universeId = p1.getUniverseId() })
			table.insert(Tbl, LocalPlayer.FriendStatusChanged:Connect(reportFriendStatus))
			table.insert(Tbl, p1.players.PlayerAdded:Connect(checkPlayer))
			
			for _, player in p1.players:GetPlayers() do
				local LocalPlayer1 = p1.players.LocalPlayer
				
				if Flag and LocalPlayer1 and LocalPlayer1.Parent == p1.players and player ~= LocalPlayer1 and player.Parent == p1.players then
					task.spawn(lookUpFriendStatus, LocalPlayer1, player)
				end
			end
		end,
		stop = function()
			-- upvalues: Flag (ref), Tbl (copy)
			Flag = false
			
			for _, Connection in Tbl do
				Connection:Disconnect()
			end
			table.clear(Tbl)
		end
	}
end

local v1 = nil

return {
	new = createCoplaySessionReporter,
	getDefault = function()
		-- upvalues: v1 (ref), createCoplaySessionReporter (copy), Players (copy), MessageBus (copy), MessageDescriptor (copy)
		if v1 == nil then
			v1 = createCoplaySessionReporter({
				players = Players,
				getUniverseId = function(): string
					return (tostring(game.GameId))
				end,
				publish = function(MessageDescriptor1)
					-- upvalues: MessageBus (upval), MessageDescriptor (upval)
					MessageBus.publish(MessageDescriptor, MessageDescriptor1)
				end
			})
		end
		return v1
	end,
	MessageDescriptor = MessageDescriptor
}