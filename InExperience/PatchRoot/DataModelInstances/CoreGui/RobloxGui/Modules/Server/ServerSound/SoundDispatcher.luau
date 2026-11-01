local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local DefaultSoundEvents = ReplicatedStorage:FindFirstChild("DefaultSoundEvents")

if not DefaultSoundEvents then
	DefaultSoundEvents = Instance.new("Folder")
	DefaultSoundEvents.Name = "DefaultSoundEvents"
	DefaultSoundEvents.Archivable = false
	DefaultSoundEvents.Parent = ReplicatedStorage
end
local function _(ChildName, p1)
	-- upvalues: DefaultSoundEvents (ref)
	local ChildName1 = DefaultSoundEvents:FindFirstChild(ChildName)
	
	if not ChildName1 then
		ChildName1 = Instance.new(p1)
		ChildName1.Name = ChildName
		ChildName1.Parent = DefaultSoundEvents
	end
	return ChildName1
end

local DefaultServerSoundEvent = DefaultSoundEvents:FindFirstChild("DefaultServerSoundEvent")

if not DefaultServerSoundEvent then
	DefaultServerSoundEvent = Instance.new("RemoteEvent")
	DefaultServerSoundEvent.Name = "DefaultServerSoundEvent"
	DefaultServerSoundEvent.Parent = DefaultSoundEvents
end
local AddCharacterLoadedEvent = DefaultSoundEvents:FindFirstChild("AddCharacterLoadedEvent")

if not AddCharacterLoadedEvent then
	AddCharacterLoadedEvent = Instance.new("RemoteEvent")
	AddCharacterLoadedEvent.Name = "AddCharacterLoadedEvent"
	AddCharacterLoadedEvent.Parent = DefaultSoundEvents
end
local RemoveCharacterEvent = DefaultSoundEvents:FindFirstChild("RemoveCharacterEvent")

if not RemoveCharacterEvent then
	RemoveCharacterEvent = Instance.new("RemoteEvent")
	RemoveCharacterEvent.Name = "RemoveCharacterEvent"
	RemoveCharacterEvent.Parent = DefaultSoundEvents
end
local function fireDefaultServerSoundEventToClient(Player, p1, p2, p3)
	-- upvalues: t (copy), DefaultServerSoundEvent (copy)
	if t[Player] then
		DefaultServerSoundEvent:FireClient(Player, p1, p2, p3)
	end
end

local function addCharacterLoaded(Player)
	-- upvalues: t (copy)
	t[Player] = true
end

local function removeCharacter(Player)
	-- upvalues: t (copy)
	t[Player] = nil
end

local SoundDispatcher = DefaultSoundEvents:FindFirstChild("SoundDispatcher")

if not SoundDispatcher then
	SoundDispatcher = Instance.new("BindableEvent")
	SoundDispatcher.Name = "SoundDispatcher"
	SoundDispatcher.Parent = DefaultSoundEvents
end
SoundDispatcher.Event:Connect(fireDefaultServerSoundEventToClient)
DefaultServerSoundEvent.OnServerEvent:Connect(function() end)
AddCharacterLoadedEvent.OnServerEvent:Connect(addCharacterLoaded)
RemoveCharacterEvent.OnServerEvent:Connect(removeCharacter)
Players.PlayerRemoving:Connect(removeCharacter)