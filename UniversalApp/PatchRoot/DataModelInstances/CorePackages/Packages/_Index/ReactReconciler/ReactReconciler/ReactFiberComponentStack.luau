local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.LuauPolyfill)
local _ = require(script.Parent.ReactInternalTypes)
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local hostComponent = reactWorkTagsModule.HostComponent
local lazyComponent = reactWorkTagsModule.LazyComponent
local suspenseComponent = reactWorkTagsModule.SuspenseComponent
local suspenseListComponent = reactWorkTagsModule.SuspenseListComponent
local functionComponent = reactWorkTagsModule.FunctionComponent
local indeterminateComponent = reactWorkTagsModule.IndeterminateComponent
local forwardRef = reactWorkTagsModule.ForwardRef
local simpleMemoComponent = reactWorkTagsModule.SimpleMemoComponent
local classComponent = reactWorkTagsModule.ClassComponent
local reactComponentStackFrame = require(parent.Shared).ReactComponentStackFrame
local describeBuiltInComponentFrame = reactComponentStackFrame.describeBuiltInComponentFrame
local describeFunctionComponentFrame = reactComponentStackFrame.describeFunctionComponentFrame
local describeClassComponentFrame = reactComponentStackFrame.describeClassComponentFrame

local function describeFiber(p1)
	-- upvalues: reactGlobalsModule (ref), hostComponent (ref), describeBuiltInComponentFrame (ref), lazyComponent (ref), suspenseComponent (ref), suspenseListComponent (ref), functionComponent (ref), indeterminateComponent (ref), simpleMemoComponent (ref), describeFunctionComponentFrame (ref), forwardRef (ref), classComponent (ref), describeClassComponentFrame (ref)
	local type = nil
	
	if reactGlobalsModule.__DEV__ then
		local debugOwner = p1._debugOwner
		
		if debugOwner then
			type = debugOwner.type
		end
	end
	local var1 = if reactGlobalsModule.__DEV__ then p1._debugSource else nil
	
	return if p1.tag == hostComponent then describeBuiltInComponentFrame(p1.type, var1, type) elseif p1.tag == lazyComponent then describeBuiltInComponentFrame("Lazy", var1, type) elseif p1.tag == suspenseComponent then describeBuiltInComponentFrame("Suspense", var1, type) elseif p1.tag == suspenseListComponent then describeBuiltInComponentFrame("SuspenseList", var1, type) elseif p1.tag == functionComponent or p1.tag == indeterminateComponent or p1.tag == simpleMemoComponent then describeFunctionComponentFrame(p1.type, var1, type) elseif p1.tag == forwardRef then describeFunctionComponentFrame(p1.type.render, var1, type) elseif p1.tag == classComponent then describeClassComponentFrame(p1.type, var1, type) else ""
end

return {
	getStackByFiberInDevAndProd = function(p1)
		-- upvalues: describeFiber (ref)
		local ok, status = pcall(function()
			-- upvalues: p1 (ref), describeFiber (copy)
			local var1 = ""
			local var2 = p1
			repeat
				var1 ..= describeFiber(var2)
				var2 = var2.return_
			until var2 == nil
			return var1
		end)
		
		return if ok then status elseif typeof(status) == "table" and status.message and status.stack then "\nError generating stack: " .. status.message .. "\n" .. tostring(status.stack) else "\nError generating stack: " .. tostring(status)
	end
}