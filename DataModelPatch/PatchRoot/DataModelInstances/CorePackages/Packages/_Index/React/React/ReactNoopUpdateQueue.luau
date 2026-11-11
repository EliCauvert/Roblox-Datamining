local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local t = {}

local function _(p1, Text)
	-- upvalues: ReactGlobalsModule (copy), t (copy), Console (copy)
	if ReactGlobalsModule.__DEV__ then
		local ComponentName = p1.__componentName or "ReactClass"
		local Text1 = ComponentName .. "." .. Text
		
		if t[Text1] then return end
		Console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", Text, ComponentName)
		t[Text1] = true
	end
end

return {
	isMounted = function(_): boolean
		return false
	end,
	enqueueForceUpdate = function(p1, _, _)
		-- upvalues: ReactGlobalsModule (copy), t (copy), Console (copy)
		if ReactGlobalsModule.__DEV__ then
			local ComponentName = p1.__componentName or "ReactClass"
			local Text = ComponentName .. "." .. "forceUpdate"
			
			if t[Text] then return end
			Console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "forceUpdate", ComponentName)
			t[Text] = true
		end
	end,
	enqueueReplaceState = function(p1, _, _, _)
		-- upvalues: ReactGlobalsModule (copy), t (copy), Console (copy)
		if ReactGlobalsModule.__DEV__ then
			local ComponentName = p1.__componentName or "ReactClass"
			local Text = ComponentName .. "." .. "replaceState"
			
			if t[Text] then return end
			Console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "replaceState", ComponentName)
			t[Text] = true
		end
	end,
	enqueueSetState = function(p1, _, _, _)
		-- upvalues: ReactGlobalsModule (copy), t (copy), Console (copy)
		if ReactGlobalsModule.__DEV__ then
			local ComponentName = p1.__componentName or "ReactClass"
			local Text = ComponentName .. "." .. "setState"
			
			if t[Text] then return end
			Console.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "setState", ComponentName)
			t[Text] = true
		end
	end
}