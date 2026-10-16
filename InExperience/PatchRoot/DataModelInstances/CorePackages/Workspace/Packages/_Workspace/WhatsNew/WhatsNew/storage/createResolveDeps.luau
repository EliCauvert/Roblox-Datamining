local WhatsNew = script:FindFirstAncestor("WhatsNew")
local ConstantsModule = require(WhatsNew.Constants)
local EntryStorageModule = require(script.Parent.EntryStorage)
local _ = require(WhatsNew.Types)
local Players = game:GetService("Players")

local function _() --[[ Line: 18 | Named "getAccountAgeDays" ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then 1e999 else LocalPlayer.AccountAge
end

return {
	createResolveDeps = function(p1) --[[ Line: 26 ]]
		-- upvalues: Players (copy), EntryStorageModule (copy), ConstantsModule (copy)
		local P0 = p1 or {}
		local AccountAgeDays = P0.accountAgeDays
		
		if not AccountAgeDays then
			local LocalPlayer = Players.LocalPlayer
			AccountAgeDays = if LocalPlayer == nil then 1e999 else LocalPlayer.AccountAge
		end
		return {
			storage = EntryStorageModule.getEntries(),
			onboardingEligible = AccountAgeDays < ConstantsModule.OnboardingAccountAge,
			currentTime = P0.currentTime or DateTime.now().UnixTimestamp
		}
	end
}