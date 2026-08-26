local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local t = {}

local function _(p1, p2)
	-- upvalues: reactGlobalsModule (ref), t (ref), console (ref)
	if reactGlobalsModule.__DEV__ then
		local componentName = p1.__componentName or "ReactClass"
		local text = componentName .. "." .. p1
		
		if t[text] then return end
		console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", p2, componentName)
		t[text] = true
	end
end

return {
	isMounted = function(_)
		return false
	end,
	enqueueForceUpdate = function(p1, _, _)
		-- upvalues: reactGlobalsModule (ref), t (ref), console (ref)
		if reactGlobalsModule.__DEV__ then
			local componentName = p1.__componentName or "ReactClass"
			local text = componentName .. "." .. "forceUpdate"
			
			if t[text] then return end
			console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "forceUpdate", componentName)
			t[text] = true
		end
	end,
	enqueueReplaceState = function(p1, _, _, _)
		-- upvalues: reactGlobalsModule (ref), t (ref), console (ref)
		if reactGlobalsModule.__DEV__ then
			local componentName = p1.__componentName or "ReactClass"
			local text = componentName .. "." .. "replaceState"
			
			if t[text] then return end
			console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "replaceState", componentName)
			t[text] = true
		end
	end,
	enqueueSetState = function(value, _, _, _)
		-- upvalues: reactGlobalsModule (ref), t (ref), console (ref)
		if reactGlobalsModule.__DEV__ then
			local componentName = value.__componentName or "ReactClass"
			local text = componentName .. "." .. "setState"
			
			if t[text] then return end
			console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "setState", componentName)
			t[text] = true
		end
	end
}