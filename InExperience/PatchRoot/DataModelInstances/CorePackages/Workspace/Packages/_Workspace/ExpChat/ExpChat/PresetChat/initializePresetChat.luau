local textChatService = game:GetService("TextChatService")
local gameSettings = UserSettings().GameSettings
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local initializePresetChat = expChatSharedModule.Logger:new("ExpChat/PresetChat/initializePresetChat")

local function getPresetsFromEngine()
	-- upvalues: textChatService (ref)
	return textChatService:GetPresetsAsync()
end

local function _(value, p1, p2)
	-- upvalues: initializePresetChat (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref)
	task.spawn(function()
		-- upvalues: p2 (ref), p1 (ref), initializePresetChat (copy), value (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		local ok, status = pcall(p2)
		
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
		local var1 = (if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then status.status else status.accessLevel) or "Disabled"
		value.setAccessLevel(var1)
		
		if var1 ~= "Disabled" then
			local version = status.version
			
			if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not version or version == "") then
				initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
				value.setAccessLevel("Disabled")
				value.setIsLoading(false)
				
				return
			end
			local categoryGroups = status.categoryGroups
			
			if categoryGroups and #categoryGroups > 0 then
				value.setCategoryGroups(categoryGroups)
				value.setVersion(version or "")
				value.setIsEnabled(true)
			end
		end
		value.setIsLoading(false)
	end)
end

return function(value, p1, p2)
	-- upvalues: getPresetsFromEngine (ref), initializePresetChat (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref), gameSettings (ref)
	p2 = p2 or getPresetsFromEngine
	task.spawn(function()
		-- upvalues: p2 (ref), p1 (ref), initializePresetChat (copy), value (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		local ok, status = pcall(p2)
		
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
		local var1 = (if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then status.status else status.accessLevel) or "Disabled"
		value.setAccessLevel(var1)
		
		if var1 ~= "Disabled" then
			local version = status.version
			
			if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not version or version == "") then
				initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
				value.setAccessLevel("Disabled")
				value.setIsLoading(false)
				
				return
			end
			local categoryGroups = status.categoryGroups
			
			if categoryGroups and #categoryGroups > 0 then
				value.setCategoryGroups(categoryGroups)
				value.setVersion(version or "")
				value.setIsEnabled(true)
			end
		end
		value.setIsLoading(false)
	end)
	gameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(function()
		-- upvalues: p1 (ref), value (ref), p2 (ref), initializePresetChat (copy), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		if not p1 then
			value.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: p2 (ref), p1 (ref), initializePresetChat (copy), value (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
			local ok, status = pcall(p2)
			
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
			local var1 = (if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then status.status else status.accessLevel) or "Disabled"
			value.setAccessLevel(var1)
			
			if var1 ~= "Disabled" then
				local version = status.version
				
				if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not version or version == "") then
					initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					value.setAccessLevel("Disabled")
					value.setIsLoading(false)
					
					return
				end
				local categoryGroups = status.categoryGroups
				
				if categoryGroups and #categoryGroups > 0 then
					value.setCategoryGroups(categoryGroups)
					value.setVersion(version or "")
					value.setIsEnabled(true)
				end
			end
			value.setIsLoading(false)
		end)
	end)
	gameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(function()
		-- upvalues: p1 (ref), value (ref), p2 (ref), initializePresetChat (copy), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
		if not p1 then
			value.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: p2 (ref), p1 (ref), initializePresetChat (copy), value (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
			local ok, status = pcall(p2)
			
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
			local var1 = (if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then status.status else status.accessLevel) or "Disabled"
			value.setAccessLevel(var1)
			
			if var1 ~= "Disabled" then
				local version = status.version
				
				if not engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not version or version == "") then
					initializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					value.setAccessLevel("Disabled")
					value.setIsLoading(false)
					
					return
				end
				local categoryGroups = status.categoryGroups
				
				if categoryGroups and #categoryGroups > 0 then
					value.setCategoryGroups(categoryGroups)
					value.setVersion(version or "")
					value.setIsEnabled(true)
				end
			end
			value.setIsLoading(false)
		end)
	end)
end