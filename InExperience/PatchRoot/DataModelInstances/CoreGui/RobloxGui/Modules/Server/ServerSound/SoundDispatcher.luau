local playersService = game:GetService("Players")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local t = {}
local defaultSoundEvents_1 = replicatedStorageService:FindFirstChild("DefaultSoundEvents")

if not defaultSoundEvents_1 then
	defaultSoundEvents_1 = Instance.new("Folder")
	defaultSoundEvents_1.Name = "DefaultSoundEvents"
	defaultSoundEvents_1.Archivable = false
	defaultSoundEvents_1.Parent = replicatedStorageService
end
local function _(p1, p2)
	-- upvalues: defaultSoundEvents_1 (write)
	local var1 = defaultSoundEvents_1:FindFirstChild(p1)
	
	if not var1 then
		var1 = Instance.new(p2)
		var1.Name = p1
		var1.Parent = defaultSoundEvents_1
	end
	return var1
end

local defaultServerSoundEvent_1 = defaultSoundEvents_1:FindFirstChild("DefaultServerSoundEvent")

if not defaultServerSoundEvent_1 then
	defaultServerSoundEvent_1 = Instance.new("RemoteEvent")
	defaultServerSoundEvent_1.Name = "DefaultServerSoundEvent"
	defaultServerSoundEvent_1.Parent = defaultSoundEvents_1
end
local addCharacterLoadedEvent_1 = defaultSoundEvents_1:FindFirstChild("AddCharacterLoadedEvent")

if not addCharacterLoadedEvent_1 then
	addCharacterLoadedEvent_1 = Instance.new("RemoteEvent")
	addCharacterLoadedEvent_1.Name = "AddCharacterLoadedEvent"
	addCharacterLoadedEvent_1.Parent = defaultSoundEvents_1
end
local removeCharacterEvent_1 = defaultSoundEvents_1:FindFirstChild("RemoveCharacterEvent")

if not removeCharacterEvent_1 then
	removeCharacterEvent_1 = Instance.new("RemoteEvent")
	removeCharacterEvent_1.Name = "RemoveCharacterEvent"
	removeCharacterEvent_1.Parent = defaultSoundEvents_1
end
local function fireDefaultServerSoundEventToClient(p1, p2, p3, p4)
	-- upvalues: t (ref), defaultServerSoundEvent_1 (ref)
	if t[p1] then
		defaultServerSoundEvent_1:FireClient(p1, p2, p3, p4)
	end
end

local function addCharacterLoaded(p1)
	-- upvalues: t (ref)
	t[p1] = true
end

local function removeCharacter(p1)
	-- upvalues: t (ref)
	t[p1] = nil
end

local soundDispatcher_1 = defaultSoundEvents_1:FindFirstChild("SoundDispatcher")

if not soundDispatcher_1 then
	soundDispatcher_1 = Instance.new("BindableEvent")
	soundDispatcher_1.Name = "SoundDispatcher"
	soundDispatcher_1.Parent = defaultSoundEvents_1
end
soundDispatcher_1.Event:Connect(fireDefaultServerSoundEventToClient)
defaultServerSoundEvent_1.OnServerEvent:Connect(function() end)
addCharacterLoadedEvent_1.OnServerEvent:Connect(addCharacterLoaded)
removeCharacterEvent_1.OnServerEvent:Connect(removeCharacter)
playersService.PlayerRemoving:Connect(removeCharacter)