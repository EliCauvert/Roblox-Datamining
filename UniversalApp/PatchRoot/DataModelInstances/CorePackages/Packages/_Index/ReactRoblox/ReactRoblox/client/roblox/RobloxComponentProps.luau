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

local function identity(...)
	return ...
end

local function setRobloxInstanceProperty(value, p1, p2)
	-- upvalues: getDefaultInstancePropertyModule (ref)
	if p2 == nil then
		local ok, _ = pcall(value.ResetPropertyToDefault, value, p1)
		
		if ok then return end
		local _, var1 = getDefaultInstancePropertyModule(value.ClassName, p1)
		p2 = var1
	end
	value[p1] = p2
end

local function _(p1, p2)
	-- upvalues: t_1 (ref)
	local var1 = t_1[p1]
	
	if var1 ~= nil then
		var1[p2]()
		var1[p2] = nil
	end
end

local function attachBinding(p1, p2, p3)
	-- upvalues: setRobloxInstanceProperty (ref), identity (ref), console (ref), t_1 (ref), reactModule (ref)
	local function updateBoundProperty(p4)
		-- upvalues: setRobloxInstanceProperty (copy), identity (copy), p1 (ref), p2 (ref), p3 (ref), console (copy)
		local ok, status = xpcall(setRobloxInstanceProperty, identity, p1, p2, p4)
		
		if not ok then
			local formattedText = string.format("Error updating binding or ref assigned to key %s of '%s' (%s).\n\nUpdated value:\n  %s\n\nError:\n  %s\n\n%s\n", p2, p1.Name, p1.ClassName, tostring(p4), status, p3._source or "<enable DEV mode for stack>")
			console.error(formattedText)
			error(formattedText, 0)
		end
	end
	
	if t_1[p1] == nil then
		t_1[p1] = {}
	end
	t_1[p1][p2] = reactModule.__subscribeToBinding(p3, updateBoundProperty)
	updateBoundProperty(p3:getValue())
end

local function applyTags(p1, p2, p3)
	-- upvalues: dEV (ref), console (ref), inspect (ref), collectionService (ref)
	if dEV and p3 ~= nil and typeof(p3) ~= "string" then
		console.error("Type provided for ReactRoblox.Tag is invalid - tags should be specified as a single string, with individual tags delimited by spaces. Instead received:\n%s", inspect(p3))
		
		return
	end
	local t = {}
	
	for i in string.gmatch(p2 or "", "%S+") do
		t[i] = true
	end
	local t_1 = {}
	
	for i_1 in string.gmatch(p3 or "", "%S+") do
		t_1[i_1] = true
	end
	for i_2, v in t do
		if not t_1[i_2] then
			collectionService:RemoveTag(p1, i_2)
		end
	end
	for i_3, v in t_1 do
		if not t[i_3] then
			collectionService:AddTag(p1, i_3)
		end
	end
end

local _ = function(p4)
	-- upvalues: collectionService (ref)
	for i, v in collectionService:GetTags(p4) do
		collectionService:RemoveTag(p4, v)
	end
end

local function applyProp(p5, p6, p7, p8)
	-- upvalues: type (ref), t (ref), singleEventManagerModule (ref), reactSymbols (ref), t_1 (ref), attachBinding (ref), tag (ref), applyTags (ref), getDefaultInstancePropertyModule (ref)
	local var1 = type.of(p6)
	
	if var1 == type.HostEvent or var1 == type.HostChangeEvent then
		local var2 = t[p5]
		
		if var2 == nil then
			var2 = singleEventManagerModule.new(p5)
			t[p5] = var2
		end
		local name = p6.name
		
		if var1 == type.HostChangeEvent then
			var2:connectPropertyChange(name, p7)
			
			return
		end
		var2:connectEvent(name, p7)
		
		return
	else
		local var3 = typeof(p7) == "table" and p7["$$typeof"] == reactSymbols.REACT_BINDING_TYPE
		
		if p8 ~= nil and (typeof(p8) == "table" and p8["$$typeof"] == reactSymbols.REACT_BINDING_TYPE) then
			local var4 = t_1[p5]
			
			if var4 ~= nil then
				var4[p6]()
				var4[p6] = nil
			end
		end
		if var3 then
			attachBinding(p5, p6, p7)
			
			return
		elseif p6 == tag then
			applyTags(p5, p8, p7)
			
			return
		end
		local var5 = p7
		
		if var5 == nil then
			local ok, _ = pcall(p5.ResetPropertyToDefault, p5, p6)
			
			if ok then return end
			local _, var6 = getDefaultInstancePropertyModule(p5.ClassName, p6)
			var5 = var6
		end
		p5[p6] = var5
	end
end

local function applyProps(p5, p6)
	-- upvalues: applyProp (ref)
	for i, v in p6 do
		if i ~= "ref" and i ~= "children" then
			applyProp(p5, i, v)
		end
	end
end

local function setInitialProperties(value, _, p7, _)
	-- upvalues: applyProps (ref), identity (ref), console (ref), t (ref)
	local ok, status = xpcall(applyProps, identity, value, p7)
	
	if not ok then
		local formattedText = string.format("Error applying initial props to Roblox Instance '%s' (%s):\n  %s\n", value.Name, value.ClassName, tostring(status))
		console.error(formattedText)
		error(formattedText, 0)
	end
	if t[value] ~= nil then
		t[value]:resume()
	end
end

local function safelyApplyProperties(p7, p8, p9)
	-- upvalues: object (ref), applyProp (ref)
	for i = 1, #p8, 2 do
		local var1 = p8[i]
		local var2 = p8[i + 1]
		
		if var2 == object.None then
			var2 = nil
		end
		if var1 ~= "ref" and var1 ~= "children" then
			applyProp(p7, var1, var2, p9[var1])
		end
	end
end

local function updateProperties(p10, p11, p12)
	-- upvalues: t (ref), safelyApplyProperties (ref), identity (ref), console (ref)
	if t[p10] ~= nil then
		t[p10]:suspend()
	end
	local ok, status = xpcall(safelyApplyProperties, identity, p10, p11, p12)
	
	if not ok then
		local formattedText = string.format("Error updating props on Roblox Instance '%s' (%s):\n  %s\n", p10.Name, p10.ClassName, status)
		console.error(formattedText)
		error(formattedText, 0)
	end
	if t[p10] ~= nil then
		t[p10]:resume()
	end
end

local _, status = xpcall(function()
	return game:DefineFastFlag("ReactFixBindingMemoryLeak", false)
end, function()
	return true
end)

local _ = function(p10)
	-- upvalues: t_1 (ref)
	local var3 = t_1[p10]
	
	if var3 ~= nil then
		for i, v in var3 do
			v()
		end
		t_1[p10] = nil
	end
end

return {
	setInitialProperties = setInitialProperties,
	updateProperties = updateProperties,
	cleanupHostComponent = function(p11)
		-- upvalues: t (ref), status (ref), t_1 (ref), collectionService (ref)
		if t[p11] ~= nil then
			t[p11] = nil
		end
		if status then
			local var4 = t_1[p11]
			
			if var4 ~= nil then
				for i, v in var4 do
					v()
				end
				t_1[p11] = nil
			end
		elseif t_1[p11] ~= nil then
			t_1[p11] = nil
		end
		if typeof(p11) ~= "Instance" then return end
		for i, v in collectionService:GetTags(p11) do
			collectionService:RemoveTag(p11, v)
		end
		for i, v_1 in p11:GetDescendants() do
			if t[v_1] ~= nil then
				t[v_1] = nil
			end
			if status then
				local var5 = t_1[v_1]
				
				if var5 ~= nil then
					for i_2, v_2 in var5 do
						v_2()
					end
					t_1[v_1] = nil
				end
			elseif t_1[v_1] ~= nil then
				t_1[v_1] = nil
			end
			for i_3, i_2 in collectionService:GetTags(p11) do
				collectionService:RemoveTag(p11, i_2)
			end
		end
	end,
	_instanceToEventManager = t,
	_instanceToBindings = t_1
}