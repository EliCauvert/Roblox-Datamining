local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("GameDetail").Parent
local fFlagLuaAppDismissUnlockUpsell = require(parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local var1, var2 = require(parent.Signals).createSignal(false)

local function getIsAgeCheckUpsellDismissed(p1)
	-- upvalues: var1 (ref)
	return var1(p1)
end

local function setAgeCheckUpsellDismissed()
	-- upvalues: var2 (ref)
	var2(true)
end

local function _()
	-- upvalues: playersService (ref)
	local var3 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var3 == nil or var3 <= 0 then nil else var3
end

if fFlagLuaAppDismissUnlockUpsell then
	local var3 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	local var4 = if var3 == nil or var3 <= 0 then nil else var3
	playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: playersService (ref), var4 (write), var2 (ref)
		local var5 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
		local var6 = if var5 == nil or var5 <= 0 then nil else var5
		
		if var6 ~= var4 then
			var4 = var6
			var2(false)
		end
	end)
end
return {
	getIsAgeCheckUpsellDismissed = getIsAgeCheckUpsellDismissed,
	setAgeCheckUpsellDismissed = setAgeCheckUpsellDismissed
}