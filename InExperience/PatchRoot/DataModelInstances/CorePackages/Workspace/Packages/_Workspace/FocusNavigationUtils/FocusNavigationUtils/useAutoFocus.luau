local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local focusNavigationContext = require(parent.ReactFocusNavigation).FocusNavigationContext
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

local var1 = function(p1, p2, p3)
	-- upvalues: fFlagLuaAppsDefaultSelection (ref), guiService (ref), coreGuiService (ref)
	local var2 = #p2 == 0
	local t = {}
	local t_1 = {}
	
	local function _()
		-- upvalues: var2 (write), t (ref)
		if not var2 then
			var2 = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end
	
	local function onFocusChange(_, _, p4)
		-- upvalues: var2 (write), t (ref)
		if p4 and not var2 then
			var2 = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end
	
	local function focus(p5)
		-- upvalues: p1 (ref), var2 (write), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p2 (ref), t (ref), coreGuiService (copy), p3 (ref), focus (ref), t_1 (ref)
		table.insert(t_1, task.delay(p1, function()
			-- upvalues: var2 (copy), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p2 (copy), t (copy), p5 (ref), coreGuiService (copy), p3 (copy), focus (copy)
			if not var2 then
				local selectedCoreObject
				if fFlagLuaAppsDefaultSelection then
					selectedCoreObject = guiService.SelectedCoreObject
					
					if selectedCoreObject then
						for i, v in p2 do
							if selectedCoreObject == v or selectedCoreObject:IsDescendantOf(v) then
								if not var2 then
									var2 = true
									
									for i_1, v_1 in t do
										v_1:Disconnect()
									end
								end
								return
							end
						end
					end
				end
				selectedCoreObject = p2[p5]
				
				if selectedCoreObject and selectedCoreObject:IsDescendantOf(coreGuiService) then
					p3:focusGuiObject(selectedCoreObject, false)
				end
				focus(if #p2 < p5 then 1 else p5 % #p2 + 1)
			end
		end))
	end
	
	for i, v in p2 do
		table.insert(t, v.SelectionChanged:Connect(onFocusChange))
	end
	local var3 = 1
	table.insert(t_1, task.delay(p1, function()
		-- upvalues: var2 (write), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p2 (ref), t (ref), var3 (ref), coreGuiService (copy), p3 (ref), focus (ref)
		if not var2 then
			local selectedCoreObject
			if fFlagLuaAppsDefaultSelection then
				selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject then
					for i, v in p2 do
						if selectedCoreObject == v or selectedCoreObject:IsDescendantOf(v) then
							if not var2 then
								var2 = true
								
								for i_1, v_1 in t do
									v_1:Disconnect()
								end
							end
							return
						end
					end
				end
			end
			selectedCoreObject = p2[var3]
			
			if selectedCoreObject and selectedCoreObject:IsDescendantOf(coreGuiService) then
				p3:focusGuiObject(selectedCoreObject, false)
			end
			focus(if #p2 < var3 then 1 else var3 % #p2 + 1)
		end
	end))
	
	return {
		cancel = function()
			-- upvalues: t_1 (ref), var2 (write), t (ref)
			for i, v in t_1 do
				task.cancel(v)
			end
			table.clear(t_1)
			
			if not var2 then
				var2 = true
				
				for i, v_1 in t do
					v_1:Disconnect()
				end
			end
		end
	}
end

return function(p6, p7)
	-- upvalues: reactModule (ref), focusNavigationContext (ref), var1 (ref)
	local var4 = reactModule.useContext(focusNavigationContext)
	
	return reactModule.useCallback(function()
		-- upvalues: var4 (ref), var1 (copy), p7 (ref), p6 (ref)
		return if var4 then var1(p7, p6, var4) else nil
	end, { var4, p6, p7 })
end