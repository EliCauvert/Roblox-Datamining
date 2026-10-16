return function(Text: string): string --[[ Line: 4 | Named "getImageUri" ]]
	if Text == nil or Text == "" then
		return ""
	else
		local FoundAt: number? = string.find(Text, "http://www.roblox.com/asset/?id=", 1, true)
		
		return if FoundAt and FoundAt == 1 then `rbxthumb://type=Asset&id={string.sub(Text, 33)}&w=768&h=432` elseif tonumber(Text) then `rbxthumb://type=Asset&id={Text}&w=768&h=432` else Text
	end
end