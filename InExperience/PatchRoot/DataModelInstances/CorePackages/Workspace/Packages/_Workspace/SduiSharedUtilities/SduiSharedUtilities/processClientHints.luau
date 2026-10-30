local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local SduiGameIconPrewarmModule = require(SduiSharedUtilities.SduiGameIconPrewarm)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)
local config = {
	prewarm_icon = SduiGameIconPrewarmModule.prewarmSmallIcons,
	prewarm_large_icon = SduiGameIconPrewarmModule.prewarmLargeIcons
}

local function collectHintsInTemplateTree(Key, Callback, p1, p2)
	-- upvalues: collectHintsInTemplateTree (copy)
	if type(Key) ~= "table" then return end
	for i, value in Key do
		if i == "client_hints" and type(value) == "table" then
			for _, value1 in value do
				if type(value1) == "string" then
					p1[value1] = true
				end
			end
		else
			if i == "roblox_component" and type(value) == "string" and value ~= "" then
				local v1 = p2[value]
				local CallbackResult = nil
				
				if not v1 then
					p2[value] = true
					CallbackResult = Callback(value)
					v1 = CallbackResult == nil
				end
				if not v1 then
					collectHintsInTemplateTree(CallbackResult, Callback, p1, p2)
				end
			elseif type(value) == "table" then
				collectHintsInTemplateTree(value, Callback, p1, p2)
			end
		end
	end
end

local self = setmetatable({}, { __mode = "k" })

local function getHintsDeclaredBy(Key, GetTemplateForRobloxComponent)
	-- upvalues: self (copy), collectHintsInTemplateTree (copy)
	if Key == nil then
		return {}
	end
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		local t = {}
		collectHintsInTemplateTree(Key, GetTemplateForRobloxComponent, t, {})
		self[Key] = t
		
		return t
	else
		return SelfEntry
	end
end

local function _(p3, p4): boolean
	-- upvalues: getHintsDeclaredBy (copy), config (copy)
	for i in getHintsDeclaredBy(p3, p4) do
		if config[i] then
			return true
		end
	end
	return false
end

local _ = function(p5, p6): boolean
	-- upvalues: getHintsDeclaredBy (copy), config (copy)
	local Flag = nil
	for _, value in p5.getKnownTemplates() do
		Flag = false
		
		for i in getHintsDeclaredBy(value, p6) do
			if config[i] then
				Flag = true
				break
			end
		end
		if Flag then
			return true
		end
	end
	return false
end

local _ = function(p7, Key, p8)
	local List = p7[Key]
	
	if List == nil then
		List = {}
		p7[Key] = List
	end
	table.insert(List, p8)
end

local function attributeHintsInInputData(ComponentInputData, Callback, Tbl, p7)
	-- upvalues: getHintsDeclaredBy (copy), config (copy), attributeHintsInInputData (copy)
	if type(ComponentInputData) ~= "table" then return end
	local Tbl1 = Tbl
	local RobloxComponent = ComponentInputData.roblox_component
	local CallbackResult = if type(RobloxComponent) == "string" and RobloxComponent ~= "" then Callback(RobloxComponent) else nil
	
	if CallbackResult ~= nil then
		for i in getHintsDeclaredBy(CallbackResult, Callback) do
			if config[i] and not Tbl1[i] then
				if Tbl1 == Tbl then
					Tbl1 = table.clone(Tbl)
				end
				Tbl1[i] = true
				local List = p7[i]
				
				if List == nil then
					List = {}
					p7[i] = List
				end
				table.insert(List, ComponentInputData)
			end
		end
	end
	for _, value in ComponentInputData do
		if type(value) == "table" then
			attributeHintsInInputData(value, Callback, Tbl1, p7)
		end
	end
end

return function(p8)
	-- upvalues: getHintsDeclaredBy (copy), config (copy), attributeHintsInInputData (copy)
	local GetTemplateForRobloxComponentFunction = p8.getTemplateForRobloxComponent
	
	if GetTemplateForRobloxComponentFunction == nil then return end
	local Flag = false
	local Flag1 = nil
	
	for _, value in p8.getKnownTemplates() do
		Flag1 = false
		
		for i in getHintsDeclaredBy(value, GetTemplateForRobloxComponentFunction) do
			if config[i] then
				Flag1 = true
				break
			end
		end
		if Flag1 then
			Flag = true
			break
		end
	end
	if not Flag then return end
	local t = {}
	
	for _, pageEntry in p8.pageEntries do
		local RobloxComponentType = pageEntry.robloxComponentType
		local ComponentInputData = pageEntry.componentInputData
		
		if RobloxComponentType and ComponentInputData then
			local t1 = {}
			local TemplateForRobloxComponent = GetTemplateForRobloxComponentFunction(RobloxComponentType)
			
			if TemplateForRobloxComponent ~= nil then
				for i1 in getHintsDeclaredBy(TemplateForRobloxComponent, GetTemplateForRobloxComponentFunction) do
					if config[i1] then
						t1[i1] = true
						local List = t[i1]
						
						if List == nil then
							List = {}
							t[i1] = List
						end
						table.insert(List, ComponentInputData)
					end
				end
			end
			attributeHintsInInputData(ComponentInputData, GetTemplateForRobloxComponentFunction, t1, t)
		end
	end
	for i2, value1 in t do
		config[i2](value1)
	end
end