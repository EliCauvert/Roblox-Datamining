local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local t = {}
local v1 = nil

local function _(Text: string): boolean
	return string.match(Text, "[%w_]") ~= nil
end

local function findWholeName(Text: string, Text1: string, Init: number)
	if Text1 == "" then
		return nil, nil
	end
	local Lowered = string.lower(Text)
	local Lowered1 = string.lower(Text1)
	local StartIndex = nil
	local EndIndex = nil
	while true do
		StartIndex, EndIndex = string.find(Lowered, Lowered1, Init, true)
		if StartIndex == nil or EndIndex == nil then
			return nil, nil
		end
		local Segment: string = if StartIndex > 1 then string.sub(Text, StartIndex - 1, StartIndex - 1) else ""
		local Segment1: string = if EndIndex < #Text then string.sub(Text, EndIndex + 1, EndIndex + 1) else ""
		local IsSegmentMatch: boolean = Segment == "" or not (string.match(Segment, "[%w_]") ~= nil)
		local IsSegmentMatch1: boolean = Segment1 == "" or not (string.match(Segment1, "[%w_]") ~= nil)
		
		if IsSegmentMatch and IsSegmentMatch1 then
			return StartIndex, EndIndex
		end
		Init = StartIndex + 1
	end
end

return {
	resolveName = function(p1)
		-- upvalues: t (ref)
		return t[p1]
	end,
	failureReason = function()
		-- upvalues: v1 (ref)
		return v1
	end,
	start = function(p1)
		-- upvalues: Workspace (copy), Players (copy), CoreGui (copy), t (ref), v1 (ref), findWholeName (copy)
		local List = nil
		List = if p1 and p1.root then { p1.root } elseif p1 and p1.roots then p1.roots else { Workspace, Players, CoreGui }
		local Players1 = if p1 and p1.players then p1.players else Players:GetPlayers()
		local ConnectPlayerAdded = if p1 and p1.connectPlayerAdded then p1.connectPlayerAdded else function(Callback)
			-- upvalues: Players (upval)
			local PlayerAddedConnection = Players.PlayerAdded:Connect(Callback)
			
			return function()
				-- upvalues: PlayerAddedConnection (copy)
				PlayerAddedConnection:Disconnect()
			end
		end
		local t1 = {}
		local List1 = {}
		local self = setmetatable({}, { __mode = "k" })
		local t2 = {}
		local t3 = {}
		local t4 = {}
		local self1 = setmetatable({}, { __mode = "k" })
		local Connections = {}
		local self2 = setmetatable({}, { __mode = "k" })
		local List2 = {}
		local Count = 1
		local Flag = false
		local Flag1 = false
		t = t1
		v1 = nil
		
		for _, Player in Players1 do
			if type(Player.Name) == "string" and Player.Name ~= "" then
				t3[string.lower(Player.Name)] = true
			end
			if type(Player.DisplayName) == "string" and Player.DisplayName ~= "" then
				t3[string.lower(Player.DisplayName)] = true
			end
		end
		local function anonymizeText(Text: string): string
			-- upvalues: List1 (copy), findWholeName (upval), t1 (copy)
			local List = {}
			local StartIndex = 1
			while StartIndex <= #Text do
				local v2: number? = nil
				local v3: number? = nil
				local v4 = nil
				
				for _, value in List1 do
					local WholeName, WholeName2 = findWholeName(Text, value, StartIndex)
					
					if WholeName ~= nil and (v2 == nil or WholeName < v2) then
						v2 = WholeName
						v3 = WholeName2
						v4 = t1[value]
					end
				end
				if v2 ~= nil and v3 ~= nil and v4 ~= nil then
					table.insert(List, (string.sub(Text, StartIndex, v2 - 1)))
					table.insert(List, v4)
					StartIndex = v3 + 1
					continue
				end
				table.insert(List, (string.sub(Text, StartIndex)))
				break
			end
			return table.concat(List)
		end
		
		local function anonymizeRichText(Text: string): string
			-- upvalues: anonymizeText (copy)
			local List = {}
			local Init = 1
			while Init <= #Text do
				local StartIndex, EndIndex = string.find(Text, "<[^<>]*>", Init)
				
				if StartIndex ~= nil and EndIndex ~= nil then
					table.insert(List, anonymizeText((string.sub(Text, Init, StartIndex - 1))))
					table.insert(List, (string.sub(Text, StartIndex, EndIndex)))
					Init = EndIndex + 1
					continue
				end
				table.insert(List, anonymizeText((string.sub(Text, Init))))
				break
			end
			return table.concat(List)
		end
		
		local function _(Label, p2): boolean
			if p2 == "Text" then
				local Success, Result = pcall(function()
					-- upvalues: Label (copy)
					return Label.RichText
				end)
				
				return Success and Result == true
			else
				return false
			end
		end
		
		local function sanitizeProperty(Label, PropertyName)
			-- upvalues: self1 (copy), anonymizeRichText (copy), anonymizeText (copy), t (upval), t1 (copy), v1 (upval)
			local SelfEntry = self1[Label]
			local SelfEntry1 = SelfEntry and SelfEntry[PropertyName]
			
			if SelfEntry1 == nil or SelfEntry1.applying then return end
			local Success, Result = pcall(function()
				-- upvalues: Label (copy), PropertyName (copy)
				return Label[PropertyName]
			end)
			
			if not Success or type(Result) ~= "string" then return end
			local LastSource = Result
			
			if Result == SelfEntry1.lastApplied and SelfEntry1.lastSource ~= nil then
				LastSource = SelfEntry1.lastSource
			else
				SelfEntry1.lastSource = Result
			end
			local Replacement = SelfEntry1.replacement
			
			if not Replacement then
				local v5 = nil
				if PropertyName == "Text" then
					local Result1
					v5, Result1 = pcall(function()
						-- upvalues: Label (copy)
						return Label.RichText
					end)
					
					if v5 then
						v5 = Result1 == true
					end
				else
					v5 = false
				end
				Replacement = if v5 then anonymizeRichText(LastSource) else anonymizeText(LastSource)
			end
			if Replacement == Result then return end
			SelfEntry1.applying = true
			SelfEntry1.applying = false
			
			if pcall(function()
				-- upvalues: Label (copy), PropertyName (copy), Replacement (copy)
				Label[PropertyName] = Replacement
			end) then
				SelfEntry1.lastApplied = Replacement
				
				return
			end
			if not SelfEntry1.writeFailureWarned then
				SelfEntry1.writeFailureWarned = true
				local Text = "write-failed property=" .. PropertyName .. " instanceType=" .. (if typeof(Label) == "Instance" then Label.ClassName else typeof(Label))
				warn("[PLAYBACKANON] " .. Text)
				
				if t == t1 then
					v1 = Text
				end
			end
		end
		
		local _ = function(Key, Key1)
			-- upvalues: Connections (copy), self2 (copy)
			Connections[Key] = true
			
			if Key1 ~= nil then
				local SelfEntry = self2[Key1]
				
				if SelfEntry == nil then
					SelfEntry = {}
					self2[Key1] = SelfEntry
				end
				SelfEntry[Key] = true
			end
		end
		
		local _ = function(Key)
			-- upvalues: self1 (copy), self (copy), self2 (copy), Connections (copy)
			self1[Key] = nil
			self[Key] = nil
			local SelfEntry = self2[Key]
			
			if SelfEntry == nil then return end
			self2[Key] = nil
			
			for Connection in SelfEntry do
				Connection:Disconnect()
				Connections[Connection] = nil
			end
		end
		
		local function ensureInstanceCleanup(Key)
			-- upvalues: self2 (copy), List (ref), self1 (copy), self (copy), Connections (copy)
			if typeof(Key) ~= "Instance" or self2[Key] ~= nil then return end
			self2[Key] = {}
			local AncestryChangedConnection = Key.AncestryChanged:Connect(function()
				-- upvalues: List (upval), Key (copy), self1 (upval), self (upval), self2 (upval), Connections (upval)
				local Flag = false
				
				for _, value in List do
					if Key == value or Key:IsDescendantOf(value) then
						Flag = true
						break
					end
				end
				if not Flag then
					self1[Key] = nil
					self[Key] = nil
					local SelfEntry = self2[Key]
					
					if SelfEntry == nil then return end
					self2[Key] = nil
					
					for Connection in SelfEntry do
						Connection:Disconnect()
						Connections[Connection] = nil
					end
				end
			end)
			Connections[AncestryChangedConnection] = true
			
			if Key ~= nil then
				local SelfEntry = self2[Key]
				
				if SelfEntry == nil then
					SelfEntry = {}
					self2[Key] = SelfEntry
				end
				SelfEntry[AncestryChangedConnection] = true
			end
		end
		
		local v5 = nil
		
		local function watchProperty(Label, PropertyName, Callback: () -> (), Replacement)
			-- upvalues: self1 (copy), sanitizeProperty (copy), ensureInstanceCleanup (copy), Connections (copy), self2 (copy)
			local SelfEntry = self1[Label]
			
			if SelfEntry == nil then
				SelfEntry = {}
				self1[Label] = SelfEntry
			end
			local SelfEntry1 = SelfEntry[PropertyName]
			
			if SelfEntry1 == nil then
				SelfEntry[PropertyName] = {
					applying = false,
					lastSource = nil,
					lastApplied = nil,
					writeFailureWarned = false,
					onChanged = Callback,
					replacement = Replacement
				}
				ensureInstanceCleanup(Label)
				local Success, Result = pcall(function()
					-- upvalues: Label (copy), PropertyName (copy)
					return Label:GetPropertyChangedSignal(PropertyName)
				end)
				
				if Success then
					local Connection = Result:Connect(function()
						-- upvalues: self1 (upval), Label (copy), PropertyName (copy), sanitizeProperty (upval)
						local SelfEntry = self1[Label]
						local SelfEntry1 = SelfEntry and SelfEntry[PropertyName]
						
						if SelfEntry1 == nil or SelfEntry1.onChanged == nil then
							sanitizeProperty(Label, PropertyName)
							
							return
						else
							SelfEntry1.onChanged()
						end
					end)
					Connections[Connection] = true
					
					if Label ~= nil then
						local SelfEntry2 = self2[Label]
						
						if SelfEntry2 == nil then
							SelfEntry2 = {}
							self2[Label] = SelfEntry2
						end
						SelfEntry2[Connection] = true
					end
				end
				if Callback == nil then
					sanitizeProperty(Label, PropertyName)
					
					return
				else
					Callback()
					
					return
				end
			else
				if Replacement ~= nil then
					SelfEntry1.replacement = Replacement
				end
				if Callback ~= nil then
					SelfEntry1.onChanged = Callback
					Callback()
					
					return
				end
				if Replacement ~= nil then
					sanitizeProperty(Label, PropertyName)
				end
			end
		end
		
		v5 = function()
			-- upvalues: self1 (copy), sanitizeProperty (copy)
			local List = {}
			
			for i, value in pairs(self1) do
				for Property in pairs(value) do
					table.insert(List, { instance = i, property = Property })
				end
			end
			for _, value1 in List do
				sanitizeProperty(value1.instance, value1.property)
			end
		end
		
		local _ = function()
			-- upvalues: Flag (ref), Flag1 (ref), v5 (ref)
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
					if not Flag then return end
					Flag = false
					
					if not Flag1 then
						v5()
					end
				end)
				
				return
			end
		end
		
		local function rememberName(Text: string, p2): boolean
			-- upvalues: t1 (copy), t4 (copy), List1 (copy)
			if type(Text) ~= "string" or Text == "" or Text == p2 or t1[Text] ~= nil then
				return false
			elseif t4[string.lower(Text)] then
				return false
			else
				t1[Text] = p2
				table.insert(List1, Text)
				table.sort(List1, function(A, B): boolean
					return #B < #A
				end)
				
				return true
			end
		end
		
		local _ = function(Label, PropertyName, Replacement)
			-- upvalues: self1 (copy), rememberName (copy), sanitizeProperty (copy), Flag (ref), Flag1 (ref), v5 (ref), watchProperty (copy)
			watchProperty(Label, PropertyName, function()
				-- upvalues: self1 (upval), Label (copy), PropertyName (copy), rememberName (upval), Replacement (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
				local v6 = self1[Label]
				local v7 = v6 and v6[PropertyName]
				
				if v7 == nil or v7.applying then return end
				local Success, Result = pcall(function()
					-- upvalues: Label (upval), PropertyName (upval)
					return Label[PropertyName]
				end)
				local v8 = if Success and Result ~= v7.lastApplied then rememberName(Result, Replacement) else false
				sanitizeProperty(Label, PropertyName)
				
				if v8 then
					if Flag then return end
					Flag = true
					task.defer(function()
						-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
						if not Flag then return end
						Flag = false
						
						if not Flag1 then
							v5()
						end
					end)
				end
			end, Replacement)
		end
		
		local function watchVisibleInstance(Descendant)
			-- upvalues: watchProperty (copy)
			if Descendant:IsA("TextLabel") or Descendant:IsA("TextButton") or Descendant:IsA("TextBox") then
				watchProperty(Descendant, "Text")
				
				return
			end
			if Descendant:IsA("StringValue") then
				watchProperty(Descendant, "Value")
				
				return
			end
			if Descendant:IsA("Humanoid") then
				watchProperty(Descendant, "DisplayName")
				watchProperty(Descendant, "InternalDisplayName")
				local Parent = Descendant.Parent
				
				if Parent and Parent:IsA("Model") then
					watchProperty(Parent, "Name")
				end
			end
		end
		
		local function watchCharacterIdentity(Character, Replacement)
			-- upvalues: self1 (copy), rememberName (copy), sanitizeProperty (copy), Flag (ref), Flag1 (ref), v5 (ref), watchProperty (copy)
			local v6 = "Name"
			watchProperty(Character, "Name", function()
				-- upvalues: self1 (upval), Character (copy), v6 (copy), rememberName (upval), Replacement (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
				local v7 = self1[Character]
				local v8 = v7 and v7[v6]
				
				if v8 == nil or v8.applying then return end
				local Success, Result = pcall(function()
					-- upvalues: Character (upval), v6 (upval)
					return Character[v6]
				end)
				local v9 = if Success and Result ~= v8.lastApplied then rememberName(Result, Replacement) else false
				sanitizeProperty(Character, v6)
				
				if v9 then
					if Flag then return end
					Flag = true
					task.defer(function()
						-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
						if not Flag then return end
						Flag = false
						
						if not Flag1 then
							v5()
						end
					end)
				end
			end, Replacement)
			
			if typeof(Character) ~= "Instance" then return end
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid ~= nil then
				local v7 = "DisplayName"
				watchProperty(Humanoid, "DisplayName", function()
					-- upvalues: self1 (upval), Humanoid (copy), v7 (copy), rememberName (upval), Replacement (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
					local v8 = self1[Humanoid]
					local v9 = v8 and v8[v7]
					
					if v9 == nil or v9.applying then return end
					local Success, Result = pcall(function()
						-- upvalues: Humanoid (upval), v7 (upval)
						return Humanoid[v7]
					end)
					local v10 = if Success and Result ~= v9.lastApplied then rememberName(Result, Replacement) else false
					sanitizeProperty(Humanoid, v7)
					
					if v10 then
						if Flag then return end
						Flag = true
						task.defer(function()
							-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
							if not Flag then return end
							Flag = false
							
							if not Flag1 then
								v5()
							end
						end)
					end
				end, Replacement)
				local v8 = "InternalDisplayName"
				watchProperty(Humanoid, "InternalDisplayName", function()
					-- upvalues: self1 (upval), Humanoid (copy), v8 (copy), rememberName (upval), Replacement (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
					local v9 = self1[Humanoid]
					local v10 = v9 and v9[v8]
					
					if v10 == nil or v10.applying then return end
					local Success, Result = pcall(function()
						-- upvalues: Humanoid (upval), v8 (upval)
						return Humanoid[v8]
					end)
					local v11 = if Success and Result ~= v10.lastApplied then rememberName(Result, Replacement) else false
					sanitizeProperty(Humanoid, v8)
					
					if v11 then
						if Flag then return end
						Flag = true
						task.defer(function()
							-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
							if not Flag then return end
							Flag = false
							
							if not Flag1 then
								v5()
							end
						end)
					end
				end, Replacement)
			end
		end
		
		local function watchPlayer(Player: Player)
			-- upvalues: self (copy), t3 (copy), t2 (copy), Count (ref), t4 (copy), rememberName (copy), self1 (copy), sanitizeProperty (copy), Flag (ref), Flag1 (ref), v5 (ref), watchProperty (copy), watchCharacterIdentity (copy), Connections (copy), self2 (copy)
			if self[Player] ~= nil then return end
			local Number: number? = tonumber(Player.UserId)
			
			if type(Player.Name) == "string" and Player.Name ~= "" then
				t3[string.lower(Player.Name)] = true
			end
			if type(Player.DisplayName) == "string" and Player.DisplayName ~= "" then
				t3[string.lower(Player.DisplayName)] = true
			end
			local Entry = if Number == nil or Number <= 0 then nil else t2[Number]
			local Text = nil
			
			if Entry == nil then
				repeat
					Text = "Player" .. tostring(Count)
					Count += 1
				until not t3[string.lower(Text)]
				if Number ~= nil and Number > 0 then
					t2[Number] = Text
				end
			else
				Text = Entry
			end
			self[Player] = Text
			t4[string.lower(Text)] = true
			rememberName(Player.Name, Text)
			rememberName(Player.DisplayName, Text)
			local Replacement: string = Text
			local v6 = "Name"
			watchProperty(Player, "Name", function()
				-- upvalues: self1 (upval), Player (copy), v6 (copy), rememberName (upval), Replacement (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
				local v7 = self1[Player]
				local v8 = v7 and v7[v6]
				
				if v8 == nil or v8.applying then return end
				local Success, Result = pcall(function()
					-- upvalues: Player (upval), v6 (upval)
					return Player[v6]
				end)
				local v9 = if Success and Result ~= v8.lastApplied then rememberName(Result, Replacement) else false
				sanitizeProperty(Player, v6)
				
				if v9 then
					if Flag then return end
					Flag = true
					task.defer(function()
						-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
						if not Flag then return end
						Flag = false
						
						if not Flag1 then
							v5()
						end
					end)
				end
			end, Replacement)
			local Replacement1: string = Text
			local v7 = "DisplayName"
			watchProperty(Player, "DisplayName", function()
				-- upvalues: self1 (upval), Player (copy), v7 (copy), rememberName (upval), Replacement1 (copy), sanitizeProperty (upval), Flag (upval), Flag1 (upval), v5 (upval)
				local v8 = self1[Player]
				local v9 = v8 and v8[v7]
				
				if v9 == nil or v9.applying then return end
				local Success, Result = pcall(function()
					-- upvalues: Player (upval), v7 (upval)
					return Player[v7]
				end)
				local v10 = if Success and Result ~= v9.lastApplied then rememberName(Result, Replacement1) else false
				sanitizeProperty(Player, v7)
				
				if v10 then
					if Flag then return end
					Flag = true
					task.defer(function()
						-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
						if not Flag then return end
						Flag = false
						
						if not Flag1 then
							v5()
						end
					end)
				end
			end, Replacement1)
			local Character = Player.Character
			
			if Character then
				watchCharacterIdentity(Character, Text)
			end
			local Success, Result = pcall(function()
				-- upvalues: Player (copy)
				return Player.CharacterAdded
			end)
			
			if Success and Result then
				local Connection = Result:Connect(function(p2)
					-- upvalues: watchCharacterIdentity (upval), Text (ref)
					watchCharacterIdentity(p2, Text)
				end)
				Connections[Connection] = true
				
				if Player ~= nil then
					local SelfEntry = self2[Player]
					
					if SelfEntry == nil then
						SelfEntry = {}
						self2[Player] = SelfEntry
					end
					SelfEntry[Connection] = true
				end
			end
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag (upval), Flag1 (upval), v5 (upval)
					if not Flag then return end
					Flag = false
					
					if not Flag1 then
						v5()
					end
				end)
			end
		end
		
		table.sort(Players1, function(A, B): boolean
			local Number: number = tonumber(A.UserId) or 0
			local Number1: number = tonumber(B.UserId) or 0
			
			return if Number == Number1 then tostring(A.Name) < tostring(B.Name) else Number < Number1
		end)
		
		for _, value in Players1 do
			watchPlayer(value)
		end
		for _, value1 in List do
			for _, descendant in value1:GetDescendants() do
				watchVisibleInstance(descendant)
			end
			local DescendantAddedConnection, DescendantAddedConnection2 = value1.DescendantAdded:Connect(watchVisibleInstance)
			Connections[DescendantAddedConnection] = true
			
			if DescendantAddedConnection2 ~= nil then
				local SelfEntry = self2[DescendantAddedConnection2]
				
				if SelfEntry == nil then
					SelfEntry = {}
					self2[DescendantAddedConnection2] = SelfEntry
				end
				SelfEntry[DescendantAddedConnection] = true
			end
		end
		table.insert(List2, ConnectPlayerAdded(watchPlayer))
		v5()
		Flag = false
		print("[PLAYBACKANON] enabled source=lua")
		
		return function()
			-- upvalues: Flag1 (ref), Flag (ref), Connections (copy), List2 (copy), t (upval), t1 (copy), v1 (upval)
			Flag1 = true
			Flag = false
			
			for connection in Connections do
				connection:Disconnect()
			end
			for _, value in List2 do
				value()
			end
			if t == t1 then
				t = {}
				v1 = nil
			end
		end
	end
}