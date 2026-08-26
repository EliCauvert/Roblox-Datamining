local t = {
	Groups = {
		{
			GroupId = 1200769,
			ChatColor = Color3.new(1, 0.843137254902, 0)
		}
	},
	Players = { {} }
}

local function _(p1, p2)
	assert(if type(p2) ~= "nil" then type(p2) == "number" else true, "requiredRank must be a number or nil")
	
	return function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		if not p3 or not p3.UserId then
			return false
		end
		local _ = p3.UserId
		local var1 = false
		local ok, status = pcall(function()
			-- upvalues: p2 (copy), var1 (write), p3 (ref), p1 (copy)
			if p2 then
				var1 = p2 < p3:GetRankInGroup(p1)
				
				return
			end
			var1 = p3:IsInGroup(p1)
		end)
		
		if not ok and status then
			print("Error checking in group: " .. status)
		end
		return var1
	end
end

;(function()
	-- upvalues: t (ref)
	if t.Groups then
		for i, v in pairs(t.Groups) do
			local groupId = v.GroupId
			local rank = v.Rank
			assert(if type(rank) ~= "nil" then type(rank) == "number" else true, "requiredRank must be a number or nil")
			
			function v.IsInGroup(p1)
				-- upvalues: rank (ref), groupId (ref)
				if not p1 or not p1.UserId then
					return false
				end
				local _ = p1.UserId
				local var1 = false
				local ok, status = pcall(function()
					-- upvalues: rank (copy), var1 (write), p1 (ref), groupId (copy)
					if rank then
						var1 = rank < p1:GetRankInGroup(groupId)
						
						return
					end
					var1 = p1:IsInGroup(groupId)
				end)
				
				if not ok and status then
					print("Error checking in group: " .. status)
				end
				return var1
			end
		end
	end
end)()
local playersService = game:GetService("Players")

local function GetSpecialChatColor(p1)
	-- upvalues: t (ref), playersService (ref)
	if t.Players then
		local var1 = playersService:FindFirstChild(p1)
		
		if var1 then
			for i, v in pairs(t.Players) do
				if var1.UserId == v.UserId then
					return v.ChatColor
				end
			end
		end
	end
	if t.Groups then
		for i, v in pairs(t.Groups) do
			if v.IsInGroup(playersService:FindFirstChild(p1)) then
				return v.ChatColor
			end
		end
	end
end

return function(p2)
	-- upvalues: GetSpecialChatColor (ref), playersService (ref)
	local list = {
		Color3.new(0.992156862745, 0.160784313725, 0.262745098039),
		Color3.new(0.003921568627, 0.635294117647, 1),
		Color3.new(0.007843137255, 0.721568627451, 0.341176470588),
		BrickColor.new("Bright violet").Color, BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	
	local function GetNameValue(p3)
		local var2 = 0
		
		for i = 1, #p3 do
			local byteValue = string.byte(string.sub(p3, i, i))
			local var3 = #p3 - i + 1
			
			if #p3 % 2 == 1 then
				var3 -= 1
			end
			if var3 % 4 >= 2 then
				byteValue = -byteValue
			end
			var2 += byteValue
		end
		return var2
	end
	
	local function _(p4)
		-- upvalues: list (ref), GetNameValue (ref)
		return list[(GetNameValue(p4) + 0) % #list + 1]
	end
	
	local _ = function(p4)
		-- upvalues: list (ref), GetNameValue (ref)
		local player = p4:GetPlayer()
		
		return if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(p4.Name) + 0) % #list + 1]
	end
	
	local function onNewSpeaker(p4)
		-- upvalues: p2 (ref), list (ref), GetNameValue (ref), GetSpecialChatColor (copy)
		local var4 = p2:GetSpeaker(p4)
		
		if not var4:GetExtraData("NameColor") then
			local player = var4:GetPlayer()
			var4:SetExtraData("NameColor", if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(var4.Name) + 0) % #list + 1])
		end
		if not var4:GetExtraData("ChatColor") then
			local var5 = GetSpecialChatColor(p4)
			
			if var5 then
				var4:SetExtraData("ChatColor", var5)
			end
		end
		if not var4:GetExtraData("Tags") then
			var4:SetExtraData("Tags", {})
		end
	end
	
	p2.SpeakerAdded:connect(onNewSpeaker)
	
	for i, v in pairs(p2:GetSpeakerList()) do
		onNewSpeaker(v)
	end
	local t = {}
	playersService.PlayerAdded:connect(function(p4)
		-- upvalues: p2 (ref), list (ref), GetNameValue (ref), t (ref)
		t[p4] = p4.Changed:connect(function(p5)
			-- upvalues: p2 (copy), p4 (ref), list (copy), GetNameValue (copy)
			local nameSpeaker = p2:GetSpeaker(p4.Name)
			
			if nameSpeaker and (p5 == "TeamColor" or p5 == "Neutral" or p5 == "Team") then
				local player = nameSpeaker:GetPlayer()
				nameSpeaker:SetExtraData("NameColor", if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(nameSpeaker.Name) + 0) % #list + 1])
			end
		end)
	end)
	playersService.PlayerRemoving:connect(function(p4)
		-- upvalues: t (ref)
		local var4 = t[p4]
		
		if var4 then
			var4:Disconnect()
		end
		t[p4] = nil
	end)
end