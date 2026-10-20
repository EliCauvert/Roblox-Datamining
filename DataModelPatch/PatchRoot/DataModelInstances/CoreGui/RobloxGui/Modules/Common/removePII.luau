local Players = game:GetService("Players")
local StringReplaceAllModule = require(script.Parent.StringUtilities.StringReplaceAll)

local function defaultListOfPIIs()
	-- upvalues: Players (copy)
	local t = {}
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer ~= nil then
		if LocalPlayer.UserId and LocalPlayer.UserId > 0 then
			t[tostring(LocalPlayer.UserId)] = "UserId"
		end
		if LocalPlayer.Name and LocalPlayer.Name ~= "" then
			t[tostring(LocalPlayer.Name)] = "UserName"
		end
	end
	return t
end

local function removePlayerPersonalData(List, List1)
	-- upvalues: defaultListOfPIIs (copy), removePlayerPersonalData (copy), StringReplaceAllModule (copy)
	if not List1 then
		List1 = defaultListOfPIIs()
	end
	if type(List) == "table" then
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = removePlayerPersonalData(value, List1)
		end
		return t
	else
		if type(List) == "string" then
			return StringReplaceAllModule(List, List1)
		end
		for i1, value1 in pairs(List1) do
			if tostring(List) == i1 then
				return value1
			end
		end
		return List
	end
end

return removePlayerPersonalData