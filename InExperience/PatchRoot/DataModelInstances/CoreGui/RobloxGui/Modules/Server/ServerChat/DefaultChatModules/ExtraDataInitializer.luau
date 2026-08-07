local t = {
	Groups = {
		{
			GroupId = 1200769,
			ChatColor = Color3.new(1, 0.843137254902, 0)
		}
	},
	Players = { {} }
}

local function _(p0, p1) --[[ line: 23 | named "MakeIsInGroup" ]]
	assert(if type(p1) ~= "nil" then type(p1) == "number" else true, "requiredRank must be a number or nil")
	
	return function(p2) --[[ line: 26 ]]
		-- upvalues: p1 (ref), p0 (ref)
		if not p2 or not p2.UserId then
			return false
		end
		local _ = p2.UserId
		local var3 = false
		local ok, status = pcall(function() --[[ line: 31 ]]
			-- upvalues: p1 (copy), var3 (write), p2 (ref), p0 (copy)
			if p1 then
				var3 = p1 < p2:GetRankInGroup(p0)
				
				return
			end
			var3 = p2:IsInGroup(p0)
		end)
		
		if not ok and status then
			print("Error checking in group: " .. status)
		end
		return var3
	end
end

;(function() --[[ line: 49 | named "ConstructIsInGroups" ]]
	-- upvalues: t (ref)
	if t.Groups then
		for i, v in pairs(t.Groups) do
			local groupId = v.GroupId
			local rank = v.Rank
			assert(if type(rank) ~= "nil" then type(rank) == "number" else true, "requiredRank must be a number or nil")
			
			function v.IsInGroup(p3) --[[ line: 26 ]]
				-- upvalues: rank (ref), groupId (ref)
				if not p3 or not p3.UserId then
					return false
				end
				local _ = p3.UserId
				local var3 = false
				local ok, status = pcall(function() --[[ line: 31 ]]
					-- upvalues: rank (copy), var3 (write), p3 (ref), groupId (copy)
					if rank then
						var3 = rank < p3:GetRankInGroup(groupId)
						
						return
					end
					var3 = p3:IsInGroup(groupId)
				end)
				
				if not ok and status then
					print("Error checking in group: " .. status)
				end
				return var3
			end
		end
	end
end)()
local playersService = game:GetService("Players")

local function GetSpecialChatColor(p4) --[[ line: 60 ]]
	-- upvalues: t (ref), playersService (ref)
	if t.Players then
		local var4 = playersService:FindFirstChild(p4)
		
		if var4 then
			for i, v in pairs(t.Players) do
				if var4.UserId == v.UserId then
					return v.ChatColor
				end
			end
		end
	end
	if t.Groups then
		for i, v in pairs(t.Groups) do
			if v.IsInGroup(playersService:FindFirstChild(p4)) then
				return v.ChatColor
			end
		end
	end
end

return function(p5) --[[ line: 80 | named "Run" ]]
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
	
	local function GetNameValue(p6) --[[ line: 93 ]]
		local var9 = 0
		
		for i = 1, #p6 do
			local byteValue = string.byte(string.sub(p6, i, i))
			local var11 = #p6 - i + 1
			
			if #p6 % 2 == 1 then
				var11 -= 1
			end
			if var11 % 4 >= 2 then
				byteValue = -byteValue
			end
			var9 += byteValue
		end
		return var9
	end
	
	local function _(p7) --[[ line: 110 | named "ComputeNameColor" ]]
		-- upvalues: list (ref), GetNameValue (ref)
		return list[(GetNameValue(p7) + 0) % #list + 1]
	end
	
	local _ = function(p8) --[[ line: 114 | named "GetNameColor" ]]
		-- upvalues: list (ref), GetNameValue (ref)
		local player = p8:GetPlayer()
		
		return if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(p8.Name) + 0) % #list + 1]
	end
	
	local function onNewSpeaker(p9) --[[ line: 124 ]]
		-- upvalues: p5 (ref), list (ref), GetNameValue (ref), GetSpecialChatColor (copy)
		local var13 = p5:GetSpeaker(p9)
		
		if not var13:GetExtraData("NameColor") then
			local player = var13:GetPlayer()
			var13:SetExtraData("NameColor", if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(var13.Name) + 0) % #list + 1])
		end
		if not var13:GetExtraData("ChatColor") then
			local var15 = GetSpecialChatColor(p9)
			
			if var15 then
				var13:SetExtraData("ChatColor", var15)
			end
		end
		if not var13:GetExtraData("Tags") then
			var13:SetExtraData("Tags", {})
		end
	end
	
	p5.SpeakerAdded:connect(onNewSpeaker)
	
	for i, v in pairs(p5:GetSpeakerList()) do
		onNewSpeaker(v)
	end
	local t = {}
	playersService.PlayerAdded:connect(function(p10) --[[ line: 161 ]]
		-- upvalues: p5 (ref), list (ref), GetNameValue (ref), t (ref)
		t[p10] = p10.Changed:connect(function(p11) --[[ line: 162 ]]
			-- upvalues: p5 (copy), p10 (ref), list (copy), GetNameValue (copy)
			local nameSpeaker = p5:GetSpeaker(p10.Name)
			
			if nameSpeaker and (p11 == "TeamColor" or p11 == "Neutral" or p11 == "Team") then
				local player = nameSpeaker:GetPlayer()
				nameSpeaker:SetExtraData("NameColor", if player and player.Team ~= nil then player.TeamColor.Color else list[(GetNameValue(nameSpeaker.Name) + 0) % #list + 1])
			end
		end)
	end)
	playersService.PlayerRemoving:connect(function(p12) --[[ line: 173 ]]
		-- upvalues: t (ref)
		local var18 = t[p12]
		
		if var18 then
			var18:Disconnect()
		end
		t[p12] = nil
	end)
end