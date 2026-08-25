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

local function collectHintsInTemplateTree(p0, p1, p2, p3)
	-- upvalues: collectHintsInTemplateTree (ref)
	if type(p0) ~= "table" then return end
	for i, v in p0 do
		if i ~= "client_hints" or type(v) ~= "table" then
			if i == "roblox_component" and type(v) == "string" and v ~= "" then
				if not p3[v] then
					p3[v] = true
					local var7 = p1(v)
					
					if var7 ~= nil then
						collectHintsInTemplateTree(var7, p1, p2, p3)
					end
				end
			elseif type(v) == "table" then
				collectHintsInTemplateTree(v, p1, p2, p3)
			end
		end
		for i_1, v_1 in v do
			if type(v_1) == "string" then
				p2[v_1] = true
			end
		end
	end
end

local tbl = setmetatable({}, { __mode = "k" })

local function getHintsDeclaredBy(p4, p5)
	-- upvalues: tbl (ref), collectHintsInTemplateTree (ref)
	if p4 == nil then
		return {}
	end
	local var8 = tbl[p4]
	
	if var8 == nil then
		local t = {}
		collectHintsInTemplateTree(p4, p5, t, {})
		tbl[p4] = t
		
		return t
	end
	return var8
end

local function _(p6, p7)
	-- upvalues: getHintsDeclaredBy (ref), t (ref)
	for i in getHintsDeclaredBy(p6, p7) do
		if t[i] then
			return true
		end
	end
	return false
end

local _ = function(p8, p9)
	-- upvalues: getHintsDeclaredBy (ref), t (ref)
	for i, v in p8.getKnownTemplates() do
		local var10
		for i_1 in getHintsDeclaredBy(v, p9) do
			if t[i_1] then
				var10 = true
				if var10 then
					return true
				end
			end
		end
		var10 = false
	end
	return false
end

local _ = function(p10, p11, p12)
	local var11 = p10[p11]
	
	if var11 == nil then
		var11 = {}
		p10[p11] = var11
	end
	table.insert(var11, p12)
end

local function attributeHintsInInputData(p13, p14, p15, p16)
	-- upvalues: getHintsDeclaredBy (ref), t (ref), attributeHintsInInputData (ref)
	if type(p13) ~= "table" then return end
	local var12 = p15
	local robloxComponent = p13.roblox_component
	local var13 = if type(robloxComponent) == "string" and robloxComponent ~= "" then p14(robloxComponent) else nil
	
	if var13 ~= nil then
		for i in getHintsDeclaredBy(var13, p14) do
			if t[i] and not var12[i] then
				if var12 == p15 then
					var12 = table.clone(p15)
				end
				var12[i] = true
				local var14 = p16[i]
				
				if var14 == nil then
					var14 = {}
					p16[i] = var14
				end
				table.insert(var14, p13)
			end
		end
	end
	for i, v in p13 do
		if type(v) == "table" then
			attributeHintsInInputData(v, p14, var12, p16)
		end
	end
end

return function(p17)
	-- upvalues: getHintsDeclaredBy (ref), t (ref), attributeHintsInInputData (ref)
	local getTemplateForRobloxComponent = p17.getTemplateForRobloxComponent
	
	if getTemplateForRobloxComponent == nil then return end
	local var15
	for i, v in p17.getKnownTemplates() do
		local var16
		for i_1 in getHintsDeclaredBy(v, getTemplateForRobloxComponent) do
			if t[i_1] then
				var16 = true
				if var16 then
					var15 = true
					if not var15 then return end
					local t_1 = {}
					
					for i_1, v_1 in p17.pageEntries do
						local robloxComponentType = v_1.robloxComponentType
						local componentInputData = v_1.componentInputData
						
						if robloxComponentType and componentInputData then
							local t_2 = {}
							local var19 = getTemplateForRobloxComponent(robloxComponentType)
							
							if var19 ~= nil then
								for i_2 in getHintsDeclaredBy(var19, getTemplateForRobloxComponent) do
									if t[i_2] then
										t_2[i_2] = true
										local var20 = t_1[i_2]
										
										if var20 == nil then
											var20 = {}
											t_1[i_2] = var20
										end
										table.insert(var20, componentInputData)
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
		var16 = false
	end
	var15 = false
end