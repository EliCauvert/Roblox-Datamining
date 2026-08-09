local playersService = game:GetService("Players")
local fixAvatarUtilCharacter = game:DefineFastFlag("FixAvatarUtilCharacter", false)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 19 ]]
	-- upvalues: t (ref), fixAvatarUtilCharacter (ref)
	local tbl = setmetatable({}, t)
	tbl.player = p0
	tbl.characterChangedEvent = Instance.new("BindableEvent")
	tbl.eventQueued = false
	tbl.connections = {}
	tbl.connections.characterAddedConnection = p0.CharacterAdded:Connect(function(p1) --[[ line: 32 ]]
		-- upvalues: tbl (ref)
		tbl:onCharacterChanged(p1)
	end)
	tbl.connections.characterAppearanceChangedConnection = p0.CharacterAppearanceLoaded:Connect(function(p2) --[[ line: 37 ]]
		-- upvalues: tbl (ref)
		tbl:onCharacterChanged(p2)
	end)
	
	if fixAvatarUtilCharacter and tbl.player.Character then
		tbl:onCharacterChanged(tbl.player.Character)
	end
	return tbl
end

function t:removeConnection(p3) --[[ line: 51 ]]
	if self.connections[p3] then
		self.connections[p3]:Disconnect()
		self.connections[p3] = nil
	end
end

function t:onCharacterChanged(p4) --[[ line: 58 ]]
	self:removeConnection("descendantAddedConnection")
	self.connections.descendantAddedConnection = p4.DescendantAdded:Connect(function(p5) --[[ line: 61 ]]
		-- upvalues: self (ref)
		self:onDescendantAdded(p5)
	end)
	self:removeConnection("descendantRemovedConnection")
	self.connections.descendantRemovedConnection = p4.DescendantRemoving:Connect(function(p6) --[[ line: 66 ]]
		-- upvalues: self (ref)
		self:onDescendantRemoving(p6)
	end)
	
	for i, v in pairs(p4:GetDescendants()) do
		self:onDescendantAdded(v)
	end
	self:fireCharacterChanged()
end

function t:onDescendantAdded(p7) --[[ line: 79 ]]
	if p7:IsA("NumberValue") then
		local text = p7.Name .. "Connection"
		self:removeConnection(text)
		self.connections[text] = p7.Changed:Connect(function() --[[ line: 84 ]]
			-- upvalues: self (ref)
			self:fireCharacterChanged()
		end)
	end
	self:fireCharacterChanged()
end

function t:onDescendantRemoving(p8) --[[ line: 93 ]]
	if p8:IsA("NumberValue") then
		self:removeConnection(p8.Name .. "Connection")
	end
	self:fireCharacterChanged()
end

function t:fireCharacterChanged() --[[ line: 104 ]]
	if self.eventQueued then
		return
	end
	self.eventQueued = true
	task.delay(0.1, function() --[[ line: 111 ]]
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

function t_1.new() --[[ line: 126 ]]
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.playerConnections = {}
	
	return tbl
end

function t_1:connectLocalCharacterChanges(p9) --[[ line: 137 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	while not localPlayer do
		playersService.Changed:Wait()
		localPlayer = playersService.LocalPlayer
	end
	self:connectPlayerCharacterChanges(localPlayer, p9)
end

function t_1:connectPlayerCharacterChanges(p10, p11) --[[ line: 152 ]]
	-- upvalues: t (ref)
	if not self.playerConnections[p10] then
		self.playerConnections[p10] = t.new(p10)
	end
	self.playerConnections[p10].characterChangedEvent.Event:Connect(p11)
	self.playerConnections[p10]:fireCharacterChanged()
end

return t_1