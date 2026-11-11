local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PromiseModule = require(Parent.Promise)
local AccessoryType = require(Parent.Foundation).Enums.AccessoryType

return function()
	-- upvalues: PromiseModule (copy), Players (copy), LocalPlayer (copy), AccessoryType (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
		-- upvalues: Players (upval), LocalPlayer (upval), AccessoryType (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), LocalPlayer (upval), AccessoryType (upval)
			local Players1 = Players:GetPlayers()
			table.sort(Players1, function(A, B): boolean
				return A.Name:lower() < B.Name:lower()
			end)
			local List = {}
			
			for _, Player in ipairs(Players1) do
				if not LocalPlayer or Player.UserId ~= LocalPlayer.UserId then
					table.insert(List, {
						leading = { type = AccessoryType.Avatar, userId = Player.UserId },
						id = tostring(Player.UserId),
						label = Player.DisplayName,
						description = Player.Name,
						meta = { username = Player.Name, displayName = Player.DisplayName }
					})
				end
			end
			return List
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1(Result)
		end
	end)
end