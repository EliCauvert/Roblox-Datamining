local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local _ = game:GetService("RunService")
local tModule = require(corePackagesService.Packages.t)
local var1 = tModule.strictInterface({
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

function t.new(p1)
	-- upvalues: var1 (ref), playersService (ref), t (ref)
	assert(var1(p1))
	
	return setmetatable({
		_playerCounter = 1,
		_eraseTimeout = p1.eraseTimeout,
		_trackedPii = {},
		_disambiguationIdentifiers = {},
		_waitFn = if p1.testHarness == nil then wait else p1.testHarness.wait,
		_players = if p1.testHarness == nil then playersService else p1.testHarness.players
	}, t)
end

function t:_addPlayerToEraseMap(p1)
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

function t:_removePlayerFromEraseMap(p1)
	self._trackedPii[tostring(p1.UserId)] = nil
	self._trackedPii[tostring(p1.Name)] = nil
	self._trackedPii[tostring(p1.DisplayName)] = nil
end

function t:startTracking()
	for i, v in ipairs(self._players:GetPlayers()) do
		self:_addPlayerToEraseMap(v)
	end
	self._playerAddedConnection = self._players.PlayerAdded:Connect(function(p1)
		-- upvalues: self (ref)
		self:_addPlayerToEraseMap(p1)
	end)
	self._playerRemovingConnection = self._players.PlayerRemoving:Connect(function(p1)
		-- upvalues: self (ref)
		self._waitFn(self._eraseTimeout)
		
		if self._players:GetPlayerByUserId(p1.UserId) == nil then
			self:_removePlayerFromEraseMap(p1)
		end
	end)
end

function t:stopTracking()
	self._playerAddedConnection:Disconnect()
	self._playerRemovingConnection:Disconnect()
end

function t:cleanPii(p1)
	for i, v in pairs(self._trackedPii) do
		p1 = string.gsub(p1, i, v)
	end
	return p1
end

return t