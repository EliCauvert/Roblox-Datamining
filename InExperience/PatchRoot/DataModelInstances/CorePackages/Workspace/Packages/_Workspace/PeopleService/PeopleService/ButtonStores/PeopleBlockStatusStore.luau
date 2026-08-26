local peopleService = script:FindFirstAncestor("PeopleService")
local parent = peopleService.Parent
local playersService = game:GetService("Players")
local signalsModule = require(parent.Signals)
local blockingUtilityModule = require(parent.BlockingUtility)
local constantsModule = require(peopleService.Constants)
local peopleBlockingModalManagerModule = require(peopleService.Integration.PeopleBlockingModalManager)
local peopleAnalyticsManagerModule = require(peopleService.Analytics.PeopleAnalyticsManager)
local getFFlagAddPeoplePageCardLayout = require(peopleService.Flags).GetFFlagAddPeoplePageCardLayout

return (function()
	-- upvalues: signalsModule (ref), blockingUtilityModule (ref), peopleBlockingModalManagerModule (ref), getFFlagAddPeoplePageCardLayout (ref), constantsModule (ref), playersService (ref), peopleAnalyticsManagerModule (ref)
	local t = {}
	local var1 = nil
	
	local function getPlayerBlockStatus(p1)
		-- upvalues: signalsModule (copy), t (write), blockingUtilityModule (copy)
		if not p1 then
			return signalsModule.createSignal(false)
		elseif t[p1] then
			return t[p1].getter
		end
		local var2, var3 = signalsModule.createSignal(blockingUtilityModule:IsPlayerBlockedByUserId(p1))
		t[p1] = { getter = var2, setter = var3 }
		
		return var2
	end
	
	local function onBlockStatusChanged(p1, p2)
		-- upvalues: t (write)
		if t[p1] then
			t[p1].setter(p2)
		end
	end
	
	local function blockPlayer(p1, p2)
		-- upvalues: t (write), peopleBlockingModalManagerModule (copy), getFFlagAddPeoplePageCardLayout (copy), constantsModule (copy)
		local var2 = peopleBlockingModalManagerModule.openModal(p1, if getFFlagAddPeoplePageCardLayout() then p2 else constantsModule.ANALYTICS.IN_GAME_MENU_NAME, {
			onBlockingSuccess = function()
				-- upvalues: t (copy), p1 (ref)
				if t[p1.UserId] then
					t[p1.UserId].setter(true)
				end
			end
		})
		
		if var2 then
			var2:catch(function(p3)
				warn("Block modal promise error:", p3)
			end)
		end
	end
	
	local function unblockPlayer(p1, p2)
		-- upvalues: blockingUtilityModule (copy), playersService (copy), peopleAnalyticsManagerModule (copy), getFFlagAddPeoplePageCardLayout (copy), t (write)
		if not p1 then return end
		if blockingUtilityModule:UnblockPlayerAsync(p1) then
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer then
				peopleAnalyticsManagerModule:trackUnblockUser(p1.UserId, localPlayer.UserId, if getFFlagAddPeoplePageCardLayout() then p2 else nil)
			end
			if t[p1.UserId] then
				t[p1.UserId].setter(false)
			end
		end
	end
	
	local function _()
		-- upvalues: blockingUtilityModule (copy), var1 (write), onBlockStatusChanged (ref)
		var1 = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	end
	
	local function cleanup()
		-- upvalues: var1 (write), t (write)
		if var1 then
			var1:Disconnect()
			var1 = nil
		end
		t = {}
	end
	
	var1 = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	
	return {
		getPlayerBlockStatus = getPlayerBlockStatus,
		unblockPlayer = unblockPlayer,
		blockPlayer = blockPlayer,
		cleanup = cleanup
	}
end)()