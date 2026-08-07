local _ = require(script.Parent.VoiceChatServiceManager)

local function _(p0) --[[ line: 4 | named "getPlayerPrimaryPart" ]]
	return p0 and (p0.Character and p0.Character.PrimaryPart)
end

local _ = function(p1, p2) --[[ line: 8 | named "getPlayerDistanceFrom" ]]
	local primaryPart = p1 and (p1.Character and p1.Character.PrimaryPart)
	
	return if primaryPart then (primaryPart.Position - p2).Magnitude else nil
end

return {
	getComparator = function(p3) --[[ line: 19 ]]
		return function(p4, p5) --[[ line: 20 ]]
			-- upvalues: p3 (ref)
			local primaryPart = p4 and (p4.Character and p4.Character.PrimaryPart)
			local primaryPart_1 = p5 and (p5.Character and p5.Character.PrimaryPart)
			
			if not primaryPart and not primaryPart_1 then
				return p4.Name:lower() < p5.Name:lower()
			elseif primaryPart and not primaryPart_1 then
				return true
			elseif primaryPart or not primaryPart_1 then
				local primaryPart_2 = p4 and (p4.Character and p4.Character.PrimaryPart)
				local primaryPart_3 = p5 and (p5.Character and p5.Character.PrimaryPart)
				
				return (if primaryPart_2 then (primaryPart_2.Position - p3).Magnitude else nil) < (if primaryPart_3 then (primaryPart_3.Position - p3).Magnitude else nil)
			end
			return false
		end
	end,
	getSortedPlayers = function(p6, p7, p8, p9, p10, p11, p12) --[[ line: 41 ]]
		local t = {}
		
		local var6 = function(p13, p14) --[[ line: 20 ]]
			-- upvalues: p8 (ref)
			local primaryPart = p13 and (p13.Character and p13.Character.PrimaryPart)
			local primaryPart_1 = p14 and (p14.Character and p14.Character.PrimaryPart)
			
			if not primaryPart and not primaryPart_1 then
				return p13.Name:lower() < p14.Name:lower()
			elseif primaryPart and not primaryPart_1 then
				return true
			elseif primaryPart or not primaryPart_1 then
				local primaryPart_2 = p13 and (p13.Character and p13.Character.PrimaryPart)
				local primaryPart_3 = p14 and (p14.Character and p14.Character.PrimaryPart)
				
				return (if primaryPart_2 then (primaryPart_2.Position - p8).Magnitude else nil) < (if primaryPart_3 then (primaryPart_3.Position - p8).Magnitude else nil)
			end
			return false
		end
		
		for i, v in pairs(p7.participants) do
			local var7 = p6:GetPlayerByUserId(i)
			
			if var7 and p11 ~= var7 and (p12 or var7 and (var7.Character and var7.Character.PrimaryPart)) then
				if p9 and var7 then
					local primaryPart = var7 and (var7.Character and var7.Character.PrimaryPart)
					
					if p9 >= (if primaryPart then (primaryPart.Position - p8).Magnitude else nil) then
						if not p10 or p7:getRecentUsersInteractionData()[tostring(var7.UserId)] then
							table.insert(t, var7)
						end
					end
				end
			end
		end
		table.sort(t, var6)
		
		return t
	end
}