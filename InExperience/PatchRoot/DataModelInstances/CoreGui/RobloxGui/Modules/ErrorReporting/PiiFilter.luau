local Players = game:GetService("Players")
local _ = game:GetService("RunService")
local TModule = require(game:GetService("CorePackages").Packages.t)
local StrictInterfaceResult = TModule.strictInterface({
	eraseTimeout = TModule.number,
	testHarness = TModule.optional(TModule.strictInterface({
		players = TModule.union(TModule.instanceOf("Players"), TModule.interface({
			GetPlayers = TModule.callback,
			GetPlayerByUserId = TModule.callback,
			PlayerAdded = TModule.RBXScriptSignal,
			PlayerRemoving = TModule.RBXScriptSignal
		})),
		wait = TModule.callback
	}))
})
local PiiFilterModule = {}
PiiFilterModule.__index = PiiFilterModule

function PiiFilterModule.new(p1) --[[ Line: 50 ]]
	-- upvalues: StrictInterfaceResult (copy), Players (copy), PiiFilterModule (copy)
	assert(StrictInterfaceResult(p1))
	
	return (setmetatable({
		_playerCounter = 1,
		_eraseTimeout = p1.eraseTimeout,
		_trackedPii = {},
		_disambiguationIdentifiers = {},
		_waitFn = if p1.testHarness == nil then wait else p1.testHarness.wait,
		_players = if p1.testHarness == nil then Players else p1.testHarness.players
	}, PiiFilterModule))
end

function PiiFilterModule:_addPlayerToEraseMap(Player: Player) --[[ Line: 75 ]]
	local DisambiguationIdentifier = self._disambiguationIdentifiers[Player.UserId]
	
	if DisambiguationIdentifier == nil then
		DisambiguationIdentifier = self._playerCounter
		self._disambiguationIdentifiers[Player.UserId] = self._playerCounter
		self._playerCounter += 1
	end
	self._trackedPii[tostring(Player.UserId)] = string.format("UserId(%d)", DisambiguationIdentifier)
	self._trackedPii[tostring(Player.Name)] = string.format("UserName(%d)", DisambiguationIdentifier)
	self._trackedPii[tostring(Player.DisplayName)] = string.format("DisplayName(%d)", DisambiguationIdentifier)
end

function PiiFilterModule:_removePlayerFromEraseMap(Player: Player) --[[ Line: 88 ]]
	self._trackedPii[tostring(Player.UserId)] = nil
	self._trackedPii[tostring(Player.Name)] = nil
	self._trackedPii[tostring(Player.DisplayName)] = nil
end

function PiiFilterModule:startTracking() --[[ Line: 94 ]]
	for _, player in ipairs(self._players:GetPlayers()) do
		self:_addPlayerToEraseMap(player)
	end
	self._playerAddedConnection = self._players.PlayerAdded:Connect(function(Player) --[[ Line: 99 ]]
		-- upvalues: self (copy)
		self:_addPlayerToEraseMap(Player)
	end)
	self._playerRemovingConnection = self._players.PlayerRemoving:Connect(function(Player: Player) --[[ Line: 103 ]]
		-- upvalues: self (copy)
		self._waitFn(self._eraseTimeout)
		
		if self._players:GetPlayerByUserId(Player.UserId) == nil then
			self:_removePlayerFromEraseMap(Player)
		end
	end)
end

function PiiFilterModule:stopTracking() --[[ Line: 116 ]]
	self._playerAddedConnection:Disconnect()
	self._playerRemovingConnection:Disconnect()
end

function PiiFilterModule.cleanPii(p1, Text: string): string --[[ Line: 121 ]]
	for i, value in pairs(p1._trackedPii) do
		Text = string.gsub(Text, i, value)
	end
	return Text
end

return PiiFilterModule