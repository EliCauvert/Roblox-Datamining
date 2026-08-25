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
	
	local function GetNameValue(p0)
		local var3 = 0
		
		for i = 1, #p0 do
			local byteValue = string.byte(string.sub(p0, i, i))
			local var5 = #p0 - i + 1
			
			if #p0 % 2 == 1 then
				var5 -= 1
			end
			if var5 % 4 >= 2 then
				byteValue = -byteValue
			end
			var3 += byteValue
		end
		return var3
	end
	
	local computeNameColor = function(p1)
		-- upvalues: list (ref), GetNameValue (ref)
		return list[(GetNameValue(p1) + 0) % #list + 1]
	end
end
return function(p2)
	-- upvalues: playersService (ref), computeNameColor (write)
	local var6 = playersService:GetPlayerByUserId(p2)
	
	return if var6 then if var6.Team == nil then computeNameColor(var6.Name) else var6.TeamColor.Color else Color3.fromRGB(255, 255, 255)
end