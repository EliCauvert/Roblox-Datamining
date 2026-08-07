-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local collectionService = game:GetService("CollectionService")
local parent = script.Parent.Parent.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local object = luauPolyfillModule.Object
local inspect = luauPolyfillModule.util.inspect
local dEV = reactGlobalsModule.__DEV__
local console = require(parent.Shared).console
local reactModule = require(parent.React)
local reactSymbols = require(parent.Shared).ReactSymbols
local singleEventManagerModule = require(script.Parent.SingleEventManager)
local type = require(parent.Shared).Type
local getDefaultInstancePropertyModule = require(script.Parent.getDefaultInstanceProperty)
local _ = require(script.Parent.Parent["ReactRobloxHostTypes.roblox"])
local tag = require(parent.React).Tag
local t = {}
local t_1 = {}

local function identity(...) --[[ line: 72 ]]
	return ...
end

local function setRobloxInstanceProperty(value, p0, p1) --[[ line: 76 ]]
	-- upvalues: getDefaultInstancePropertyModule (ref)
	if p1 == nil then
		local ok, _ = pcall(value.ResetPropertyToDefault, value, p0)
		
		if ok then return end
		local _, var17 = getDefaultInstancePropertyModule(value.ClassName, p0)
		p1 = var17
	end
	value[p0] = p1
end

local function _(p2, p3) --[[ line: 92 | named "removeBinding" ]]
	-- upvalues: t_1 (ref)
	local var18 = t_1[p2]
	
	if var18 ~= nil then
		var18[p3]()
		var18[p3] = nil
	end
end

local function attachBinding(p4, p5, p6) --[[ line: 101 ]]
	-- upvalues: setRobloxInstanceProperty (ref), identity (ref), console (ref), t_1 (ref), reactModule (ref)
	local function updateBoundProperty(p7) --[[ line: 102 ]]
		-- upvalues: setRobloxInstanceProperty (copy), identity (copy), p4 (ref), p5 (ref), p6 (ref), console (copy)
		local ok, status = xpcall(setRobloxInstanceProperty, identity, p4, p5, p7)
		
		if not ok then
			local formattedText = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", p5, p4.Name, p4.ClassName, tostring(p7), status, p6._source or "<enable DEV mode for stack>")
			console.error(formattedText)
			error(formattedText, 0)
		end
	end
	
	if t_1[p4] == nil then
		t_1[p4] = {}
	end
	t_1[p4][p5] = reactModule.__subscribeToBinding(p6, updateBoundProperty)
	updateBoundProperty(p6:getValue())
end

local function applyTags(p8, p9, p10) --[[ line: 134 ]]
	-- upvalues: dEV (ref), console (ref), inspect (ref), collectionService (ref)
	if dEV and p10 ~= nil and typeof(p10) ~= "string" then
		console.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", inspect(p10))
		
		return
	end
	local t = {}
	
	for i in string.gmatch(p9 or "", "%S+") do
		t[i] = true
	end
	local t_1 = {}
	
	for i_1 in string.gmatch(p10 or "", "%S+") do
		t_1[i_1] = true
	end
	for i_2, v in t do
		if not t_1[i_2] then
			collectionService:RemoveTag(p8, i_2)
		end
	end
	for i_3, v in t_1 do
		if not t[i_3] then
			collectionService:AddTag(p8, i_3)
		end
	end
end

local _ = function(p11) --[[ line: 168 | named "removeAllTags" ]]
	-- upvalues: collectionService (ref)
	for i, v in collectionService:GetTags(p11) do
		collectionService:RemoveTag(p11, v)
	end
end

local function applyProp(p12, p13, p14, p15) --[[ line: 174 ]]
	-- upvalues: type (ref), t (ref), singleEventManagerModule (ref), reactSymbols (ref), t_1 (ref), attachBinding (ref), tag (ref), applyTags (ref), getDefaultInstancePropertyModule (ref)
	local var23 = type.of(p13)
	
	if var23 == type.HostEvent or var23 == type.HostChangeEvent then
		local var24 = t[p12]
		
		if var24 == nil then
			var24 = singleEventManagerModule.new(p12)
			t[p12] = var24
		end
		local name = p13.name
		
		if var23 == type.HostChangeEvent then
			var24:connectPropertyChange(name, p14)
			
			return
		end
		var24:connectEvent(name, p14)
		
		return
	else
		local var25 = typeof(p14) == "table" and p14["$$typeof"] == reactSymbols.REACT_BINDING_TYPE
		
		if p15 ~= nil and (typeof(p15) == "table" and p15["$$typeof"] == reactSymbols.REACT_BINDING_TYPE) then
			local var26 = t_1[p12]
			
			if var26 ~= nil then
				var26[p13]()
				var26[p13] = nil
			end
		end
		if var25 then
			attachBinding(p12, p13, p14)
			
			return
		elseif p13 == tag then
			applyTags(p12, p15, p14)
			
			return
		end
		local var27 = p14
		
		if var27 == nil then
			local ok, _ = pcall(p12.ResetPropertyToDefault, p12, p13)
			
			if ok then return end
			local _, var28 = getDefaultInstancePropertyModule(p12.ClassName, p13)
			var27 = var28
		end
		p12[p13] = var27
	end
end

local function applyProps(p16, p17) --[[ line: 219 ]]
	-- upvalues: applyProp (ref)
	for i, v in p17 do
		if i ~= "ref" and i ~= "children" then
			applyProp(p16, i, v)
		end
	end
end

local function setInitialProperties(value, _, p18, _) --[[ line: 230 ]]
	-- upvalues: applyProps (ref), identity (ref), console (ref), t (ref)
	local ok, status = xpcall(applyProps, identity, value, p18)
	
	if not ok then
		local formattedText = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", value.Name, value.ClassName, tostring(status))
		console.error(formattedText)
		error(formattedText, 0)
	end
	if t[value] ~= nil then
		t[value]:resume()
	end
end

local function safelyApplyProperties(p19, p20, p21) --[[ line: 259 ]]
	-- upvalues: object (ref), applyProp (ref)
	for i = 1, #p20, 2 do
		local var30 = p20[i]
		local var31 = p20[i + 1]
		
		if var31 == object.None then
			var31 = nil
		end
		if var30 ~= "ref" and var30 ~= "children" then
			applyProp(p19, var30, var31, p21[var30])
		end
	end
end

local function updateProperties(p22, p23, p24) --[[ line: 278 ]]
	-- upvalues: t (ref), safelyApplyProperties (ref), identity (ref), console (ref)
	if t[p22] ~= nil then
		t[p22]:suspend()
	end
	local ok, status = xpcall(safelyApplyProperties, identity, p22, p23, p24)
	
	if not ok then
		local formattedText = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", p22.Name, p22.ClassName, status)
		console.error(formattedText)
		error(formattedText, 0)
	end
	if t[p22] ~= nil then
		t[p22]:resume()
	end
end

local _, status = xpcall(function() --[[ line: 312 ]]
	return game:DefineFastFlag("ReactFixBindingMemoryLeak", false)
end, function() --[[ line: 314 ]]
	return true
end)

local _ = function(p25) --[[ line: 318 | named "cleanupBindings" ]]
	-- upvalues: t_1 (ref)
	local var33 = t_1[p25]
	
	if var33 ~= nil then
		for i, v in var33 do
			v()
		end
		t_1[p25] = nil
	end
end

return {
	setInitialProperties = setInitialProperties,
	updateProperties = updateProperties,
	cleanupHostComponent = function(p26) --[[ line: 331 ]]
		-- upvalues: t (ref), status (ref), t_1 (ref), collectionService (ref)
		if t[p26] ~= nil then
			t[p26] = nil
		end
		if status then
			local var34 = t_1[p26]
			
			if var34 ~= nil then
				for i, v in var34 do
					v()
				end
				t_1[p26] = nil
			end
		elseif t_1[p26] ~= nil then
			t_1[p26] = nil
		end
		if typeof(p26) ~= "Instance" then return end
		for i, v in collectionService:GetTags(p26) do
			collectionService:RemoveTag(p26, v)
		end
		for i, v_1 in p26:GetDescendants() do
			if t[v_1] ~= nil then
				t[v_1] = nil
			end
			if status then
				local var35 = t_1[v_1]
				
				if var35 ~= nil then
					for i_2, v_2 in var35 do
						v_2()
					end
					t_1[v_1] = nil
				end
			elseif t_1[v_1] ~= nil then
				t_1[v_1] = nil
			end
			for i_3, i_2 in collectionService:GetTags(p26) do
				collectionService:RemoveTag(p26, i_2)
			end
		end
	end,
	_instanceToEventManager = t,
	_instanceToBindings = t_1
}