local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local NormalizePresetCatalogModule = require(ChatUIPrimitives.PresetChat.normalizePresetCatalog)
local PresetCatalogToExpressionCatalogModule = require(ChatUIPrimitives.PresetChat.presetCatalogToExpressionCatalog)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local CreateSignalFunction = require(ChatUIPrimitives.Parent.Signals).createSignal

return function(Callback) --[[ Line: 38 | Named "createExpressionCatalogStore" ]]
	-- upvalues: CreateSignalFunction (copy), NormalizePresetCatalogModule (copy), PresetCatalogToExpressionCatalogModule (copy)
	local GameSettings = UserSettings().GameSettings
	local Disabled, Disabled2 = CreateSignalFunction("disabled")
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Count = 0
	local List = {}
	local Count1 = 0
	
	local function refresh() --[[ Line: 53 ]]
		-- upvalues: Count1 (ref), Signal2_1 (copy), Callback (copy), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval), Disabled2 (copy), Signal2 (copy)
		Count1 += 1
		local Count: number = Count1
		Signal2_1(true)
		task.spawn(function() --[[ Line: 57 ]]
			-- upvalues: Callback (upval), Count (copy), Count1 (upval), Signal2_1 (upval), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval), Disabled2 (upval), Signal2 (upval)
			local v1 = Callback()
			
			if Count ~= Count1 then return end
			Signal2_1(false)
			local v2 = if v1 == nil then nil else NormalizePresetCatalogModule(v1)
			
			if v2 ~= nil then
				local v3 = PresetCatalogToExpressionCatalogModule(v2)
				Disabled2(v3.status)
				Signal2(v3.categoryGroups)
				
				return
			end
		end)
	end
	
	return {
		getStatus = Disabled,
		getCategoryGroups = Signal,
		getIsLoading = Signal1,
		acquire = function() --[[ Line: 75 ]]
			-- upvalues: Count (ref), Count1 (ref), Signal2_1 (copy), Callback (copy), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval), Disabled2 (copy), Signal2 (copy), List (copy), GameSettings (copy), refresh (copy)
			Count += 1
			
			if Count == 1 then
				Count1 += 1
				local Count2: number = Count1
				Signal2_1(true)
				task.spawn(function() --[[ Line: 57 ]]
					-- upvalues: Callback (upval), Count2 (copy), Count1 (upval), Signal2_1 (upval), NormalizePresetCatalogModule (upval), PresetCatalogToExpressionCatalogModule (upval), Disabled2 (upval), Signal2 (upval)
					local v1 = Callback()
					
					if Count2 ~= Count1 then return end
					Signal2_1(false)
					local v2 = if v1 == nil then nil else NormalizePresetCatalogModule(v1)
					
					if v2 ~= nil then
						local v3 = PresetCatalogToExpressionCatalogModule(v2)
						Disabled2(v3.status)
						Signal2(v3.categoryGroups)
						
						return
					end
				end)
				table.insert(List, GameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(refresh))
				table.insert(List, GameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(refresh))
			end
		end,
		release = function() --[[ Line: 90 ]]
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
		_resetForTesting = function() --[[ Line: 108 ]]
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