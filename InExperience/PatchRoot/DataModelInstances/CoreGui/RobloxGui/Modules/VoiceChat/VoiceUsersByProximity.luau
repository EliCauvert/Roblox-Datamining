local _ = require(script.Parent.VoiceChatServiceManager)

local function _(p1)
	return p1 and (p1.Character and p1.Character.PrimaryPart)
end

local _ = function(p1, p2)
	local primaryPart = p1 and (p1.Character and p1.Character.PrimaryPart)
	
	return if primaryPart then (primaryPart.Position - p2).Magnitude else nil
end

return {
	getComparator = function(p1)
		return function(p2, p3)
			-- upvalues: p1 (ref)
			local primaryPart = p2 and (p2.Character and p2.Character.PrimaryPart)
			local primaryPart_1 = p3 and (p3.Character and p3.Character.PrimaryPart)
			
			if not primaryPart and not primaryPart_1 then
				return p2.Name:lower() < p3.Name:lower()
			elseif primaryPart and not primaryPart_1 then
				return true
			elseif primaryPart or not primaryPart_1 then
				local primaryPart_2 = p2 and (p2.Character and p2.Character.PrimaryPart)
				local primaryPart_3 = p3 and (p3.Character and p3.Character.PrimaryPart)
				
				return (if primaryPart_2 then (primaryPart_2.Position - p1).Magnitude else nil) < (if primaryPart_3 then (primaryPart_3.Position - p1).Magnitude else nil)
			end
			return false
		end
	end,
	getSortedPlayers = function(p1, p2, p3, p4, p5, p6, p7)
		local t = {}
		
		local var1 = function(p8, p9)
			-- upvalues: p3 (ref)
			local primaryPart = p8 and (p8.Character and p8.Character.PrimaryPart)
			local primaryPart_1 = p9 and (p9.Character and p9.Character.PrimaryPart)
			
			if not primaryPart and not primaryPart_1 then
				return p8.Name:lower() < p9.Name:lower()
			elseif primaryPart and not primaryPart_1 then
				return true
			elseif primaryPart or not primaryPart_1 then
				local primaryPart_2 = p8 and (p8.Character and p8.Character.PrimaryPart)
				local primaryPart_3 = p9 and (p9.Character and p9.Character.PrimaryPart)
				
				return (if primaryPart_2 then (primaryPart_2.Position - p3).Magnitude else nil) < (if primaryPart_3 then (primaryPart_3.Position - p3).Magnitude else nil)
			end
			return false
		end
		
		for i, v in pairs(p2.participants) do
			local var2 = p1:GetPlayerByUserId(i)
			
			if var2 and p6 ~= var2 and (p7 or var2 and (var2.Character and var2.Character.PrimaryPart)) then
				if p4 and var2 then
					local primaryPart = var2 and (var2.Character and var2.Character.PrimaryPart)
					
					if p4 >= (if primaryPart then (primaryPart.Position - p3).Magnitude else nil) then
						if not p5 or p2:getRecentUsersInteractionData()[tostring(var2.UserId)] then
							table.insert(t, var2)
						end
					end
				end
			end
		end
		table.sort(t, var1)
		
		return t
	end
}