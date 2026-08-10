local whatsNew = script:FindFirstAncestor("WhatsNew")
local constantsModule = require(whatsNew.Constants)
local entryStorageModule = require(script.Parent.EntryStorage)
local _ = require(whatsNew.Types)
local playersService = game:GetService("Players")

local function _() --[[ line: 18 | named "getAccountAgeDays" ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer == nil then 1e999 else localPlayer.AccountAge
end

return {
	createResolveDeps = function(p0) --[[ line: 26 ]]
		-- upvalues: playersService (ref), entryStorageModule (ref), constantsModule (ref)
		p0 = p0 or {}
		local accountAgeDays = p0.accountAgeDays
		
		if not accountAgeDays then
			local localPlayer = playersService.LocalPlayer
			accountAgeDays = if localPlayer == nil then 1e999 else localPlayer.AccountAge
		end
		return {
			storage = entryStorageModule.getEntries(),
			onboardingEligible = accountAgeDays < constantsModule.OnboardingAccountAge,
			currentTime = p0.currentTime or DateTime.now().UnixTimestamp
		}
	end
}