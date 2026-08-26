local textChatService = game:GetService("TextChatService")
local gameSettings = UserSettings().GameSettings
local expChat = script:FindFirstAncestor("ExpChat")
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local initializePresetChat = require(expChat.Parent.ExpChatShared).Logger:new("ExpChat/PresetChat/initializePresetChat")

local function _(value, p1)
	-- upvalues: textChatService (ref), initializePresetChat (ref)
	task.spawn(function()
		-- upvalues: textChatService (copy), p1 (ref), initializePresetChat (copy), value (ref)
		local ok, status = pcall(function()
			-- upvalues: textChatService (copy)
			return textChatService:GetPresetsAsync()
		end)
		
		if p1 then
			if not ok then
				initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
			end
			return
		elseif not ok then
			initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
			value.setIsLoading(false)
			
			return
		elseif not status then
			value.setIsLoading(false)
			
			return
		end
		local accessLevel = status.accessLevel or "Disabled"
		value.setAccessLevel(accessLevel)
		
		if accessLevel ~= "Disabled" then
			local version = status.version
			
			if not version or version == "" then
				initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
				value.setAccessLevel("Disabled")
				value.setIsLoading(false)
				
				return
			end
			local categoryGroups = status.categoryGroups
			
			if categoryGroups and #categoryGroups > 0 then
				value.setCategoryGroups(categoryGroups)
				value.setVersion(version)
				value.setIsEnabled(true)
			end
		end
		value.setIsLoading(false)
	end)
end

return function(value, p1)
	-- upvalues: textChatService (ref), initializePresetChat (ref), gameSettings (ref)
	task.spawn(function()
		-- upvalues: textChatService (copy), p1 (ref), initializePresetChat (copy), value (ref)
		local ok, status = pcall(function()
			-- upvalues: textChatService (copy)
			return textChatService:GetPresetsAsync()
		end)
		
		if p1 then
			if not ok then
				initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
			end
			return
		elseif not ok then
			initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
			value.setIsLoading(false)
			
			return
		elseif not status then
			value.setIsLoading(false)
			
			return
		end
		local accessLevel = status.accessLevel or "Disabled"
		value.setAccessLevel(accessLevel)
		
		if accessLevel ~= "Disabled" then
			local version = status.version
			
			if not version or version == "" then
				initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
				value.setAccessLevel("Disabled")
				value.setIsLoading(false)
				
				return
			end
			local categoryGroups = status.categoryGroups
			
			if categoryGroups and #categoryGroups > 0 then
				value.setCategoryGroups(categoryGroups)
				value.setVersion(version)
				value.setIsEnabled(true)
			end
		end
		value.setIsLoading(false)
	end)
	gameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(function()
		-- upvalues: p1 (ref), value (ref), textChatService (copy), initializePresetChat (copy)
		if not p1 then
			value.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: textChatService (copy), p1 (ref), initializePresetChat (copy), value (ref)
			local ok, status = pcall(function()
				-- upvalues: textChatService (copy)
				return textChatService:GetPresetsAsync()
			end)
			
			if p1 then
				if not ok then
					initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
				end
				return
			elseif not ok then
				initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
				value.setIsLoading(false)
				
				return
			elseif not status then
				value.setIsLoading(false)
				
				return
			end
			local accessLevel = status.accessLevel or "Disabled"
			value.setAccessLevel(accessLevel)
			
			if accessLevel ~= "Disabled" then
				local version = status.version
				
				if not version or version == "" then
					initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					value.setAccessLevel("Disabled")
					value.setIsLoading(false)
					
					return
				end
				local categoryGroups = status.categoryGroups
				
				if categoryGroups and #categoryGroups > 0 then
					value.setCategoryGroups(categoryGroups)
					value.setVersion(version)
					value.setIsEnabled(true)
				end
			end
			value.setIsLoading(false)
		end)
	end)
	gameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(function()
		-- upvalues: p1 (ref), value (ref), textChatService (copy), initializePresetChat (copy)
		if not p1 then
			value.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: textChatService (copy), p1 (ref), initializePresetChat (copy), value (ref)
			local ok, status = pcall(function()
				-- upvalues: textChatService (copy)
				return textChatService:GetPresetsAsync()
			end)
			
			if p1 then
				if not ok then
					initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
				end
				return
			elseif not ok then
				initializePresetChat:warning("GetPresetsAsync failed: {}", tostring(status))
				value.setIsLoading(false)
				
				return
			elseif not status then
				value.setIsLoading(false)
				
				return
			end
			local accessLevel = status.accessLevel or "Disabled"
			value.setAccessLevel(accessLevel)
			
			if accessLevel ~= "Disabled" then
				local version = status.version
				
				if not version or version == "" then
					initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					value.setAccessLevel("Disabled")
					value.setIsLoading(false)
					
					return
				end
				local categoryGroups = status.categoryGroups
				
				if categoryGroups and #categoryGroups > 0 then
					value.setCategoryGroups(categoryGroups)
					value.setVersion(version)
					value.setIsEnabled(true)
				end
			end
			value.setIsLoading(false)
		end)
	end)
end