local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("GameDetail").Parent
local fFlagLuaAppDismissUnlockUpsell = require(parent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local var1, var2 = require(parent.Signals).createSignal(false)

local function getIsAgeCheckUpsellDismissed(p0)
	-- upvalues: var1 (ref)
	return var1(p0)
end

local function setAgeCheckUpsellDismissed()
	-- upvalues: var2 (ref)
	var2(true)
end

local function _()
	-- upvalues: playersService (ref)
	local var7 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	
	return if var7 == nil or var7 <= 0 then nil else var7
end

if fFlagLuaAppDismissUnlockUpsell then
	local var5 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
	local var6 = if var5 == nil or var5 <= 0 then nil else var5
	playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: playersService (ref), var6 (write), var2 (ref)
		local var8 = if playersService.LocalPlayer then playersService.LocalPlayer.UserId else nil
		local var9 = if var8 == nil or var8 <= 0 then nil else var8
		
		if var9 ~= var6 then
			var6 = var9
			var2(false)
		end
	end)
end
return {
	getIsAgeCheckUpsellDismissed = getIsAgeCheckUpsellDismissed,
	setAgeCheckUpsellDismissed = setAgeCheckUpsellDismissed
}