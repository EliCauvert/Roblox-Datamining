local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local _ = game:GetService("RunService")
local tModule = require(corePackagesService.Packages.t)
local var3 = tModule.strictInterface({
	eraseTimeout = tModule.number,
	testHarness = tModule.optional(tModule.strictInterface({
		players = tModule.union(tModule.instanceOf("Players"), tModule.interface({
			GetPlayers = tModule.callback,
			GetPlayerByUserId = tModule.callback,
			PlayerAdded = tModule.RBXScriptSignal,
			PlayerRemoving = tModule.RBXScriptSignal
		})),
		wait = tModule.callback
	}))
})
local t = {}
t.__index = t

function t.new(p0) --[[ line: 50 ]]
	-- upvalues: var3 (ref), playersService (ref), t (ref)
	assert(var3(p0))
	
	return setmetatable({
		_playerCounter = 1,
		_eraseTimeout = p0.eraseTimeout,
		_trackedPii = {},
		_disambiguationIdentifiers = {},
		_waitFn = if p0.testHarness == nil then wait else p0.testHarness.wait,
		_players = if p0.testHarness == nil then playersService else p0.testHarness.players
	}, t)
end

function t:_addPlayerToEraseMap(p1) --[[ line: 75 ]]
	local userId = self._disambiguationIdentifiers[p1.UserId]
	
	if userId == nil then
		userId = self._playerCounter
		self._disambiguationIdentifiers[p1.UserId] = self._playerCounter
		self._playerCounter += 1
	end
	self._trackedPii[tostring(p1.UserId)] = string.format("UserId(%d)", userId)
	self._trackedPii[tostring(p1.Name)] = string.format("UserName(%d)", userId)
	self._trackedPii[tostring(p1.DisplayName)] = string.format("DisplayName(%d)", userId)
end

function t:_removePlayerFromEraseMap(p2) --[[ line: 88 ]]
	self._trackedPii[tostring(p2.UserId)] = nil
	self._trackedPii[tostring(p2.Name)] = nil
	self._trackedPii[tostring(p2.DisplayName)] = nil
end

function t:startTracking() --[[ line: 94 ]]
	for i, v in ipairs(self._players:GetPlayers()) do
		self:_addPlayerToEraseMap(v)
	end
	self._playerAddedConnection = self._players.PlayerAdded:Connect(function(p3) --[[ line: 99 ]]
		-- upvalues: self (ref)
		self:_addPlayerToEraseMap(p3)
	end)
	self._playerRemovingConnection = self._players.PlayerRemoving:Connect(function(p4) --[[ line: 103 ]]
		-- upvalues: self (ref)
		self._waitFn(self._eraseTimeout)
		
		if self._players:GetPlayerByUserId(p4.UserId) == nil then
			self:_removePlayerFromEraseMap(p4)
		end
	end)
end

function t:stopTracking() --[[ line: 116 ]]
	self._playerAddedConnection:Disconnect()
	self._playerRemovingConnection:Disconnect()
end

function t:cleanPii(p5) --[[ line: 121 ]]
	for i, v in pairs(self._trackedPii) do
		p5 = string.gsub(p5, i, v)
	end
	return p5
end

return t