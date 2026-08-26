local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local sduiGameIconPrewarmModule = require(sduiSharedUtilities.SduiGameIconPrewarm)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)
local _ = {
	PrewarmIcon = "prewarm_icon",
	PrewarmLargeIcon = "prewarm_large_icon"
}
local t = {
	prewarm_icon = sduiGameIconPrewarmModule.prewarmSmallIcons,
	prewarm_large_icon = sduiGameIconPrewarmModule.prewarmLargeIcons
}

local function collectHintsInTemplateTree(p1, p2, p3, p4)
	-- upvalues: collectHintsInTemplateTree (ref)
	if type(p1) ~= "table" then return end
	for i, v in p1 do
		if i ~= "client_hints" or type(v) ~= "table" then
			if i == "roblox_component" and type(v) == "string" and v ~= "" then
				if not p4[v] then
					p4[v] = true
					local var1 = p2(v)
					
					if var1 ~= nil then
						collectHintsInTemplateTree(var1, p2, p3, p4)
					end
				end
			elseif type(v) == "table" then
				collectHintsInTemplateTree(v, p2, p3, p4)
			end
		end
		for i_1, v_1 in v do
			if type(v_1) == "string" then
				p3[v_1] = true
			end
		end
	end
end

local tbl = setmetatable({}, { __mode = "k" })

local function getHintsDeclaredBy(p5, p6)
	-- upvalues: tbl (ref), collectHintsInTemplateTree (ref)
	if p5 == nil then
		return {}
	end
	local var2 = tbl[p5]
	
	if var2 == nil then
		local t = {}
		collectHintsInTemplateTree(p5, p6, t, {})
		tbl[p5] = t
		
		return t
	end
	return var2
end

local function _(p5, p6)
	-- upvalues: getHintsDeclaredBy (ref), t (ref)
	for i in getHintsDeclaredBy(p5, p6) do
		if t[i] then
			return true
		end
	end
	return false
end

local _ = function(p7, p8)
	-- upvalues: getHintsDeclaredBy (ref), t (ref)
	for i, v in p7.getKnownTemplates() do
		local var2
		for i_1 in getHintsDeclaredBy(v, p8) do
			if t[i_1] then
				var2 = true
				if var2 then
					return true
				end
			end
		end
		var2 = false
	end
	return false
end

local _ = function(p9, p10, p11)
	local var3 = p9[p10]
	
	if var3 == nil then
		var3 = {}
		p9[p10] = var3
	end
	table.insert(var3, p11)
end

local function attributeHintsInInputData(p9, p10, p11, p12)
	-- upvalues: getHintsDeclaredBy (ref), t (ref), attributeHintsInInputData (ref)
	if type(p9) ~= "table" then return end
	local var3 = p11
	local robloxComponent = p9.roblox_component
	local var4 = if type(robloxComponent) == "string" and robloxComponent ~= "" then p10(robloxComponent) else nil
	
	if var4 ~= nil then
		for i in getHintsDeclaredBy(var4, p10) do
			if t[i] and not var3[i] then
				if var3 == p11 then
					var3 = table.clone(p11)
				end
				var3[i] = true
				local var5 = p12[i]
				
				if var5 == nil then
					var5 = {}
					p12[i] = var5
				end
				table.insert(var5, p9)
			end
		end
	end
	for i, v in p9 do
		if type(v) == "table" then
			attributeHintsInInputData(v, p10, var3, p12)
		end
	end
end

return function(p13)
	-- upvalues: getHintsDeclaredBy (ref), t (ref), attributeHintsInInputData (ref)
	local getTemplateForRobloxComponent = p13.getTemplateForRobloxComponent
	
	if getTemplateForRobloxComponent == nil then return end
	local var6
	for i, v in p13.getKnownTemplates() do
		local var7
		for i_1 in getHintsDeclaredBy(v, getTemplateForRobloxComponent) do
			if t[i_1] then
				var7 = true
				if var7 then
					var6 = true
					if not var6 then return end
					local t_1 = {}
					
					for i_1, v_1 in p13.pageEntries do
						local robloxComponentType = v_1.robloxComponentType
						local componentInputData = v_1.componentInputData
						
						if robloxComponentType and componentInputData then
							local t_2 = {}
							local var8 = getTemplateForRobloxComponent(robloxComponentType)
							
							if var8 ~= nil then
								for i_2 in getHintsDeclaredBy(var8, getTemplateForRobloxComponent) do
									if t[i_2] then
										t_2[i_2] = true
										local var9 = t_1[i_2]
										
										if var9 == nil then
											var9 = {}
											t_1[i_2] = var9
										end
										table.insert(var9, componentInputData)
									end
								end
							end
							attributeHintsInInputData(componentInputData, getTemplateForRobloxComponent, t_2, t_1)
						end
					end
					for i_2, v_2 in t_1 do
						t[i_2](v_2)
					end
					return
				end
			end
		end
		var7 = false
	end
	var6 = false
end