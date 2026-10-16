local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local ComputeNameColorFunction = nil

if require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs() then
	ComputeNameColorFunction = require(Parent.ChatUIPrimitives).Utils.computeNameColor
else
	local list = {
		Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157),
		Color3.new(0.00392156862745098, 0.6352941176470588, 1),
		Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353),
		BrickColor.new("Alder").Color, BrickColor.new("Bright orange").Color,
		BrickColor.new("Bright yellow").Color,
		BrickColor.new("Light reddish violet").Color,
		BrickColor.new("Brick yellow").Color
	}
	
	local function GetNameValue(Text: string): number --[[ Line: 24 ]]
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
	
	ComputeNameColorFunction = function(Name) --[[ Line: 42 ]]
		-- upvalues: list (copy), GetNameValue (copy)
		return list[(GetNameValue(Name) + 0) % #list + 1]
	end
end
return function(UserId) --[[ Line: 47 | Named "GetNameColor" ]]
	-- upvalues: Players (copy), ComputeNameColorFunction (ref)
	local Player = Players:GetPlayerByUserId(UserId)
	
	return if Player then if Player.Team == nil then ComputeNameColorFunction(Player.Name) else Player.TeamColor.Color else Color3.fromRGB(255, 255, 255)
end