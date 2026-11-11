local TextChatService = game:GetService("TextChatService")
local GameSettings = UserSettings().GameSettings
local ExpChat = script:FindFirstAncestor("ExpChat")
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local InitializePresetChat = require(ExpChat.Parent.ExpChatShared).Logger:new("ExpChat/PresetChat/initializePresetChat")

local function _(p1, p2)
	-- upvalues: TextChatService (copy), InitializePresetChat (copy)
	task.spawn(function()
		-- upvalues: TextChatService (upval), p2 (copy), InitializePresetChat (upval), p1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: TextChatService (upval)
			return TextChatService:GetPresetsAsync()
		end)
		
		if not p2 then
			if not Success then
				InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
				p1.setIsLoading(false)
				
				return
			end
			if not Result then
				p1.setIsLoading(false)
				
				return
			end
			local AccessLevel = Result.accessLevel or "Disabled"
			p1.setAccessLevel(AccessLevel)
			
			if AccessLevel ~= "Disabled" then
				local Version = Result.version
				
				if not Version or Version == "" then
					InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					p1.setAccessLevel("Disabled")
					p1.setIsLoading(false)
					
					return
				end
				local CategoryGroups = Result.categoryGroups
				
				if CategoryGroups and #CategoryGroups > 0 then
					p1.setCategoryGroups(CategoryGroups)
					p1.setVersion(Version)
					p1.setIsEnabled(true)
				end
			end
			p1.setIsLoading(false)
			
			return
		elseif not Success then
			InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
		end
	end)
end

return function(p1, p2)
	-- upvalues: TextChatService (copy), InitializePresetChat (copy), GameSettings (copy)
	task.spawn(function()
		-- upvalues: TextChatService (upval), p2 (copy), InitializePresetChat (upval), p1 (copy)
		local Success, Result = pcall(function()
			-- upvalues: TextChatService (upval)
			return TextChatService:GetPresetsAsync()
		end)
		
		if not p2 then
			if not Success then
				InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
				p1.setIsLoading(false)
				
				return
			end
			if not Result then
				p1.setIsLoading(false)
				
				return
			end
			local AccessLevel = Result.accessLevel or "Disabled"
			p1.setAccessLevel(AccessLevel)
			
			if AccessLevel ~= "Disabled" then
				local Version = Result.version
				
				if not Version or Version == "" then
					InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					p1.setAccessLevel("Disabled")
					p1.setIsLoading(false)
					
					return
				end
				local CategoryGroups = Result.categoryGroups
				
				if CategoryGroups and #CategoryGroups > 0 then
					p1.setCategoryGroups(CategoryGroups)
					p1.setVersion(Version)
					p1.setIsEnabled(true)
				end
			end
			p1.setIsLoading(false)
			
			return
		elseif not Success then
			InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
		end
	end)
	GameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(function()
		-- upvalues: p2 (copy), p1 (copy), TextChatService (upval), InitializePresetChat (upval)
		if not p2 then
			p1.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: TextChatService (upval), p2 (copy), InitializePresetChat (upval), p1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: TextChatService (upval)
				return TextChatService:GetPresetsAsync()
			end)
			
			if not p2 then
				if not Success then
					InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
					p1.setIsLoading(false)
					
					return
				end
				if not Result then
					p1.setIsLoading(false)
					
					return
				end
				local AccessLevel = Result.accessLevel or "Disabled"
				p1.setAccessLevel(AccessLevel)
				
				if AccessLevel ~= "Disabled" then
					local Version = Result.version
					
					if not Version or Version == "" then
						InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
						p1.setAccessLevel("Disabled")
						p1.setIsLoading(false)
						
						return
					end
					local CategoryGroups = Result.categoryGroups
					
					if CategoryGroups and #CategoryGroups > 0 then
						p1.setCategoryGroups(CategoryGroups)
						p1.setVersion(Version)
						p1.setIsEnabled(true)
					end
				end
				p1.setIsLoading(false)
				
				return
			elseif not Success then
				InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
			end
		end)
	end)
	GameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(function()
		-- upvalues: p2 (copy), p1 (copy), TextChatService (upval), InitializePresetChat (upval)
		if not p2 then
			p1.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: TextChatService (upval), p2 (copy), InitializePresetChat (upval), p1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: TextChatService (upval)
				return TextChatService:GetPresetsAsync()
			end)
			
			if not p2 then
				if not Success then
					InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
					p1.setIsLoading(false)
					
					return
				end
				if not Result then
					p1.setIsLoading(false)
					
					return
				end
				local AccessLevel = Result.accessLevel or "Disabled"
				p1.setAccessLevel(AccessLevel)
				
				if AccessLevel ~= "Disabled" then
					local Version = Result.version
					
					if not Version or Version == "" then
						InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
						p1.setAccessLevel("Disabled")
						p1.setIsLoading(false)
						
						return
					end
					local CategoryGroups = Result.categoryGroups
					
					if CategoryGroups and #CategoryGroups > 0 then
						p1.setCategoryGroups(CategoryGroups)
						p1.setVersion(Version)
						p1.setIsEnabled(true)
					end
				end
				p1.setIsLoading(false)
				
				return
			elseif not Success then
				InitializePresetChat:warning("GetPresetsAsync failed: {}", (tostring(Result)))
			end
		end)
	end)
end