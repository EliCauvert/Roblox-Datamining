local TextChatService = game:GetService("TextChatService")
local GameSettings = UserSettings().GameSettings
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local InitializePresetChat = require(Parent.ExpChatShared).Logger:new("ExpChat/PresetChat/initializePresetChat")

local function getPresetsFromEngine()
	-- upvalues: TextChatService (copy)
	return TextChatService:GetPresetsAsync()
end

local function _(p1, p2, p3)
	-- upvalues: InitializePresetChat (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy)
	task.spawn(function()
		-- upvalues: p3 (copy), p2 (copy), InitializePresetChat (upval), p1 (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
		local Success, Result = pcall(p3)
		
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
			local Status = (if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then Result.status else Result.accessLevel) or "Disabled"
			p1.setAccessLevel(Status)
			
			if Status ~= "Disabled" then
				local Version = Result.version
				
				if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not Version or Version == "") then
					InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					p1.setAccessLevel("Disabled")
					p1.setIsLoading(false)
					
					return
				end
				local CategoryGroups = Result.categoryGroups
				
				if CategoryGroups and #CategoryGroups > 0 then
					p1.setCategoryGroups(CategoryGroups)
					p1.setVersion(Version or "")
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

return function(p1, p2, p3)
	-- upvalues: getPresetsFromEngine (copy), InitializePresetChat (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), GameSettings (copy)
	local P5 = p3 or getPresetsFromEngine
	task.spawn(function()
		-- upvalues: P5 (copy), p2 (copy), InitializePresetChat (upval), p1 (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
		local Success, Result = pcall(P5)
		
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
			local Status = (if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then Result.status else Result.accessLevel) or "Disabled"
			p1.setAccessLevel(Status)
			
			if Status ~= "Disabled" then
				local Version = Result.version
				
				if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not Version or Version == "") then
					InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
					p1.setAccessLevel("Disabled")
					p1.setIsLoading(false)
					
					return
				end
				local CategoryGroups = Result.categoryGroups
				
				if CategoryGroups and #CategoryGroups > 0 then
					p1.setCategoryGroups(CategoryGroups)
					p1.setVersion(Version or "")
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
		-- upvalues: p2 (copy), p1 (copy), P5 (copy), InitializePresetChat (upval), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
		if not p2 then
			p1.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: P5 (copy), p2 (copy), InitializePresetChat (upval), p1 (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
			local Success, Result = pcall(P5)
			
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
				local Status = (if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then Result.status else Result.accessLevel) or "Disabled"
				p1.setAccessLevel(Status)
				
				if Status ~= "Disabled" then
					local Version = Result.version
					
					if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not Version or Version == "") then
						InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
						p1.setAccessLevel("Disabled")
						p1.setIsLoading(false)
						
						return
					end
					local CategoryGroups = Result.categoryGroups
					
					if CategoryGroups and #CategoryGroups > 0 then
						p1.setCategoryGroups(CategoryGroups)
						p1.setVersion(Version or "")
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
		-- upvalues: p2 (copy), p1 (copy), P5 (copy), InitializePresetChat (upval), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
		if not p2 then
			p1.setIsLoading(true)
		end
		task.spawn(function()
			-- upvalues: P5 (copy), p2 (copy), InitializePresetChat (upval), p1 (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (upval)
			local Success, Result = pcall(P5)
			
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
				local Status = (if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then Result.status else Result.accessLevel) or "Disabled"
				p1.setAccessLevel(Status)
				
				if Status ~= "Disabled" then
					local Version = Result.version
					
					if not EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and (not Version or Version == "") then
						InitializePresetChat:warning("Missing version in GetPresetsAsync response, treating as disabled")
						p1.setAccessLevel("Disabled")
						p1.setIsLoading(false)
						
						return
					end
					local CategoryGroups = Result.categoryGroups
					
					if CategoryGroups and #CategoryGroups > 0 then
						p1.setCategoryGroups(CategoryGroups)
						p1.setVersion(Version or "")
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