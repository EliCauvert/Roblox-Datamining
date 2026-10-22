local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local FFlagExpChatUseExpressionCatalogNormalizerModule = require(ChatUIPrimitives.Flags.FFlagExpChatUseExpressionCatalogNormalizer)
local NormalizeExpressionCatalogModule = require(ChatUIPrimitives.PresetChat.normalizeExpressionCatalog)
local NormalizePresetCatalogModule = require(ChatUIPrimitives.PresetChat.normalizePresetCatalog)
local PresetCatalogToExpressionCatalogModule = require(ChatUIPrimitives.PresetChat.presetCatalogToExpressionCatalog)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local CreateSignalFunction = require(ChatUIPrimitives.Parent.Signals).createSignal

return function(Callback)
	-- upvalues: CreateSignalFunction (copy), FFlagExpChatUseExpressionCatalogNormalizerModule (copy), NormalizeExpressionCatalogModule (copy), NormalizePresetCatalogModule (copy), PresetCatalogToExpressionCatalogModule (copy)
	local GameSettings = UserSettings().GameSettings
	local Disabled, Disabled2 = CreateSignalFunction("disabled")
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Count = 0
	local List = {}
	local Count1 = 0
	
	local function refresh()
		-- upvalues: Count1 (ref), Signal2_1 (copy), Callback (copy), FFlagExpChatUseExpressionCatalogNormalizerModule (upval), NormalizeExpressionCatalogModule (upval), Disabled2 (copy), Signal2 (copy), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval)
		Count1 += 1
		local Count: number = Count1
		Signal2_1(true)
		task.spawn(function()
			-- upvalues: Callback (upval), Count (copy), Count1 (upval), Signal2_1 (upval), FFlagExpChatUseExpressionCatalogNormalizerModule (upval), NormalizeExpressionCatalogModule (upval), Disabled2 (upval), Signal2 (upval), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval)
			local v1 = Callback()
			
			if Count ~= Count1 then return end
			Signal2_1(false)
			
			if FFlagExpChatUseExpressionCatalogNormalizerModule then
				local v2 = if v1 == nil then nil else NormalizeExpressionCatalogModule(v1)
				
				if v2 ~= nil then
					Disabled2(v2.status)
					Signal2(v2.categoryGroups)
					
					return
				end
				return
			else
				local v3 = if v1 == nil then nil else NormalizePresetCatalogModule(v1)
				
				if v3 ~= nil then
					local v4 = PresetCatalogToExpressionCatalogModule(v3)
					Disabled2(v4.status)
					Signal2(v4.categoryGroups)
					
					return
				end
			end
		end)
	end
	
	return {
		getStatus = Disabled,
		getCategoryGroups = Signal,
		getIsLoading = Signal1,
		acquire = function()
			-- upvalues: Count (ref), Count1 (ref), Signal2_1 (copy), Callback (copy), FFlagExpChatUseExpressionCatalogNormalizerModule (upval), NormalizeExpressionCatalogModule (upval), Disabled2 (copy), Signal2 (copy), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval), List (copy), GameSettings (copy), refresh (copy)
			Count += 1
			
			if Count == 1 then
				Count1 += 1
				local Count2: number = Count1
				Signal2_1(true)
				task.spawn(function()
					-- upvalues: Callback (upval), Count2 (copy), Count1 (upval), Signal2_1 (upval), FFlagExpChatUseExpressionCatalogNormalizerModule (upval), NormalizeExpressionCatalogModule (upval), Disabled2 (upval), Signal2 (upval), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval)
					local v1 = Callback()
					
					if Count2 ~= Count1 then return end
					Signal2_1(false)
					
					if FFlagExpChatUseExpressionCatalogNormalizerModule then
						local v2 = if v1 == nil then nil else NormalizeExpressionCatalogModule(v1)
						
						if v2 ~= nil then
							Disabled2(v2.status)
							Signal2(v2.categoryGroups)
							
							return
						end
						return
					else
						local v3 = if v1 == nil then nil else NormalizePresetCatalogModule(v1)
						
						if v3 ~= nil then
							local v4 = PresetCatalogToExpressionCatalogModule(v3)
							Disabled2(v4.status)
							Signal2(v4.categoryGroups)
							
							return
						end
					end
				end)
				table.insert(List, GameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(refresh))
				table.insert(List, GameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(refresh))
			end
		end,
		release = function()
			-- upvalues: Count (ref), List (copy), Count1 (ref), Signal2_1 (copy)
			Count -= 1
			
			if Count <= 0 then
				Count = 0
				
				for _, Connection in List do
					Connection:Disconnect()
				end
				table.clear(List)
				Count1 += 1
				Signal2_1(false)
			end
		end,
		_resetForTesting = function()
			-- upvalues: List (copy), Count (ref), Count1 (ref), Disabled2 (copy), Signal2 (copy), Signal2_1 (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
			table.clear(List)
			Count = 0
			Count1 += 1
			Disabled2("disabled")
			Signal2({})
			Signal2_1(false)
		end
	}
end