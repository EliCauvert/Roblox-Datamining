local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local reactModule = require(parent.React)
local focusNavigationContext = require(parent.ReactFocusNavigation).FocusNavigationContext
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

local var3 = function(p0, p1, p2) --[[ line: 19 ]]
	-- upvalues: fFlagLuaAppsDefaultSelection (ref), guiService (ref), coreGuiService (ref)
	local var4 = #p1 == 0
	local t = {}
	local t_1 = {}
	
	local function _() --[[ line: 24 | named "disconnect" ]]
		-- upvalues: var4 (write), t (ref)
		if not var4 then
			var4 = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end
	
	local function onFocusChange(_, _, p3) --[[ line: 33 ]]
		-- upvalues: var4 (write), t (ref)
		if p3 and not var4 then
			var4 = true
			
			for i, v in t do
				v:Disconnect()
			end
		end
	end
	
	local function focus(p4) --[[ line: 39 ]]
		-- upvalues: p0 (ref), var4 (write), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p1 (ref), t (ref), coreGuiService (copy), p2 (ref), focus (ref), t_1 (ref)
		table.insert(t_1, task.delay(p0, function() --[[ line: 40 ]]
			-- upvalues: var4 (copy), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p1 (copy), t (copy), p4 (ref), coreGuiService (copy), p2 (copy), focus (copy)
			if not var4 then
				local selectedCoreObject
				if fFlagLuaAppsDefaultSelection then
					selectedCoreObject = guiService.SelectedCoreObject
					
					if selectedCoreObject then
						for i, v in p1 do
							if selectedCoreObject == v or selectedCoreObject:IsDescendantOf(v) then
								if not var4 then
									var4 = true
									
									for i_1, v_1 in t do
										v_1:Disconnect()
									end
								end
								return
							end
						end
					end
				end
				selectedCoreObject = p1[p4]
				
				if selectedCoreObject and selectedCoreObject:IsDescendantOf(coreGuiService) then
					p2:focusGuiObject(selectedCoreObject, false)
				end
				focus(if #p1 < p4 then 1 else p4 % #p1 + 1)
			end
		end))
	end
	
	for i, v in p1 do
		table.insert(t, v.SelectionChanged:Connect(onFocusChange))
	end
	local var9 = 1
	table.insert(t_1, task.delay(p0, function() --[[ line: 40 ]]
		-- upvalues: var4 (write), fFlagLuaAppsDefaultSelection (copy), guiService (copy), p1 (ref), t (ref), var9 (ref), coreGuiService (copy), p2 (ref), focus (ref)
		if not var4 then
			local selectedCoreObject
			if fFlagLuaAppsDefaultSelection then
				selectedCoreObject = guiService.SelectedCoreObject
				
				if selectedCoreObject then
					for i, v in p1 do
						if selectedCoreObject == v or selectedCoreObject:IsDescendantOf(v) then
							if not var4 then
								var4 = true
								
								for i_1, v_1 in t do
									v_1:Disconnect()
								end
							end
							return
						end
					end
				end
			end
			selectedCoreObject = p1[var9]
			
			if selectedCoreObject and selectedCoreObject:IsDescendantOf(coreGuiService) then
				p2:focusGuiObject(selectedCoreObject, false)
			end
			focus(if #p1 < var9 then 1 else var9 % #p1 + 1)
		end
	end))
	
	return {
		cancel = function() --[[ line: 71 ]]
			-- upvalues: t_1 (ref), var4 (write), t (ref)
			for i, v in t_1 do
				task.cancel(v)
			end
			table.clear(t_1)
			
			if not var4 then
				var4 = true
				
				for i, v_1 in t do
					v_1:Disconnect()
				end
			end
		end
	}
end

return function(p5, p6) --[[ line: 99 ]]
	-- upvalues: reactModule (ref), focusNavigationContext (ref), var3 (ref)
	local var10 = reactModule.useContext(focusNavigationContext)
	
	return reactModule.useCallback(function() --[[ line: 102 ]]
		-- upvalues: var10 (ref), var3 (copy), p6 (ref), p5 (ref)
		return if var10 then var3(p6, p5, var10) else nil
	end, { var10, p5, p6 })
end