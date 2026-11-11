local GuiService = game:GetService("GuiService")
local Parent = script.Parent
local PeopleListStore = nil
PeopleListStore = if require(Parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore() then require(Parent.ServiceLocator).get("PeopleListStore") else require(Parent.PeopleListStore)
local PeopleUtilityModule = require(Parent.PeopleUtility)
local SettingsHubServiceModule = require(Parent.Integration.SettingsHubService)

return ((function()
	-- upvalues: SettingsHubServiceModule (copy), GuiService (copy), PeopleListStore (ref), PeopleUtilityModule (copy)
	local t = {}
	local Keys = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local Connection = nil
	local v1 = nil
	local CanvasPosition = nil
	local BlockingModalRestoreMode = false
	
	local function _()
		-- upvalues: CanvasPosition (ref), SettingsHubServiceModule (upval), BlockingModalRestoreMode (ref)
		if CanvasPosition then
			local HubRefResult = SettingsHubServiceModule.hubRef()
			
			if HubRefResult and HubRefResult.PageView then
				HubRefResult.PageView.CanvasPosition = CanvasPosition
				CanvasPosition = nil
				BlockingModalRestoreMode = false
			end
		end
	end
	
	local function getFirstPersonButton()
		-- upvalues: t (copy), t1 (copy)
		local v2 = nil
		local v3 = 1e999
		
		for i, value in pairs(t) do
			if i ~= -1 then
				local Entry = t1[i]
				
				if Entry < v3 then
					local v4 = nil
					local LayoutOrder = 1e999
					
					for _, Frame in pairs(value) do
						if Frame.LayoutOrder and Frame.LayoutOrder < LayoutOrder then
							LayoutOrder = Frame.LayoutOrder
							v4 = Frame
						end
					end
					if v4 then
						v3 = Entry
						v2 = v4
					end
				end
			end
		end
		return v2
	end
	
	local function handleSelectionChange()
		-- upvalues: GuiService (upval), v1 (ref), Keys (copy), getFirstPersonButton (copy), BlockingModalRestoreMode (ref), CanvasPosition (ref), SettingsHubServiceModule (upval), t3 (copy), t2 (copy)
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if v1 and SelectedCoreObject then
			local Key: number = Keys[v1]
			local Key1: number = Keys[SelectedCoreObject]
			
			if Key and Key < 0 and Key1 and Key1 >= 0 then
				local FirstPersonButton = getFirstPersonButton()
				
				if FirstPersonButton then
					task.defer(function()
						-- upvalues: GuiService (upval), FirstPersonButton (copy)
						GuiService.SelectedCoreObject = FirstPersonButton
					end)
				end
			end
		end
		if SelectedCoreObject then
			local Key = Keys[SelectedCoreObject]
			
			if Key then
				if not BlockingModalRestoreMode or not CanvasPosition then
					local Entry: () -> () = t3[Key]
					
					if Entry then
						Entry()
					else
						local Entry1 = t2[Key]
						
						if Entry1 then
							local HubRefResult = SettingsHubServiceModule.hubRef()
							
							if HubRefResult then
								task.defer(function()
									-- upvalues: HubRefResult (copy), Entry1 (copy)
									HubRefResult:ScrollToFrame(Entry1, true)
								end)
							end
						end
					end
				else
					if CanvasPosition then
						local HubRefResult = SettingsHubServiceModule.hubRef()
						
						if HubRefResult and HubRefResult.PageView then
							HubRefResult.PageView.CanvasPosition = CanvasPosition
							CanvasPosition = nil
							BlockingModalRestoreMode = false
						end
					end
					return
				end
			end
		end
		v1 = SelectedCoreObject
	end
	
	local _ = function()
		-- upvalues: Connection (ref), GuiService (upval), handleSelectionChange (copy)
		if not Connection then
			Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
		end
	end
	
	local _ = function()
		-- upvalues: Connection (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
	end
	
	local _ = function()
		-- upvalues: GuiService (upval), Keys (copy)
		local SelectedCoreObject = GuiService.SelectedCoreObject
		
		if SelectedCoreObject then
			local Key = Keys[SelectedCoreObject]
			local Name = SelectedCoreObject.Name
			
			if Key and Name then
				return Key, Name
			end
		end
		return nil, nil
	end
	
	local function findButtonForUser(UserId, p1)
		-- upvalues: t (copy)
		local Entry = t[UserId]
		
		if not Entry then
			return nil
		end
		local Entry1 = Entry[p1]
		
		if Entry1 then
			return Entry1
		end
		local Frame = nil
		
		for _, Frame1 in pairs(Entry) do
			if not Frame or Frame1.LayoutOrder < Frame.LayoutOrder then
				Frame = Frame1
			end
		end
		return Frame
	end
	
	local _ = function(p2, Entry)
		-- upvalues: t1 (copy)
		if #Entry == 0 then
			return nil
		else
			local Entry1: number = t1[p2]
			
			return if Entry1 then if Entry[Entry1] then Entry[Entry1].UserId elseif Entry1 > 1 and Entry[Entry1 - 1] then Entry[Entry1 - 1].UserId else Entry[1].UserId else Entry[1].UserId
		end
	end
	
	return {
		registerButtonRow = function(Key, List, p2)
			-- upvalues: t (copy), t1 (copy), Keys (copy), Connection (ref), GuiService (upval), handleSelectionChange (copy)
			if not t[Key] then
				t[Key] = {}
			end
			t1[Key] = p2
			
			for _, value in ipairs(List) do
				t[Key][value.Name] = value
				Keys[value] = Key
			end
			if not Connection then
				Connection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
			end
		end,
		unregisterButtonRow = function(Key)
			-- upvalues: t (copy), Keys (copy), t1 (copy), t3 (copy), Connection (ref)
			local Entry = t[Key]
			
			if Entry then
				for _, value in pairs(Entry) do
					Keys[value] = nil
				end
			end
			t[Key] = nil
			t1[Key] = nil
			t3[Key] = nil
			
			if not next(t) and Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end,
		registerFrame = function(p3, Key)
			-- upvalues: t2 (copy)
			t2[Key] = p3
		end,
		unregisterFrame = function(Key)
			-- upvalues: t2 (copy)
			t2[Key] = nil
		end,
		registerScrollCallback = function(Key, p3)
			-- upvalues: t3 (copy)
			t3[Key] = p3
		end,
		unregisterScrollCallback = function(Key)
			-- upvalues: t3 (copy)
			t3[Key] = nil
		end,
		handlePersonRemoved = function(UserId)
			-- upvalues: PeopleListStore (upval), GuiService (upval), Keys (copy), t1 (copy), t (copy), findButtonForUser (copy)
			local PeopleResult = PeopleListStore.people(false)
			
			for _, Player in ipairs(PeopleResult) do
				if Player.UserId == UserId then return end
			end
			local SelectedCoreObject = GuiService.SelectedCoreObject
			local UserId1 = nil
			local v5 = nil
			repeat
				if SelectedCoreObject then
					local Key = Keys[SelectedCoreObject]
					local Name = SelectedCoreObject.Name
					
					if Key and Name then
						UserId1 = Key
						v5 = Name
						break
					end
				end
				UserId1 = nil
				v5 = nil
			until true
			if UserId1 ~= UserId or not v5 then return end
			local UserId2 = nil
			if #PeopleResult == 0 then
				UserId2 = nil
			else
				local Entry: number = t1[UserId]
				UserId2 = if Entry then if PeopleResult[Entry] then PeopleResult[Entry].UserId elseif Entry > 1 and PeopleResult[Entry - 1] then PeopleResult[Entry - 1].UserId else PeopleResult[1].UserId else PeopleResult[1].UserId
			end
			if UserId2 and t[UserId2] then
				local ButtonForUser = findButtonForUser(UserId2, v5)
				
				if ButtonForUser then
					task.defer(function()
						-- upvalues: GuiService (upval), ButtonForUser (copy)
						GuiService.SelectedCoreObject = ButtonForUser
					end)
					
					return
				end
			end
			local ButtonForUser1 = nil
			for i, _ in pairs(t) do
				if i ~= UserId then
					ButtonForUser1 = findButtonForUser(i, v5)
					
					if ButtonForUser1 then
						task.defer(function()
							-- upvalues: GuiService (upval), ButtonForUser1 (copy)
							GuiService.SelectedCoreObject = ButtonForUser1
						end)
						break
					end
				end
			end
		end,
		hasSelectablePlatformButton = function(p3)
			-- upvalues: PeopleListStore (upval), PeopleUtilityModule (upval)
			if p3 then
				local Text: string = PeopleListStore.getPlatformName(p3)(false)
				local CanShowPlatformProfile = PeopleUtilityModule.canShowPlatformProfile(PeopleListStore.getPlatformProfileId(p3)(false) or "")
				
				return Text and (type(Text) == "string" and string.len(Text) > 0) and CanShowPlatformProfile
			else
				return false
			end
		end,
		saveScrollPosition = function()
			-- upvalues: SettingsHubServiceModule (upval), CanvasPosition (ref)
			local HubRefResult = SettingsHubServiceModule.hubRef()
			
			if HubRefResult and HubRefResult.PageView then
				CanvasPosition = HubRefResult.PageView.CanvasPosition
			end
		end,
		setBlockingModalRestoreMode = function(Value)
			-- upvalues: BlockingModalRestoreMode (ref)
			BlockingModalRestoreMode = Value
		end,
		getFirstPersonButton = getFirstPersonButton
	}
end)())