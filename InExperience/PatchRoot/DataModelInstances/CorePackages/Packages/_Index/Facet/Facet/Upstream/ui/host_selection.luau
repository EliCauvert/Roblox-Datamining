local _ = require("../vendor/compose/core")
local _ = require("./types")

return function(p1, Callback)
	local GuiService = p1.config.guiService
	local Enabled = nil
	
	local function _()
		-- upvalues: GuiService (copy), Enabled (ref)
		if GuiService == nil or Enabled == false then
			return nil
		end
		if Enabled == nil then
			Enabled = pcall(function()
				-- upvalues: GuiService (copy)
				return GuiService.SelectedCoreObject
			end)
		end
		return if Enabled then GuiService else nil
	end
	
	local _ = function(p2)
		local Success, Result = pcall(function()
			-- upvalues: p2 (copy)
			return p2.SelectedCoreObject
		end)
		
		return if Success then Result else nil
	end
	
	local _ = function(p2, SelectedCoreObject)
		-- upvalues: Enabled (ref)
		local Success = pcall(function()
			-- upvalues: p2 (copy), SelectedCoreObject (copy)
			p2.SelectedCoreObject = SelectedCoreObject
		end)
		
		if not Success then
			Enabled = false
		end
		return Success
	end
	
	local _ = function(p2): boolean
		return p2:FindFirstAncestorOfClass("CoreGui") ~= nil
	end
	
	return {
		get = function()
			-- upvalues: GuiService (copy), Enabled (ref)
			if GuiService == nil then
				return nil
			end
			local v1 = nil
			if GuiService == nil or Enabled == false then
				v1 = nil
			else
				if Enabled == nil then
					Enabled = pcall(function()
						-- upvalues: GuiService (copy)
						return GuiService.SelectedCoreObject
					end)
				end
				v1 = if Enabled then GuiService else nil
			end
			local Result1 = nil
			if v1 then
				local Success, Result = pcall(function()
					-- upvalues: v1 (copy)
					return v1.SelectedCoreObject
				end)
				Result1 = if Success then Result else nil
			else
				Result1 = nil
			end
			return Result1 or GuiService.SelectedObject
		end,
		set = function(SelectedObject)
			-- upvalues: GuiService (copy), Enabled (ref)
			if GuiService == nil then return end
			local v1 = nil
			if GuiService == nil or Enabled == false then
				v1 = nil
			else
				if Enabled == nil then
					Enabled = pcall(function()
						-- upvalues: GuiService (copy)
						return GuiService.SelectedCoreObject
					end)
				end
				v1 = if Enabled then GuiService else nil
			end
			if v1 then
				if SelectedObject == nil or SelectedObject:FindFirstAncestorOfClass("CoreGui") == nil then
					local Success, Result = pcall(function()
						-- upvalues: v1 (copy)
						return v1.SelectedCoreObject
					end)
					
					if (if Success then Result else nil) ~= nil then
						local SelectedCoreObject = nil
						local Success2 = pcall(function()
							-- upvalues: v1 (copy), SelectedCoreObject (copy)
							v1.SelectedCoreObject = SelectedCoreObject
						end)
						
						if not Success2 then
							Enabled = false
						end
						if Success2 and SelectedObject == nil then return end
					end
				else
					local Success1 = pcall(function()
						-- upvalues: v1 (copy), SelectedObject (copy)
						v1.SelectedCoreObject = SelectedObject
					end)
					
					if not Success1 then
						Enabled = false
					end
					if Success1 then return end
				end
			end
			GuiService.SelectedObject = SelectedObject
		end,
		changed = function(p2)
			-- upvalues: GuiService (copy), p1 (copy), Enabled (ref)
			if GuiService == nil then
				return function() end
			end
			local v1 = assert(p1.runtime.host.observation)
			local List = { v1.observeProperty(GuiService, "SelectedObject", p2) }
			local v2 = nil
			
			if GuiService == nil or Enabled == false then
				v2 = nil
			else
				if Enabled == nil then
					Enabled = pcall(function()
						-- upvalues: GuiService (copy)
						return GuiService.SelectedCoreObject
					end)
				end
				v2 = if Enabled then GuiService else nil
			end
			if v2 then
				local Success, Result = pcall(v1.observeProperty, GuiService, "SelectedCoreObject", p2)
				
				if Success then
					table.insert(List, Result)
				end
			end
			return function()
				-- upvalues: List (copy)
				for _, value in List do
					value()
				end
				table.clear(List)
			end
		end,
		observe = function()
			-- upvalues: GuiService (copy), p1 (copy), Callback (copy)
			return if GuiService == nil then p1.Compose.cell(nil) else Callback(GuiService)
		end
	}
end