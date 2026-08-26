local guiService = game:GetService("GuiService")
local parent = script.Parent
local var1 = if require(parent.Flags).GetFFlagPeoplePageEnablePersonSignalStore() then require(parent.ServiceLocator).get("PeopleListStore") else require(parent.PeopleListStore)
local peopleUtilityModule = require(parent.PeopleUtility)
local settingsHubServiceModule = require(parent.Integration.SettingsHubService)

return (function()
	-- upvalues: settingsHubServiceModule (ref), guiService (ref), var1 (write), peopleUtilityModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local var2 = nil
	local var3 = nil
	local var4 = nil
	local var5 = false
	
	local function registerFrame(p1, p2)
		-- upvalues: t_3 (ref)
		t_3[p2] = p1
	end
	
	local function unregisterFrame(p1)
		-- upvalues: t_3 (ref)
		t_3[p1] = nil
	end
	
	local function registerScrollCallback(p1, p2)
		-- upvalues: t_4 (ref)
		t_4[p1] = p2
	end
	
	local function unregisterScrollCallback(p1)
		-- upvalues: t_4 (ref)
		t_4[p1] = nil
	end
	
	local function saveScrollPosition()
		-- upvalues: settingsHubServiceModule (copy), var4 (write)
		local var6 = settingsHubServiceModule.hubRef()
		
		if var6 and var6.PageView then
			var4 = var6.PageView.CanvasPosition
		end
	end
	
	local function _()
		-- upvalues: var4 (write), settingsHubServiceModule (copy), var5 (write)
		if var4 then
			local var6 = settingsHubServiceModule.hubRef()
			
			if var6 and var6.PageView then
				var6.PageView.CanvasPosition = var4
				var4 = nil
				var5 = false
			end
		end
	end
	
	local function getFirstPersonButton()
		-- upvalues: t (ref), t_2 (ref)
		local var6 = nil
		local var7 = 1e999
		
		for i, v in pairs(t) do
			if i ~= -1 then
				local var8 = t_2[i]
				
				if var8 < var7 then
					local var9 = nil
					local var10 = 1e999
					
					for i_1, v_1 in pairs(v) do
						if v_1.LayoutOrder and v_1.LayoutOrder < var10 then
							var10 = v_1.LayoutOrder
							var9 = v_1
						end
					end
					if var9 then
						var7 = var8
						var6 = var9
					end
				end
			end
		end
		return var6
	end
	
	local function handleSelectionChange()
		-- upvalues: guiService (copy), var3 (write), t_1 (ref), getFirstPersonButton (ref), var5 (write), var4 (write), settingsHubServiceModule (copy), t_4 (ref), t_3 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if var3 and selectedCoreObject then
			local var11 = t_1[var3]
			local var12 = t_1[selectedCoreObject]
			
			if var11 and var11 < 0 and (var12 and var12 >= 0) then
				local var13 = getFirstPersonButton()
				
				if var13 then
					task.defer(function()
						-- upvalues: guiService (copy), var13 (ref)
						guiService.SelectedCoreObject = var13
					end)
				end
			end
		end
		if selectedCoreObject then
			local var14 = t_1[selectedCoreObject]
			
			if var14 then
				if var5 and var4 then
					if var4 then
						local var15 = settingsHubServiceModule.hubRef()
						
						if var15 and var15.PageView then
							var15.PageView.CanvasPosition = var4
							var4 = nil
							var5 = false
						end
					end
					return
				else
					local var16 = t_4[var14]
					
					if var16 then
						var16()
					else
						local var17 = t_3[var14]
						
						if var17 then
							local var18 = settingsHubServiceModule.hubRef()
							
							if var18 then
								task.defer(function()
									-- upvalues: var18 (ref), var17 (ref)
									var18:ScrollToFrame(var17, true)
								end)
							end
						end
					end
				end
			end
		end
		var3 = selectedCoreObject
	end
	
	local _ = function()
		-- upvalues: var2 (write), guiService (copy), handleSelectionChange (ref)
		if not var2 then
			var2 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
		end
	end
	
	local _ = function()
		-- upvalues: var2 (write)
		if var2 then
			var2:Disconnect()
			var2 = nil
		end
	end
	
	local function registerButtonRow(p1, p2, p3)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref), var2 (write), guiService (copy), handleSelectionChange (ref)
		if not t[p1] then
			t[p1] = {}
		end
		t_2[p1] = p3
		
		for i, v in ipairs(p2) do
			t[p1][v.Name] = v
			t_1[v] = p1
		end
		if not var2 then
			var2 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
		end
	end
	
	local function unregisterButtonRow(p4)
		-- upvalues: t (ref), t_1 (ref), t_2 (ref), t_4 (ref), var2 (write)
		local var11 = t[p4]
		
		if var11 then
			for i, v in pairs(var11) do
				t_1[v] = nil
			end
		end
		t[p4] = nil
		t_2[p4] = nil
		t_4[p4] = nil
		
		if not next(t) and var2 then
			var2:Disconnect()
			var2 = nil
		end
	end
	
	local _ = function()
		-- upvalues: guiService (copy), t_1 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject then
			local var12 = t_1[selectedCoreObject]
			local name = selectedCoreObject.Name
			
			if var12 and name then
				return var12, name
			end
		end
		return nil, nil
	end
	
	local function findButtonForUser(p5, p6)
		-- upvalues: t (ref)
		local var12 = t[p5]
		
		if not var12 then
			return nil
		end
		local var13 = var12[p6]
		
		if var13 then
			return var13
		end
		local var14 = nil
		
		for i, v in pairs(var12) do
			if not var14 or v.LayoutOrder < var14.LayoutOrder then
				var14 = v
			end
		end
		return var14
	end
	
	local _ = function(p7, p8)
		-- upvalues: t_2 (ref)
		if #p8 == 0 then
			return nil
		end
		local var15 = t_2[p7]
		
		return if var15 then if p8[var15] then p8[var15].UserId elseif var15 > 1 and p8[var15 - 1] then p8[var15 - 1].UserId else p8[1].UserId else p8[1].UserId
	end
	
	return {
		registerButtonRow = registerButtonRow,
		unregisterButtonRow = unregisterButtonRow,
		registerFrame = registerFrame,
		unregisterFrame = unregisterFrame,
		registerScrollCallback = registerScrollCallback,
		unregisterScrollCallback = unregisterScrollCallback,
		handlePersonRemoved = function(p7)
			-- upvalues: var1 (copy), guiService (copy), t_1 (ref), t_2 (ref), t (ref), findButtonForUser (ref)
			local v
			local var15 = var1.people(false)
			
			for i, v in ipairs(var15) do
				if v.UserId == p7 then return end
			end
			local var16, var17, var18
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject then
				var16 = t_1[selectedCoreObject]
				v = selectedCoreObject.Name
				
				if var16 and v then
					var17 = var16
					var18 = v
				else
					var17 = nil
					var18 = nil
				end
				if var17 ~= p7 or not var18 then return end
				if #var15 == 0 then
					selectedCoreObject = nil
				else
					var16 = t_2[p7]
					selectedCoreObject = if not var16 then if var15[var16] then var15[var16].UserId elseif var16 > 1 and var15[var16 - 1] then var15[var16 - 1].UserId else var15[1].UserId else var15[1].UserId
				end
				if selectedCoreObject and t[selectedCoreObject] then
					var16 = findButtonForUser(selectedCoreObject, var18)
					
					if var16 then
						task.defer(function()
							-- upvalues: guiService (copy), var16 (ref)
							guiService.SelectedCoreObject = var16
						end)
						
						return
					end
				end
				for i_1, v_1 in pairs(t) do
					if i_1 ~= p7 then
						local var19 = findButtonForUser(i_1, var18)
						
						if var19 then
							task.defer(function()
								-- upvalues: guiService (copy), var19 (ref)
								guiService.SelectedCoreObject = var19
							end)
							
							return
						end
					end
				end
			end
		end,
		hasSelectablePlatformButton = function(p8)
			-- upvalues: var1 (copy), peopleUtilityModule (copy)
			if p8 then
				local var20 = var1.getPlatformName(p8)(false)
				
				return var20 and (type(var20) == "string" and string.len(var20) > 0) and peopleUtilityModule.canShowPlatformProfile(var1.getPlatformProfileId(p8)(false) or "")
			end
			return false
		end,
		saveScrollPosition = saveScrollPosition,
		setBlockingModalRestoreMode = function(value)
			-- upvalues: var5 (write)
			var5 = value
		end,
		getFirstPersonButton = getFirstPersonButton
	}
end)()