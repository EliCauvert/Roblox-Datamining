local Players = game:GetService("Players")
local ReactModule = require(game:GetService("CorePackages").Packages.React)

local function getLocalPlayerUserId()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId else 0
end

return function()
	-- upvalues: ReactModule (copy), getLocalPlayerUserId (copy), Players (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(getLocalPlayerUserId)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), Players (upval)
		local Connection = nil
		
		local function syncUserId()
			-- upvalues: UseStateResult2 (upval), Players (upval)
			local LocalPlayer = Players.LocalPlayer
			UseStateResult2(if LocalPlayer then LocalPlayer.UserId else 0)
		end
		
		local function _()
			-- upvalues: Connection (ref), Players (upval), syncUserId (copy)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(syncUserId)
			end
		end
		
		local Connection1 = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
			-- upvalues: Connection (ref), Players (upval), syncUserId (copy), UseStateResult2 (upval)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
			local LocalPlayer = Players.LocalPlayer
			
			if LocalPlayer then
				Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(syncUserId)
			end
			local LocalPlayer1 = Players.LocalPlayer
			UseStateResult2(if LocalPlayer1 then LocalPlayer1.UserId else 0)
		end)
		
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			Connection = LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(syncUserId)
		end
		local LocalPlayer1 = Players.LocalPlayer
		UseStateResult2(if LocalPlayer1 then LocalPlayer1.UserId else 0)
		
		return function()
			-- upvalues: Connection1 (copy), Connection (ref)
			Connection1:Disconnect()
			
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end