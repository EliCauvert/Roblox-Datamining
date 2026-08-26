local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local entryStorageModule = require(script.Parent.EntryStorage)
local _ = require(whatsNew.Types)
local playersService = game:GetService("Players")

local function _()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then 1e999 else localPlayer.AccountAge
end

return {
	createResolveDeps = function(p1)
		-- upvalues: playersService (ref), entryStorageModule (ref), constantsModule (ref)
		p1 = p1 or {}
		local accountAgeDays = p1.accountAgeDays
		
		if not accountAgeDays then
			local localPlayer = playersService.LocalPlayer
			accountAgeDays = if localPlayer == nil then 1e999 else localPlayer.AccountAge
		end
		return {
			storage = entryStorageModule.getEntries(),
			onboardingEligible = accountAgeDays < constantsModule.OnboardingAccountAge,
			currentTime = p1.currentTime or DateTime.now().UnixTimestamp
		}
	end
}