local _ = require(script.Parent.VoiceChatServiceManager)

local function _(Player: Player)
	return Player and (Player.Character and Player.Character.PrimaryPart)
end

local _ = function(Player: Player, p1)
	local PrimaryPart = Player and (Player.Character and Player.Character.PrimaryPart)
	
	return if PrimaryPart then (PrimaryPart.Position - p1).Magnitude else nil
end

return {
	getComparator = function(p1)
		return function(Player: Player, Player1: Player): boolean
			-- upvalues: p1 (copy)
			local PrimaryPart = Player and (Player.Character and Player.Character.PrimaryPart)
			local PrimaryPart1 = Player1 and (Player1.Character and Player1.Character.PrimaryPart)
			
			if not PrimaryPart and not PrimaryPart1 then
				return Player.Name:lower() < Player1.Name:lower()
			elseif PrimaryPart and not PrimaryPart1 then
				return true
			elseif PrimaryPart or not PrimaryPart1 then
				local PrimaryPart2 = Player and (Player.Character and Player.Character.PrimaryPart)
				local PrimaryPart21 = Player1 and (Player1.Character and Player1.Character.PrimaryPart)
				
				return (if PrimaryPart2 then (PrimaryPart2.Position - p1).Magnitude else nil) < (if PrimaryPart21 then (PrimaryPart21.Position - p1).Magnitude else nil)
			else
				return false
			end
		end
	end,
	getSortedPlayers = function(Players, p1, p2, p3, p4, Player, p5)
		local List = {}
		
		local function v9(Player: Player, Player1: Player): boolean
			-- upvalues: p2 (copy)
			local PrimaryPart = Player and (Player.Character and Player.Character.PrimaryPart)
			local PrimaryPart1 = Player1 and (Player1.Character and Player1.Character.PrimaryPart)
			
			if not PrimaryPart and not PrimaryPart1 then
				return Player.Name:lower() < Player1.Name:lower()
			elseif PrimaryPart and not PrimaryPart1 then
				return true
			elseif PrimaryPart or not PrimaryPart1 then
				local PrimaryPart2 = Player and (Player.Character and Player.Character.PrimaryPart)
				local PrimaryPart21 = Player1 and (Player1.Character and Player1.Character.PrimaryPart)
				
				return (if PrimaryPart2 then (PrimaryPart2.Position - p2).Magnitude else nil) < (if PrimaryPart21 then (PrimaryPart21.Position - p2).Magnitude else nil)
			else
				return false
			end
		end
		
		for UserId, _ in pairs(p1.participants) do
			local Player1 = Players:GetPlayerByUserId(UserId)
			
			if Player1 and Player ~= Player1 and (p5 or Player1 and (Player1.Character and Player1.Character.PrimaryPart)) then
				if p3 and Player1 then
					local PrimaryPart = Player1 and (Player1.Character and Player1.Character.PrimaryPart)
					
					if p3 < (if PrimaryPart then (PrimaryPart.Position - p2).Magnitude else nil) then
						continue
					end
				end
				if not p4 or p1:getRecentUsersInteractionData()[tostring(Player1.UserId)] then
					table.insert(List, Player1)
				end
			end
		end
		table.sort(List, v9)
		
		return List
	end
}