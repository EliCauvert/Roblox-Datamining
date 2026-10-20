local PeopleService = script:FindFirstAncestor("PeopleService")
local Parent = PeopleService.Parent
local Players = game:GetService("Players")
local SignalsModule = require(Parent.Signals)
local BlockingUtilityModule = require(Parent.BlockingUtility)
local ConstantsModule = require(PeopleService.Constants)
local PeopleBlockingModalManagerModule = require(PeopleService.Integration.PeopleBlockingModalManager)
local PeopleAnalyticsManagerModule = require(PeopleService.Analytics.PeopleAnalyticsManager)
local GetFFlagAddPeoplePageCardLayoutFunction = require(PeopleService.Flags).GetFFlagAddPeoplePageCardLayout

return ((function()
	-- upvalues: SignalsModule (copy), BlockingUtilityModule (copy), PeopleBlockingModalManagerModule (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), ConstantsModule (copy), Players (copy), PeopleAnalyticsManagerModule (copy)
	local t = {}
	local Connection = nil
	
	local function onBlockStatusChanged(p1, p2)
		-- upvalues: t (ref)
		if t[p1] then
			t[p1].setter(p2)
		end
	end
	
	local function _()
		-- upvalues: BlockingUtilityModule (upval), Connection (ref), onBlockStatusChanged (copy)
		Connection = BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	end
	
	local function cleanup()
		-- upvalues: Connection (ref), t (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		t = {}
	end
	
	Connection = BlockingUtilityModule:GetBlockedStatusChangedEvent():Connect(onBlockStatusChanged)
	
	return {
		getPlayerBlockStatus = function(Key)
			-- upvalues: SignalsModule (upval), t (ref), BlockingUtilityModule (upval)
			if not Key then
				return SignalsModule.createSignal(false)
			elseif t[Key] then
				return t[Key].getter
			else
				local Signal, Signal2 = SignalsModule.createSignal((BlockingUtilityModule:IsPlayerBlockedByUserId(Key)))
				t[Key] = { getter = Signal, setter = Signal2 }
				
				return Signal
			end
		end,
		unblockPlayer = function(Player: Player, p1)
			-- upvalues: BlockingUtilityModule (upval), Players (upval), PeopleAnalyticsManagerModule (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), t (ref)
			if not Player then return end
			if BlockingUtilityModule:UnblockPlayerAsync(Player) then
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer then
					PeopleAnalyticsManagerModule:trackUnblockUser(Player.UserId, LocalPlayer.UserId, if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else nil)
				end
				if t[Player.UserId] then
					t[Player.UserId].setter(false)
				end
			end
		end,
		blockPlayer = function(Player: Player, p1)
			-- upvalues: t (ref), PeopleBlockingModalManagerModule (upval), GetFFlagAddPeoplePageCardLayoutFunction (upval), ConstantsModule (upval)
			local OpenModalResult = PeopleBlockingModalManagerModule.openModal(Player, if GetFFlagAddPeoplePageCardLayoutFunction() then p1 else ConstantsModule.ANALYTICS.IN_GAME_MENU_NAME, {
				onBlockingSuccess = function()
					-- upvalues: t (upval), Player (copy)
					if t[Player.UserId] then
						t[Player.UserId].setter(true)
					end
				end
			})
			
			if OpenModalResult then
				OpenModalResult:catch(function(Err)
					warn("Block modal promise error:", Err)
				end)
			end
		end,
		cleanup = cleanup
	}
end)())