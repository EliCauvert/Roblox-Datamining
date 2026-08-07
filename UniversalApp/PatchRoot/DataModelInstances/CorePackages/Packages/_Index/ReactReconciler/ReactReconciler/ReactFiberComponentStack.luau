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

local function describeFiber(p0) --[[ line: 39 ]]
	-- upvalues: reactGlobalsModule (ref), hostComponent (ref), describeBuiltInComponentFrame (ref), lazyComponent (ref), suspenseComponent (ref), suspenseListComponent (ref), functionComponent (ref), indeterminateComponent (ref), simpleMemoComponent (ref), describeFunctionComponentFrame (ref), forwardRef (ref), classComponent (ref), describeClassComponentFrame (ref)
	local type = nil
	
	if reactGlobalsModule.__DEV__ then
		local debugOwner = p0._debugOwner
		
		if debugOwner then
			type = debugOwner.type
		end
	end
	local var3 = if reactGlobalsModule.__DEV__ then p0._debugSource else nil
	
	return if p0.tag == hostComponent then describeBuiltInComponentFrame(p0.type, var3, type) elseif p0.tag == lazyComponent then describeBuiltInComponentFrame("Lazy", var3, type) elseif p0.tag == suspenseComponent then describeBuiltInComponentFrame("Suspense", var3, type) elseif p0.tag == suspenseListComponent then describeBuiltInComponentFrame("SuspenseList", var3, type) elseif p0.tag == functionComponent or p0.tag == indeterminateComponent or p0.tag == simpleMemoComponent then describeFunctionComponentFrame(p0.type, var3, type) elseif p0.tag == forwardRef then describeFunctionComponentFrame(p0.type.render, var3, type) elseif p0.tag == classComponent then describeClassComponentFrame(p0.type, var3, type) else ""
end

return {
	getStackByFiberInDevAndProd = function(p1) --[[ line: 77 ]]
		-- upvalues: describeFiber (ref)
		local ok, status = pcall(function() --[[ line: 78 ]]
			-- upvalues: p1 (ref), describeFiber (copy)
			local var4 = ""
			local var5 = p1
			repeat
				var4 ..= describeFiber(var5)
				var5 = var5.return_
			until var5 == nil
			return var4
		end)
		
		return if ok then status elseif typeof(status) == "table" and status.message and status.stack then "\nError generating stack: " .. status.message .. "\n" .. tostring(status.stack) else "\nError generating stack: " .. tostring(status)
	end
}