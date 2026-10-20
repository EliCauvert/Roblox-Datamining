local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local UserProfileStore = require(CorePackages.Workspace.Packages.UserProfiles).Stores.UserProfileStore
local FFlagUserProfileStoreQueryRefetch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUserProfileStoreQueryRefetch
local FixCharacterNameHandlerNilProfileCrash = game:DefineFastFlag("FixCharacterNameHandlerNilProfileCrash", false)
local t = {}

local function setName(Player: Player, p1, p2)
	-- upvalues: t (copy)
	local InExperienceCombinedName = p2.names.inExperienceCombinedName
	local DisplayName = p2.names.displayName
	
	if p2.names.displayName == Player.DisplayName then
		Player.InternalDisplayName = InExperienceCombinedName
		t[p1].HumanoidDisplayNameChanged = Player:GetPropertyChangedSignal("DisplayName"):Connect(function()
			-- upvalues: DisplayName (copy), Player (copy)
			if DisplayName ~= Player.DisplayName then
				Player.InternalDisplayName = ""
			end
		end)
	end
end

local function checkHumanoid(Player, Character, p1)
	-- upvalues: setName (copy), t (copy)
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid then
		setName(Humanoid, Player, p1)
	end
	t[Player].CharacterHumanoidAdded = Character.ChildAdded:Connect(function(Child: Humanoid)
		-- upvalues: setName (upval), Player (copy), p1 (copy)
		if Child:IsA("Humanoid") then
			setName(Child, Player, p1)
		end
	end)
end

local function setNameOnCharacterAdded(Player: Player, p1)
	-- upvalues: t (copy), checkHumanoid (copy)
	t[Player] = {}
	
	if Player.Character then
		checkHumanoid(Player, Player.Character, p1)
	end
	t[Player].CharacterAdded = Player.CharacterAdded:Connect(function(Character)
		-- upvalues: checkHumanoid (upval), Player (copy), p1 (copy)
		checkHumanoid(Player, Character, p1)
	end)
	t[Player].CharacterRemoving = Player.CharacterRemoving:Connect(function()
		-- upvalues: t (upval), Player (copy)
		local HumanoidDisplayNameChanged = t[Player].HumanoidDisplayNameChanged
		
		if t[Player].CharacterHumanoidAdded then
			t[Player].CharacterHumanoidAdded:Disconnect()
		end
		if HumanoidDisplayNameChanged then
			t[Player].HumanoidDisplayNameChanged:Disconnect()
		end
	end)
end

local function onPlayerAdded(Player: Player)
	-- upvalues: UserProfileStore (copy), FixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy)
	UserProfileStore.get().fetchNamesByUserIds({ (tostring(Player.UserId)) }, function(p1)
		-- upvalues: FixCharacterNameHandlerNilProfileCrash (upval), setNameOnCharacterAdded (upval), Player (copy)
		local Data = p1.data
		local NoFixCharacterNameHandlerNilProfileCrash: boolean = not FixCharacterNameHandlerNilProfileCrash or #Data > 0 and Data[1].names ~= nil
		
		if p1.status == "success" and NoFixCharacterNameHandlerNilProfileCrash then
			local Entry = Data[1]
			setNameOnCharacterAdded(Player, {
				names = {
					inExperienceCombinedName = Entry.names.getInExperienceCombinedName(false),
					displayName = Entry.names.getDisplayName(false)
				}
			})
		end
	end)
end

local function onPlayerRemoving(Player)
	-- upvalues: t (copy), FFlagUserProfileStoreQueryRefetch (copy), UserProfileStore (copy)
	local Entry = t[Player]
	
	if t[Player] then
		for _, Connection in pairs(Entry) do
			Connection:Disconnect()
		end
		t[Player] = nil
	end
	if FFlagUserProfileStoreQueryRefetch then
		UserProfileStore.get().invalidateCachedNamesForUserIds({ (tostring(Player.UserId)) })
	end
end

;(function()
	-- upvalues: Players (copy), UserProfileStore (copy), FixCharacterNameHandlerNilProfileCrash (copy), setNameOnCharacterAdded (copy)
	local List = {}
	local Players1 = {}
	
	for _, player in pairs((Players:GetPlayers())) do
		table.insert(List, (tostring(player.UserId)))
		Players1[tostring(player.UserId)] = player
	end
	UserProfileStore.get().fetchNamesByUserIds(List, function(p1)
		-- upvalues: Players1 (copy), FixCharacterNameHandlerNilProfileCrash (upval), setNameOnCharacterAdded (upval)
		local Data = p1.data
		
		if p1.status == "success" then
			for _, entry in Data do
				local Player = Players1[entry.userId]
				
				if not FixCharacterNameHandlerNilProfileCrash or Player and entry.names ~= nil then
					setNameOnCharacterAdded(Player, {
						names = {
							inExperienceCombinedName = entry.names.getInExperienceCombinedName(false),
							displayName = entry.names.getDisplayName(false)
						}
					})
				end
			end
		end
	end)
end)()
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)