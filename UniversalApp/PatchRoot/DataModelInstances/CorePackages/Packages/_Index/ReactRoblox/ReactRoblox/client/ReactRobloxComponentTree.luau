local Parent = script.Parent.Parent.Parent
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local _ = require(Parent.ReactReconciler)
local SharedModule = require(Parent.Shared)
local ReactWorkTags = nil
local HostComponent = nil
local HostComponent1 = nil
local HostComponent2 = nil
local HostComponent3 = nil
local GetParentSuspenseInstance = nil
local InvariantFunction = SharedModule.invariant
local t = {}
local t1 = {}
local t2 = {}
local Segment = string.sub(tostring(math.random()), 3)
local Text = "__reactFiber$" .. Segment
local Text1 = "__reactContainer$" .. Segment

return {
	precacheFiberNode = function(p1, Key)
		-- upvalues: t1 (copy)
		t1[Key] = p1
	end,
	uncacheFiberNode = function(Key)
		-- upvalues: t1 (copy), t2 (copy)
		t1[Key] = nil
		t2[Key] = nil
	end,
	markContainerAsRoot = function(p1, Key)
		-- upvalues: t (copy)
		t[Key] = p1
	end,
	unmarkContainerAsRoot = function(Key)
		-- upvalues: t (copy)
		t[Key] = nil
	end,
	isContainerMarkedAsRoot = function(p1): boolean
		-- upvalues: t (copy)
		return not not t[p1]
	end,
	getClosestInstanceFromNode = function(Parent)
		-- upvalues: t1 (copy), GetParentSuspenseInstance (ref)
		local Entry = t1[Parent]
		
		if Entry then
			return Entry
		end
		local Parent1 = Parent.Parent
		local Entry1 = nil
		while Parent1 do
			Entry1 = t1[Parent1]
			
			if not Entry1 then
				Parent = Parent1
				Parent1 = Parent.Parent
				continue
			end
			local Alternate = Entry1.alternate
			
			if Entry1.child ~= nil or Alternate ~= nil and Alternate.child ~= nil then
				if GetParentSuspenseInstance == nil then
					GetParentSuspenseInstance = require(script.Parent.ReactRobloxHostConfig).getParentSuspenseInstance
				end
				local ParentSuspenseInstance = GetParentSuspenseInstance(Parent)
				local Entry2 = nil
				while ParentSuspenseInstance ~= nil do
					Entry2 = t1[ParentSuspenseInstance]
					
					if Entry2 then
						return Entry2
					end
					ParentSuspenseInstance = GetParentSuspenseInstance(ParentSuspenseInstance)
				end
			end
			return Entry1
		end
		return nil
	end,
	getInstanceFromNode = function(p1)
		-- upvalues: ReactWorkTags (ref), HostComponent (ref), SharedModule (copy), HostComponent1 (ref), HostComponent2 (ref), HostComponent3 (ref), t1 (copy), t (copy), Text (copy), Text1 (copy)
		if ReactWorkTags == nil then
			ReactWorkTags = require(script.Parent.Parent["ReactReconciler.roblox"]).ReactWorkTags
			HostComponent = ReactWorkTags.HostComponent
			
			if SharedModule.ReactFeatureFlags.fixGetInstanceFromNode then
				HostComponent1 = ReactWorkTags.HostText
				HostComponent2 = ReactWorkTags.HostRoot
				HostComponent3 = ReactWorkTags.SuspenseComponent
			else
				HostComponent1 = ReactWorkTags.HostComponent
				HostComponent2 = ReactWorkTags.HostComponent
				HostComponent3 = ReactWorkTags.HostComponent
			end
		end
		local Entry = if SharedModule.ReactFeatureFlags.fixGetInstanceFromNode then t1[p1] or t[p1] else p1[Text] or p1[Text1]
		
		return if Entry and (Entry.tag == HostComponent or Entry.tag == HostComponent1 or Entry.tag == HostComponent3 or Entry.tag == HostComponent2) then Entry else nil
	end,
	getNodeFromInstance = function(p1)
		-- upvalues: HostComponent (ref), HostComponent1 (ref), InvariantFunction (copy)
		if p1.tag == HostComponent or p1.tag == HostComponent1 then
			return p1.stateNode
		else
			InvariantFunction(false, "getNodeFromInstance: Invalid argument.")
			error("getNodeFromInstance: Invalid argument.")
		end
	end,
	getFiberCurrentPropsFromNode = function(p1)
		-- upvalues: t2 (copy)
		return t2[p1]
	end,
	updateFiberProps = function(Key, p1)
		-- upvalues: t2 (copy)
		t2[Key] = p1
	end
}