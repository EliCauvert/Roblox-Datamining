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
	local var9 = nil
	local var10 = nil
	local var11 = nil
	local var12 = false
	
	local function registerFrame(p0, p1)
		-- upvalues: t_3 (ref)
		t_3[p1] = p0
	end
	
	local function unregisterFrame(p2)
		-- upvalues: t_3 (ref)
		t_3[p2] = nil
	end
	
	local function registerScrollCallback(p3, p4)
		-- upvalues: t_4 (ref)
		t_4[p3] = p4
	end
	
	local function unregisterScrollCallback(p5)
		-- upvalues: t_4 (ref)
		t_4[p5] = nil
	end
	
	local function saveScrollPosition()
		-- upvalues: settingsHubServiceModule (copy), var11 (write)
		local var23 = settingsHubServiceModule.hubRef()
		
		if var23 and var23.PageView then
			var11 = var23.PageView.CanvasPosition
		end
	end
	
	local function _()
		-- upvalues: var11 (write), settingsHubServiceModule (copy), var12 (write)
		if var11 then
			local var24 = settingsHubServiceModule.hubRef()
			
			if var24 and var24.PageView then
				var24.PageView.CanvasPosition = var11
				var11 = nil
				var12 = false
			end
		end
	end
	
	local function getFirstPersonButton()
		-- upvalues: t (ref), t_2 (ref)
		local var25 = nil
		local var26 = 1e999
		
		for i, v in pairs(t) do
			if i ~= -1 then
				local var27 = t_2[i]
				
				if var27 < var26 then
					local var28 = nil
					local var29 = 1e999
					
					for i_1, v_1 in pairs(v) do
						if v_1.LayoutOrder and v_1.LayoutOrder < var29 then
							var29 = v_1.LayoutOrder
							var28 = v_1
						end
					end
					if var28 then
						var26 = var27
						var25 = var28
					end
				end
			end
		end
		return var25
	end
	
	local function handleSelectionChange()
		-- upvalues: guiService (copy), var10 (write), t_1 (ref), getFirstPersonButton (ref), var12 (write), var11 (write), settingsHubServiceModule (copy), t_4 (ref), t_3 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if var10 and selectedCoreObject then
			local var30 = t_1[var10]
			local var31 = t_1[selectedCoreObject]
			
			if var30 and var30 < 0 and (var31 and var31 >= 0) then
				local var32 = getFirstPersonButton()
				
				if var32 then
					task.defer(function()
						-- upvalues: guiService (copy), var32 (ref)
						guiService.SelectedCoreObject = var32
					end)
				end
			end
		end
		if selectedCoreObject then
			local var33 = t_1[selectedCoreObject]
			
			if var33 then
				if var12 and var11 then
					if var11 then
						local var34 = settingsHubServiceModule.hubRef()
						
						if var34 and var34.PageView then
							var34.PageView.CanvasPosition = var11
							var11 = nil
							var12 = false
						end
					end
					return
				else
					local var35 = t_4[var33]
					
					if var35 then
						var35()
					else
						local var36 = t_3[var33]
						
						if var36 then
							local var37 = settingsHubServiceModule.hubRef()
							
							if var37 then
								task.defer(function()
									-- upvalues: var37 (ref), var36 (ref)
									var37:ScrollToFrame(var36, true)
								end)
							end
						end
					end
				end
			end
		end
		var10 = selectedCoreObject
	end
	
	local _ = function()
		-- upvalues: var9 (write), guiService (copy), handleSelectionChange (ref)
		if not var9 then
			var9 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
		end
	end
	
	local _ = function()
		-- upvalues: var9 (write)
		if var9 then
			var9:Disconnect()
			var9 = nil
		end
	end
	
	local function registerButtonRow(p6, p7, p8)
		-- upvalues: t (ref), t_2 (ref), t_1 (ref), var9 (write), guiService (copy), handleSelectionChange (ref)
		if not t[p6] then
			t[p6] = {}
		end
		t_2[p6] = p8
		
		for i, v in ipairs(p7) do
			t[p6][v.Name] = v
			t_1[v] = p6
		end
		if not var9 then
			var9 = guiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(handleSelectionChange)
		end
	end
	
	local function unregisterButtonRow(p9)
		-- upvalues: t (ref), t_1 (ref), t_2 (ref), t_4 (ref), var9 (write)
		local var38 = t[p9]
		
		if var38 then
			for i, v in pairs(var38) do
				t_1[v] = nil
			end
		end
		t[p9] = nil
		t_2[p9] = nil
		t_4[p9] = nil
		
		if not next(t) and var9 then
			var9:Disconnect()
			var9 = nil
		end
	end
	
	local _ = function()
		-- upvalues: guiService (copy), t_1 (ref)
		local selectedCoreObject = guiService.SelectedCoreObject
		
		if selectedCoreObject then
			local var39 = t_1[selectedCoreObject]
			local name = selectedCoreObject.Name
			
			if var39 and name then
				return var39, name
			end
		end
		return nil, nil
	end
	
	local function findButtonForUser(p10, p11)
		-- upvalues: t (ref)
		local var40 = t[p10]
		
		if not var40 then
			return nil
		end
		local var41 = var40[p11]
		
		if var41 then
			return var41
		end
		local var42 = nil
		
		for i, v in pairs(var40) do
			if not var42 or v.LayoutOrder < var42.LayoutOrder then
				var42 = v
			end
		end
		return var42
	end
	
	local _ = function(p12, p13)
		-- upvalues: t_2 (ref)
		if #p13 == 0 then
			return nil
		end
		local var43 = t_2[p12]
		
		return if var43 then if p13[var43] then p13[var43].UserId elseif var43 > 1 and p13[var43 - 1] then p13[var43 - 1].UserId else p13[1].UserId else p13[1].UserId
	end
	
	return {
		registerButtonRow = registerButtonRow,
		unregisterButtonRow = unregisterButtonRow,
		registerFrame = registerFrame,
		unregisterFrame = unregisterFrame,
		registerScrollCallback = registerScrollCallback,
		unregisterScrollCallback = unregisterScrollCallback,
		handlePersonRemoved = function(p14)
			-- upvalues: var1 (copy), guiService (copy), t_1 (ref), t_2 (ref), t (ref), findButtonForUser (ref)
			local v
			local var44 = var1.people(false)
			
			for i, v in ipairs(var44) do
				if v.UserId == p14 then return end
			end
			local var45, var46, var47
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if selectedCoreObject then
				var45 = t_1[selectedCoreObject]
				v = selectedCoreObject.Name
				
				if var45 and v then
					var46 = var45
					var47 = v
				else
					var46 = nil
					var47 = nil
				end
				if var46 ~= p14 or not var47 then return end
				if #var44 == 0 then
					selectedCoreObject = nil
				else
					var45 = t_2[p14]
					selectedCoreObject = if not var45 then if var44[var45] then var44[var45].UserId elseif var45 > 1 and var44[var45 - 1] then var44[var45 - 1].UserId else var44[1].UserId else var44[1].UserId
				end
				if selectedCoreObject and t[selectedCoreObject] then
					var45 = findButtonForUser(selectedCoreObject, var47)
					
					if var45 then
						task.defer(function()
							-- upvalues: guiService (copy), var45 (ref)
							guiService.SelectedCoreObject = var45
						end)
						
						return
					end
				end
				for i_1, v_1 in pairs(t) do
					if i_1 ~= p14 then
						local var48 = findButtonForUser(i_1, var47)
						
						if var48 then
							task.defer(function()
								-- upvalues: guiService (copy), var48 (ref)
								guiService.SelectedCoreObject = var48
							end)
							
							return
						end
					end
				end
			end
		end,
		hasSelectablePlatformButton = function(p15)
			-- upvalues: var1 (copy), peopleUtilityModule (copy)
			if p15 then
				local var49 = var1.getPlatformName(p15)(false)
				
				return var49 and (type(var49) == "string" and string.len(var49) > 0) and peopleUtilityModule.canShowPlatformProfile(var1.getPlatformProfileId(p15)(false) or "")
			end
			return false
		end,
		saveScrollPosition = saveScrollPosition,
		setBlockingModalRestoreMode = function(value)
			-- upvalues: var12 (write)
			var12 = value
		end,
		getFirstPersonButton = getFirstPersonButton
	}
end)()