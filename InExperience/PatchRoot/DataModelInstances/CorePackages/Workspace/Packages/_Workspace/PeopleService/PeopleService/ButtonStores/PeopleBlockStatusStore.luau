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
	local var8 = nil
	
	local function getPlayerBlockStatus(p0)
		-- upvalues: signalsModule (copy), t (write), blockingUtilityModule (copy)
		if not p0 then
			return signalsModule.createSignal(false)
		elseif t[p0] then
			return t[p0].getter
		end
		local var14, var15 = signalsModule.createSignal(blockingUtilityModule:IsPlayerBlockedByUserId(p0))
		t[p0] = { getter = var14, setter = var15 }
		
		return var14
	end
	
	local function onBlockStatusChanged(p1, p2)
		-- upvalues: t (write)
		if t[p1] then
			t[p1].setter(p2)
		end
	end
	
	local function blockPlayer(p3, p4)
		-- upvalues: t (write), peopleBlockingModalManagerModule (copy), getFFlagAddPeoplePageCardLayout (copy), constantsModule (copy)
		local var16 = peopleBlockingModalManagerModule.openModal(p3, if getFFlagAddPeoplePageCardLayout() then p4 else constantsModule.ANALYTICS.IN_GAME_MENU_NAME, {
			onBlockingSuccess = function()
				-- upvalues: t (copy), p3 (ref)
				if t[p3.UserId] then
					t[p3.UserId].setter(true)
				end
			end
		})
		
		if var16 then
			var16:catch(function(p5)
				warn("Block modal promise error:", p5)
			end)
		end
	end
	
	local function unblockPlayer(p6, p7)
		-- upvalues: blockingUtilityModule (copy), playersService (copy), peopleAnalyticsManagerModule (copy), getFFlagAddPeoplePageCardLayout (copy), t (write)
		if not p6 then return end
		if blockingUtilityModule:UnblockPlayerAsync(p6) then
			local localPlayer = playersService.LocalPlayer
			
			if localPlayer then
				peopleAnalyticsManagerModule:trackUnblockUser(p6.UserId, localPlayer.UserId, if getFFlagAddPeoplePageCardLayout() then p7 else nil)
			end
			if t[p6.UserId] then
				t[p6.UserId].setter(false)
			end
		end
	end
	
	local function _()
		-- upvalues: blockingUtilityModule (copy), var8 (write), onBlockStatusChanged (ref)
		var8 = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	end
	
	local function cleanup()
		-- upvalues: var8 (write), t (write)
		if var8 then
			var8:Disconnect()
			var8 = nil
		end
		t = {}
	end
	
	var8 = blockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	
	return {
		getPlayerBlockStatus = getPlayerBlockStatus,
		unblockPlayer = unblockPlayer,
		blockPlayer = blockPlayer,
		cleanup = cleanup
	}
end)()