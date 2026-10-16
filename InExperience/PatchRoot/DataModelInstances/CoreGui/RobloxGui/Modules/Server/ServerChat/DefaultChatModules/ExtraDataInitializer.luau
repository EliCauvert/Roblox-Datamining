local config = {
	Groups = {
		{
			GroupId = 1200769,
			ChatColor = Color3.new(1, 0.8431372549019608, 0)
		}
	},
	Players = { {} }
}

local function _(GroupId, p1) --[[ Line: 23 | Named "MakeIsInGroup" ]]
	assert(type(p1) == "nil" or type(p1) == "number", "requiredRank must be a number or nil")
	
	return function(Player: Player): boolean --[[ Line: 26 ]]
		-- upvalues: p1 (copy), GroupId (copy)
		if not Player or not Player.UserId then
			return false
		end
		local _ = Player.UserId
		local IsInGroup = false
		local Success, Result = pcall(function() --[[ Line: 31 ]]
			-- upvalues: p1 (upval), IsInGroup (ref), Player (copy), GroupId (upval)
			if p1 then
				IsInGroup = p1 < Player:GetRankInGroup(GroupId)
				
				return
			else
				IsInGroup = Player:IsInGroup(GroupId)
			end
		end)
		
		if not Success and Result then
			print("Error checking in group: " .. Result)
		end
		return IsInGroup
	end
end

;(function() --[[ Line: 49 | Named "ConstructIsInGroups" ]]
	-- upvalues: config (copy)
	if config.Groups then
		for _, group in pairs(config.Groups) do
			local GroupId = group.GroupId
			local Rank = group.Rank
			assert(type(Rank) == "nil" or type(Rank) == "number", "requiredRank must be a number or nil")
			
			function group.IsInGroup(Player: Player): boolean --[[ Line: 26 ]]
				-- upvalues: Rank (copy), GroupId (copy)
				if not Player or not Player.UserId then
					return false
				end
				local _ = Player.UserId
				local IsInGroup = false
				local Success, Result = pcall(function() --[[ Line: 31 ]]
					-- upvalues: Rank (upval), IsInGroup (ref), Player (copy), GroupId (upval)
					if Rank then
						IsInGroup = Rank < Player:GetRankInGroup(GroupId)
						
						return
					else
						IsInGroup = Player:IsInGroup(GroupId)
					end
				end)
				
				if not Success and Result then
					print("Error checking in group: " .. Result)
				end
				return IsInGroup
			end
		end
	end
end)()
local Players = game:GetService("Players")

local function GetSpecialChatColor(ChildName) --[[ Line: 60 ]]
	-- upvalues: config (copy), Players (copy)
	if config.Players then
		local ChildName1 = Players:FindFirstChild(ChildName)
		
		if ChildName1 then
			for _, player in pairs(config.Players) do
				if ChildName1.UserId == player.UserId then
					return player.ChatColor
				end
			end
		end
	end
	if config.Groups then
		for _, group in pairs(config.Groups) do
			if group.IsInGroup(Players:FindFirstChild(ChildName)) then
				return group.ChatColor
			end
		end
	end
end

return function(p1) --[[ Line: 80 | Named "Run" ]]
	-- upvalues: GetSpecialChatColor (copy), Players (copy)
	local list = {
		Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
		Color3.new(0.00392156862745098, 0.6352941176470588, 1),
		Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
		BrickColor.new("Bright violet").Color, BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	
	local function GetNameValue(Text: string): number --[[ Line: 93 ]]
		local Total = 0
		
		for i = 1, #Text do
			local ByteValue = string.byte((string.sub(Text, i, i)))
			local NewI = #Text - i + 1
			
			if #Text % 2 == 1 then
				NewI -= 1
			end
			if NewI % 4 >= 2 then
				ByteValue = -ByteValue
			end
			Total += ByteValue
		end
		return Total
	end
	
	local function _(p2) --[[ Line: 110 | Named "ComputeNameColor" ]]
		-- upvalues: list (copy), GetNameValue (copy)
		return list[(GetNameValue(p2) + 0) % #list + 1]
	end
	
	local _ = function(p2) --[[ Line: 114 | Named "GetNameColor" ]]
		-- upvalues: list (copy), GetNameValue (copy)
		local Player = p2:GetPlayer()
		
		return if Player and Player.Team ~= nil then Player.TeamColor.Color else list[(GetNameValue(p2.Name) + 0) % #list + 1]
	end
	
	local function onNewSpeaker(ChildName) --[[ Line: 124 ]]
		-- upvalues: p1 (copy), list (copy), GetNameValue (copy), GetSpecialChatColor (upval)
		local Speaker = p1:GetSpeaker(ChildName)
		
		if not Speaker:GetExtraData("NameColor") then
			local Player = Speaker:GetPlayer()
			Speaker:SetExtraData("NameColor", if Player and Player.Team ~= nil then Player.TeamColor.Color else list[(GetNameValue(Speaker.Name) + 0) % #list + 1])
		end
		if not Speaker:GetExtraData("ChatColor") then
			local SpecialChatColor = GetSpecialChatColor(ChildName)
			
			if SpecialChatColor then
				Speaker:SetExtraData("ChatColor", SpecialChatColor)
			end
		end
		if not Speaker:GetExtraData("Tags") then
			Speaker:SetExtraData("Tags", {})
		end
	end
	
	p1.SpeakerAdded:connect(onNewSpeaker)
	
	for _, value in pairs(p1:GetSpeakerList()) do
		onNewSpeaker(value)
	end
	local ChangedConnections = {}
	Players.PlayerAdded:connect(function(Player) --[[ Line: 161 ]]
		-- upvalues: p1 (copy), list (copy), GetNameValue (copy), ChangedConnections (copy)
		ChangedConnections[Player] = Player.Changed:connect(function(p2) --[[ Line: 162 ]]
			-- upvalues: p1 (upval), Player (copy), list (upval), GetNameValue (upval)
			local Speaker = p1:GetSpeaker(Player.Name)
			
			if Speaker and (p2 == "TeamColor" or p2 == "Neutral" or p2 == "Team") then
				local Player1 = Speaker:GetPlayer()
				Speaker:SetExtraData("NameColor", if Player1 and Player1.Team ~= nil then Player1.TeamColor.Color else list[(GetNameValue(Speaker.Name) + 0) % #list + 1])
			end
		end)
	end)
	Players.PlayerRemoving:connect(function(Player) --[[ Line: 173 ]]
		-- upvalues: ChangedConnections (copy)
		local ChangedConnection = ChangedConnections[Player]
		
		if ChangedConnection then
			ChangedConnection:Disconnect()
		end
		ChangedConnections[Player] = nil
	end)
end