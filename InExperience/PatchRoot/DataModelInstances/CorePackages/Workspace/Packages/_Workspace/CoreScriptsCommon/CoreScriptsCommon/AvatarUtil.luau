local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref)
	local tbl = setmetatable({}, t)
	tbl.player = p1
	tbl.characterChangedEvent = Instance.new("BindableEvent")
	tbl.eventQueued = false
	tbl.connections = {}
	tbl.connections.characterAddedConnection = p1.CharacterAdded:Connect(function(p2)
		-- upvalues: tbl (ref)
		tbl:onCharacterChanged(p2)
	end)
	tbl.connections.characterAppearanceChangedConnection = p1.CharacterAppearanceLoaded:Connect(function(p2)
		-- upvalues: tbl (ref)
		tbl:onCharacterChanged(p2)
	end)
	
	if tbl.player.Character then
		tbl:onCharacterChanged(tbl.player.Character)
	end
	return tbl
end

function t:removeConnection(p1)
	if self.connections[p1] then
		self.connections[p1]:Disconnect()
		self.connections[p1] = nil
	end
end

function t:onCharacterChanged(p1)
	self:removeConnection("descendantAddedConnection")
	self.connections.descendantAddedConnection = p1.DescendantAdded:Connect(function(p2)
		-- upvalues: self (ref)
		self:onDescendantAdded(p2)
	end)
	self:removeConnection("descendantRemovedConnection")
	self.connections.descendantRemovedConnection = p1.DescendantRemoving:Connect(function(p2)
		-- upvalues: self (ref)
		self:onDescendantRemoving(p2)
	end)
	
	for i, v in pairs(p1:GetDescendants()) do
		self:onDescendantAdded(v)
	end
	self:fireCharacterChanged()
end

function t:onDescendantAdded(p2)
	if p2:IsA("NumberValue") then
		local text = p2.Name .. "Connection"
		self:removeConnection(text)
		self.connections[text] = p2.Changed:Connect(function()
			-- upvalues: self (ref)
			self:fireCharacterChanged()
		end)
	end
	self:fireCharacterChanged()
end

function t:onDescendantRemoving(p2)
	if p2:IsA("NumberValue") then
		self:removeConnection(p2.Name .. "Connection")
	end
	self:fireCharacterChanged()
end

function t:fireCharacterChanged()
	if self.eventQueued then
		return
	end
	self.eventQueued = true
	task.delay(0.1, function()
		-- upvalues: self (ref)
		self.eventQueued = false
		local character = self.player.Character
		
		if character then
			self.characterChangedEvent:Fire(character)
		end
	end)
end

local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.playerConnections = {}
	
	return tbl
end

function t_1:connectLocalCharacterChanges(p2)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService.Changed:Wait()
		localPlayer = playersService.LocalPlayer
	end
	self:connectPlayerCharacterChanges(localPlayer, p2)
end

function t_1:connectPlayerCharacterChanges(p3, p4)
	-- upvalues: t (ref)
	if not self.playerConnections[p3] then
		self.playerConnections[p3] = t.new(p3)
	end
	self.playerConnections[p3].characterChangedEvent.Event:Connect(p4)
	self.playerConnections[p3]:fireCharacterChanged()
end

return t_1