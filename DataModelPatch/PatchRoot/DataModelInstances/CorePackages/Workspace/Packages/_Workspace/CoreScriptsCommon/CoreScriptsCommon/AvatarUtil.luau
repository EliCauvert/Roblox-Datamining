local Players = game:GetService("Players")
local FixAvatarUtilCharacter = game:DefineFastFlag("FixAvatarUtilCharacter", false)
local Module = {}
Module.__index = Module

function Module.new(Player: Player)
	-- upvalues: Module (copy), FixAvatarUtilCharacter (copy)
	local self = setmetatable({}, Module)
	self.player = Player
	self.characterChangedEvent = Instance.new("BindableEvent")
	self.eventQueued = false
	self.connections = {}
	self.connections.characterAddedConnection = Player.CharacterAdded:Connect(function(Character)
		-- upvalues: self (copy)
		self:onCharacterChanged(Character)
	end)
	self.connections.characterAppearanceChangedConnection = Player.CharacterAppearanceLoaded:Connect(function(Character)
		-- upvalues: self (copy)
		self:onCharacterChanged(Character)
	end)
	
	if FixAvatarUtilCharacter and self.player.Character then
		self:onCharacterChanged(self.player.Character)
	end
	return self
end

function Module:removeConnection(p1)
	if self.connections[p1] then
		self.connections[p1]:Disconnect()
		self.connections[p1] = nil
	end
end

function Module:onCharacterChanged(Character)
	self:removeConnection("descendantAddedConnection")
	self.connections.descendantAddedConnection = Character.DescendantAdded:Connect(function(Descendant)
		-- upvalues: self (copy)
		self:onDescendantAdded(Descendant)
	end)
	self:removeConnection("descendantRemovedConnection")
	self.connections.descendantRemovedConnection = Character.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: self (copy)
		self:onDescendantRemoving(Descendant)
	end)
	
	for _, descendant in pairs(Character:GetDescendants()) do
		self:onDescendantAdded(descendant)
	end
	self:fireCharacterChanged()
end

function Module:onDescendantAdded(NumberValue)
	if NumberValue:IsA("NumberValue") then
		local Text = NumberValue.Name .. "Connection"
		self:removeConnection(Text)
		self.connections[Text] = NumberValue.Changed:Connect(function()
			-- upvalues: self (copy)
			self:fireCharacterChanged()
		end)
	end
	self:fireCharacterChanged()
end

function Module:onDescendantRemoving(NumberValue)
	if NumberValue:IsA("NumberValue") then
		self:removeConnection(NumberValue.Name .. "Connection")
	end
	self:fireCharacterChanged()
end

function Module:fireCharacterChanged()
	if not self.eventQueued then
		self.eventQueued = true
		task.delay(0.1, function()
			-- upvalues: self (copy)
			self.eventQueued = false
			local Character = self.player.Character
			
			if Character then
				self.characterChangedEvent:Fire(Character)
			end
		end)
		
		return
	end
end

local AvatarUtil = {}
AvatarUtil.__index = AvatarUtil

function AvatarUtil.new()
	-- upvalues: AvatarUtil (copy)
	local self = setmetatable({}, AvatarUtil)
	self.playerConnections = {}
	
	return self
end

function AvatarUtil:connectLocalCharacterChanges(Callback)
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	while not LocalPlayer do
		Players.Changed:Wait()
		LocalPlayer = Players.LocalPlayer
	end
	self:connectPlayerCharacterChanges(LocalPlayer, Callback)
end

function AvatarUtil:connectPlayerCharacterChanges(LocalPlayer, Callback)
	-- upvalues: Module (copy)
	if not self.playerConnections[LocalPlayer] then
		self.playerConnections[LocalPlayer] = Module.new(LocalPlayer)
	end
	self.playerConnections[LocalPlayer].characterChangedEvent.Event:Connect(Callback)
	self.playerConnections[LocalPlayer]:fireCharacterChanged()
end

return AvatarUtil