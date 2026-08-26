local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ExpChat").Parent
local _ = nil

if require(parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs() then
	local computeNameColor = require(parent.ChatUIPrimitives).Utils.computeNameColor
else
	local list = {
		Color3.new(0.992156862745, 0.160784313725, 0.262745098039),
		Color3.new(0.003921568627, 0.635294117647, 1),
		Color3.new(0.007843137255, 0.721568627451, 0.341176470588),
		BrickColor.new("Alder").Color, BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	
	local function GetNameValue(p1)
		local var1 = 0
		
		for i = 1, #p1 do
			local byteValue = string.byte(string.sub(p1, i, i))
			local var2 = #p1 - i + 1
			
			if #p1 % 2 == 1 then
				var2 -= 1
			end
			if var2 % 4 >= 2 then
				byteValue = -byteValue
			end
			var1 += byteValue
		end
		return var1
	end
	
	local computeNameColor = function(p2)
		-- upvalues: list (ref), GetNameValue (ref)
		return list[(GetNameValue(p2) + 0) % #list + 1]
	end
end
return function(p1)
	-- upvalues: playersService (ref), computeNameColor (write)
	local var1 = playersService:GetPlayerByUserId(p1)
	
	return if var1 then if var1.Team == nil then computeNameColor(var1.Name) else var1.TeamColor.Color else Color3.fromRGB(255, 255, 255)
end