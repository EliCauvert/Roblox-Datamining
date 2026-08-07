-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:38 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local _ = require(parent.ReactReconciler)
local sharedModule = require(parent.Shared)
local var1 = nil
local var2 = nil
local var3 = nil
local var4 = nil
local var5 = nil
local var6 = nil
local invariant = sharedModule.invariant
local t = {}
local t_1 = {}
local t_2 = {}
local t_3 = {}
local substring = string.sub(tostring(math.random()), 3)
local text = "__reactFiber$" .. substring
local text_1 = "__reactContainer$" .. substring

function t.precacheFiberNode(p0, p1) --[[ line: 66 ]]
	-- upvalues: t_2 (ref)
	t_2[p1] = p0
end

function t.uncacheFiberNode(p2) --[[ line: 73 ]]
	-- upvalues: t_2 (ref), t_3 (ref)
	t_2[p2] = nil
	t_3[p2] = nil
end

function t.markContainerAsRoot(p3, p4) --[[ line: 80 ]]
	-- upvalues: t_1 (ref)
	t_1[p4] = p3
end

function t.unmarkContainerAsRoot(p5) --[[ line: 86 ]]
	-- upvalues: t_1 (ref)
	t_1[p5] = nil
end

function t.isContainerMarkedAsRoot(p6) --[[ line: 92 ]]
	-- upvalues: t_1 (ref)
	return not not t_1[p6]
end

function t.getClosestInstanceFromNode(p7) --[[ line: 106 ]]
	-- upvalues: t_2 (ref), var6 (write)
	local var14 = t_2[p7]
	
	if var14 then
		return var14
	end
	local parent = p7.Parent
	while parent do
		local var15 = t_2[parent]
		
		if not var15 then
			p7 = parent
			parent = p7.Parent
			continue
		end
		local alternate = var15.alternate
		
		if var15.child ~= nil or alternate ~= nil and alternate.child ~= nil then
			if var6 == nil then
				var6 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
			end
			local var16 = var6(p7)
			while var16 ~= nil do
				local var17 = t_2[var16]
				
				if not var17 then
					var16 = var6(var16)
					continue
				end
				return var17
			end
		end
		return var15
	end
	return nil
end

function t.getInstanceFromNode(p8) --[[ line: 190 ]]
	-- upvalues: var1 (write), var2 (write), var3 (write), var4 (write), var5 (write), text (ref), text_1 (ref)
	if var1 == nil then
		var1 = require(script.Parent.Parent["ReactReconciler.roblox"]).ReactWorkTags
		var2 = var1.HostComponent
		var3 = var1.HostComponent
		var4 = var1.HostComponent
		var5 = var1.HostComponent
	end
	local var18 = p8[text] or p8[text_1]
	
	return if var18 then if var18.tag == var2 or var18.tag == var3 or (var18.tag == var5 or var18.tag == var4) then var18 else nil else nil
end

function t.getNodeFromInstance(p9) --[[ line: 224 ]]
	-- upvalues: var2 (write), var3 (write), invariant (ref)
	if p9.tag == var2 or p9.tag == var3 then
		return p9.stateNode
	end
	invariant(false, "getNodeFromInstance: Invalid argument.")
	error("getNodeFromInstance: Invalid argument.")
end

function t.getFiberCurrentPropsFromNode(p10) --[[ line: 238 ]]
	-- upvalues: t_3 (ref)
	return t_3[p10]
end

function t.updateFiberProps(p11, p12) --[[ line: 244 ]]
	-- upvalues: t_3 (ref)
	t_3[p11] = p12
end

return t