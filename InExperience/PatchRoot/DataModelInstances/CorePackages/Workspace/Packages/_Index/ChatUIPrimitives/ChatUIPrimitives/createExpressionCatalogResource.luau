local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local _ = require(ChatUIPrimitives.UniversalMessage.Types)
local CreateSignalFunction = require(ChatUIPrimitives.Parent.Signals).createSignal
local List = {}

local function createExpressionCatalogResource(p1)
	-- upvalues: CreateSignalFunction (copy), List (copy)
	local GameSettings = UserSettings().GameSettings
	local Signal, Signal2 = CreateSignalFunction(nil)
	local Count = 0
	local List1 = {}
	local Count1 = 0
	
	local function refresh()
		-- upvalues: Count1 (ref), p1 (copy), Signal2 (copy)
		Count1 += 1
		local Count: number = Count1
		task.spawn(function()
			-- upvalues: p1 (upval), Count (copy), Count1 (upval), Signal2 (upval)
			local Success, Result = pcall(p1)
			
			if Count == Count1 and Success then
				Signal2(Result)
				
				return
			end
		end)
	end
	
	return {
		getCatalog = Signal,
		acquire = function()
			-- upvalues: Count (ref), Count1 (ref), p1 (copy), Signal2 (copy), List (upval), refresh (copy), List1 (copy), GameSettings (copy)
			Count += 1
			
			if Count <= 1 then
				Count1 += 1
				local Count2: number = Count1
				task.spawn(function()
					-- upvalues: p1 (upval), Count2 (copy), Count1 (upval), Signal2 (upval)
					local Success, Result = pcall(p1)
					
					if Count2 == Count1 and Success then
						Signal2(Result)
						
						return
					end
				end)
				table.insert(List, refresh)
				table.insert(List1, GameSettings:GetPropertyChangedSignal("ChatTranslationLocale"):Connect(refresh))
				table.insert(List1, GameSettings:GetPropertyChangedSignal("ChatTranslationEnabled"):Connect(refresh))
				
				return
			end
		end,
		release = function()
			-- upvalues: Count (ref), List1 (copy), List (upval), refresh (copy), Count1 (ref)
			if Count == 0 then return end
			Count -= 1
			
			if Count > 0 then return end
			for _, Connection in List1 do
				Connection:Disconnect()
			end
			table.clear(List1)
			local FoundIndex: number? = table.find(List, refresh)
			
			if FoundIndex ~= nil then
				table.remove(List, FoundIndex)
			end
			Count1 += 1
		end
	}
end

return (setmetatable({
	_notifySettingsChangedForTesting = function()
		-- upvalues: List (copy)
		for _, value in table.clone(List) do
			value()
		end
	end
}, {
	__call = function(_, p2)
		-- upvalues: createExpressionCatalogResource (copy)
		return (createExpressionCatalogResource(p2))
	end
}))