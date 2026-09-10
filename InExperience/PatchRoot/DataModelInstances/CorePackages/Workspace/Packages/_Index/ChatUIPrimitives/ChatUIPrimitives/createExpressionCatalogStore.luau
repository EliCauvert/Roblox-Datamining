local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local signalsModule = require(chatUIPrimitives.Parent.Signals)
local normalizePresetCatalogModule = require(chatUIPrimitives.PresetChat.normalizePresetCatalog)
local presetCatalogToExpressionCatalogModule = require(chatUIPrimitives.PresetChat.presetCatalogToExpressionCatalog)
local _ = require(chatUIPrimitives.UniversalMessage.Types)
local createSignal = signalsModule.createSignal

return function(p1)
	-- upvalues: createSignal (ref), normalizePresetCatalogModule (ref), presetCatalogToExpressionCatalogModule (ref)
	local gameSettings = UserSettings().GameSettings
	local var1, var2 = createSignal("disabled")
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal(false)
	local var7 = 0
	local t = {}
	local var8 = 0
	
	local function refresh()
		-- upvalues: var8 (write), var6 (ref), p1 (ref), normalizePresetCatalogModule (copy), presetCatalogToExpressionCatalogModule (copy), var2 (ref), var4 (ref)
		var8 += 1
		local var9 = var8
		var6(true)
		task.spawn(function()
			-- upvalues: p1 (copy), var9 (ref), var8 (copy), var6 (copy), normalizePresetCatalogModule (copy), presetCatalogToExpressionCatalogModule (copy), var2 (copy), var4 (copy)
			local var10 = p1()
			
			if var9 ~= var8 then return end
			var6(false)
			local var11 = if var10 ~= nil then nil else normalizePresetCatalogModule(var10)
			
			if var11 == nil then
				return
			end
			local var12 = presetCatalogToExpressionCatalogModule(var11)
			var2(var12.status)
			var4(var12.categoryGroups)
		end)
	end
	
	return {
		getStatus = var1,
		getCategoryGroups = var3,
		getIsLoading = var5,
		acquire = function()
			-- upvalues: var7 (write), var8 (write), var6 (ref), p1 (ref), normalizePresetCatalogModule (copy), presetCatalogToExpressionCatalogModule (copy), var2 (ref), var4 (ref), t (ref), gameSettings (ref), refresh (ref)
			var7 += 1
			
			if var7 == 1 then
				var8 += 1
				local var9 = var8
				var6(true)
				task.spawn(function()
					-- upvalues: p1 (copy), var9 (ref), var8 (copy), var6 (copy), normalizePresetCatalogModule (copy), presetCatalogToExpressionCatalogModule (copy), var2 (copy), var4 (copy)
					local var10 = p1()
					
					if var9 ~= var8 then return end
					var6(false)
					local var11 = if var10 ~= nil then nil else normalizePresetCatalogModule(var10)
					
					if var11 == nil then
						return
					end
					local var12 = presetCatalogToExpressionCatalogModule(var11)
					var2(var12.status)
					var4(var12.categoryGroups)
				end)
				table.insert(t, gameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(refresh))
				table.insert(t, gameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(refresh))
			end
		end,
		release = function()
			-- upvalues: var7 (write), t (ref), var8 (write), var6 (ref)
			var7 -= 1
			
			if var7 <= 0 then
				var7 = 0
				
				for i, v in t do
					v:Disconnect()
				end
				table.clear(t)
				var8 += 1
				var6(false)
			end
		end,
		_resetForTesting = function()
			-- upvalues: t (ref), var7 (write), var8 (write), var2 (ref), var4 (ref), var6 (ref)
			for i, v in t do
				v:Disconnect()
			end
			table.clear(t)
			var7 = 0
			var8 += 1
			var2("disabled")
			var4({})
			var6(false)
		end
	}
end