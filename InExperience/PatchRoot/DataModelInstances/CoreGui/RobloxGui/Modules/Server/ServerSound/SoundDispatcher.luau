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
local function _(ChildName, p1) --[[ Line: 27 | Named "createEvent" ]]
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
local RemoteEvent = DefaultServerSoundEvent
local AddCharacterLoadedEvent = DefaultSoundEvents:FindFirstChild("AddCharacterLoadedEvent")

if not AddCharacterLoadedEvent then
	AddCharacterLoadedEvent = Instance.new("RemoteEvent")
	AddCharacterLoadedEvent.Name = "AddCharacterLoadedEvent"
	AddCharacterLoadedEvent.Parent = DefaultSoundEvents
end
local RemoteEvent1 = AddCharacterLoadedEvent
local RemoveCharacterEvent = DefaultSoundEvents:FindFirstChild("RemoveCharacterEvent")

if not RemoveCharacterEvent then
	RemoveCharacterEvent = Instance.new("RemoteEvent")
	RemoveCharacterEvent.Name = "RemoveCharacterEvent"
	RemoveCharacterEvent.Parent = DefaultSoundEvents
end
local RemoteEvent2 = RemoveCharacterEvent

local function fireDefaultServerSoundEventToClient(Player, p1, p2, p3) --[[ Line: 43 ]]
	-- upvalues: t (copy), RemoteEvent (copy)
	if t[Player] then
		RemoteEvent:FireClient(Player, p1, p2, p3)
	end
end

local function addCharacterLoaded(Player) --[[ Line: 50 ]]
	-- upvalues: t (copy)
	t[Player] = true
end

local function removeCharacter(Player) --[[ Line: 55 ]]
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
RemoteEvent.OnServerEvent:Connect(function() --[[ Line: 63 ]] end)
RemoteEvent1.OnServerEvent:Connect(addCharacterLoaded)
RemoteEvent2.OnServerEvent:Connect(removeCharacter)
Players.PlayerRemoving:Connect(removeCharacter)