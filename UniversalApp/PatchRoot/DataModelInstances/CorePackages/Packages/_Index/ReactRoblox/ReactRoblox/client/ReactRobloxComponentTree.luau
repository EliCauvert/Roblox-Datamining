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

function t.precacheFiberNode(p1, p2)
	-- upvalues: t_2 (ref)
	t_2[p2] = p1
end

function t.uncacheFiberNode(p1)
	-- upvalues: t_2 (ref), t_3 (ref)
	t_2[p1] = nil
	t_3[p1] = nil
end

function t.markContainerAsRoot(p1, p2)
	-- upvalues: t_1 (ref)
	t_1[p2] = p1
end

function t.unmarkContainerAsRoot(p1)
	-- upvalues: t_1 (ref)
	t_1[p1] = nil
end

function t.isContainerMarkedAsRoot(p1)
	-- upvalues: t_1 (ref)
	return not not t_1[p1]
end

function t.getClosestInstanceFromNode(p1)
	-- upvalues: t_2 (ref), var6 (write)
	local var7 = t_2[p1]
	
	if var7 then
		return var7
	end
	local parent = p1.Parent
	while parent do
		local var8 = t_2[parent]
		
		if not var8 then
			p1 = parent
			parent = p1.Parent
			continue
		end
		local alternate = var8.alternate
		
		if var8.child ~= nil or alternate ~= nil and alternate.child ~= nil then
			if var6 == nil then
				var6 = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
			end
			local var9 = var6(p1)
			while var9 ~= nil do
				local var10 = t_2[var9]
				
				if not var10 then
					var9 = var6(var9)
					continue
				end
				return var10
			end
		end
		return var8
	end
	return nil
end

function t.getInstanceFromNode(p2)
	-- upvalues: var1 (write), var2 (write), var3 (write), var4 (write), var5 (write), text (ref), text_1 (ref)
	if var1 == nil then
		var1 = require(script.Parent.Parent["ReactReconciler.roblox"]).ReactWorkTags
		var2 = var1.HostComponent
		var3 = var1.HostComponent
		var4 = var1.HostComponent
		var5 = var1.HostComponent
	end
	local var11 = p2[text] or p2[text_1]
	
	return if var11 then if var11.tag == var2 or var11.tag == var3 or (var11.tag == var5 or var11.tag == var4) then var11 else nil else nil
end

function t.getNodeFromInstance(p2)
	-- upvalues: var2 (write), var3 (write), invariant (ref)
	if p2.tag == var2 or p2.tag == var3 then
		return p2.stateNode
	end
	invariant(false, "getNodeFromInstance: Invalid argument.")
	error("getNodeFromInstance: Invalid argument.")
end

function t.getFiberCurrentPropsFromNode(p2)
	-- upvalues: t_3 (ref)
	return t_3[p2]
end

function t.updateFiberProps(p2, p3)
	-- upvalues: t_3 (ref)
	t_3[p2] = p3
end

return t