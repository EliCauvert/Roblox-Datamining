local _ = require("../vendor/compose/core")
local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

local function _(p1, Key)
	-- upvalues: self (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		local config = {
			touches = 0,
			suspensions = 0,
			before = true,
			suspended = p1.Compose.cell(false)
		}
		self[Key] = config
		
		return config
	else
		return SelfEntry
	end
end

return {
	hold = function(p1, Key, p2)
		-- upvalues: self (copy)
		if Key == nil then
			return function() end
		end
		local SelfEntry = self[Key]
		local config1 = nil
		
		if SelfEntry == nil then
			local config = {
				touches = 0,
				suspensions = 0,
				before = true,
				suspended = p1.Compose.cell(false)
			}
			self[Key] = config
			config1 = config
		else
			config1 = SelfEntry
		end
		if config1.touches == 0 then
			config1.before = Key.TouchControlsEnabled
			config1.watch = Key:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
				-- upvalues: Key (copy), config1 (copy)
				if Key.TouchControlsEnabled and config1.touches > 0 then
					config1.before = true
					Key.TouchControlsEnabled = false
				end
			end)
		end
		config1.touches += 1
		
		if Key.TouchControlsEnabled ~= false then
			Key.TouchControlsEnabled = false
		end
		if p2 then
			config1.suspensions += 1
			config1.suspended:set(true)
		end
		local Flag = false
		
		return function()
			-- upvalues: Flag (ref), p2 (copy), config1 (copy), Key (copy)
			if Flag then return end
			Flag = true
			
			if p2 then
				config1.suspensions -= 1
				
				if config1.suspensions == 0 then
					config1.suspended:set(false)
				end
			end
			config1.touches -= 1
			
			if config1.touches == 0 then
				if config1.watch then
					config1.watch:Disconnect()
					config1.watch = nil
				end
				if Key.TouchControlsEnabled ~= config1.before then
					Key.TouchControlsEnabled = config1.before
				end
			end
		end
	end,
	suspended = function(p1)
		-- upvalues: self (copy)
		local GuiService = p1.config.guiService
		local Suspended = nil
		
		if GuiService then
			local SelfEntry = self[GuiService]
			local config1 = nil
			
			if SelfEntry == nil then
				local config = {
					touches = 0,
					suspensions = 0,
					before = true,
					suspended = p1.Compose.cell(false)
				}
				self[GuiService] = config
				config1 = config
			else
				config1 = SelfEntry
			end
			Suspended = config1.suspended
		else
			Suspended = nil
		end
		return p1.Compose.formula(function(Callback)
			-- upvalues: Suspended (copy)
			return if Suspended then Callback(Suspended) else false
		end)
	end
}