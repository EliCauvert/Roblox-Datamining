local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("GameDetail").Parent
local FFlagLuaAppDismissUnlockUpsell = require(Parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local Signal, Signal2 = require(Parent.Signals).createSignal(false)

local function getIsAgeCheckUpsellDismissed(p1)
	-- upvalues: Signal (copy)
	return Signal(p1)
end

local function setAgeCheckUpsellDismissed()
	-- upvalues: Signal2 (copy)
	Signal2(true)
end

local function _()
	-- upvalues: Players (copy)
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	
	return if UserId == nil or UserId <= 0 then nil else UserId
end

if FFlagLuaAppDismissUnlockUpsell then
	local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
	local UserId1 = if UserId == nil or UserId <= 0 then nil else UserId
	Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: Players (copy), UserId1 (ref), Signal2 (copy)
		local UserId = Players.LocalPlayer and Players.LocalPlayer.UserId or nil
		local UserId2 = if UserId == nil or UserId <= 0 then nil else UserId
		
		if UserId2 ~= UserId1 then
			UserId1 = UserId2
			Signal2(false)
		end
	end)
end
return {
	getIsAgeCheckUpsellDismissed = getIsAgeCheckUpsellDismissed,
	setAgeCheckUpsellDismissed = setAgeCheckUpsellDismissed
}