local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.LuauPolyfill)
local _ = require(script.Parent.ReactInternalTypes)
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local HostComponent = ReactWorkTagsModule.HostComponent
local LazyComponent = ReactWorkTagsModule.LazyComponent
local SuspenseComponent = ReactWorkTagsModule.SuspenseComponent
local SuspenseListComponent = ReactWorkTagsModule.SuspenseListComponent
local FunctionComponent = ReactWorkTagsModule.FunctionComponent
local IndeterminateComponent = ReactWorkTagsModule.IndeterminateComponent
local ForwardRef = ReactWorkTagsModule.ForwardRef
local SimpleMemoComponent = ReactWorkTagsModule.SimpleMemoComponent
local ClassComponent = ReactWorkTagsModule.ClassComponent
local ReactComponentStackFrame = require(Parent.Shared).ReactComponentStackFrame
local DescribeBuiltInComponentFrameFunction = ReactComponentStackFrame.describeBuiltInComponentFrame
local DescribeFunctionComponentFrameFunction = ReactComponentStackFrame.describeFunctionComponentFrame
local DescribeClassComponentFrameFunction = ReactComponentStackFrame.describeClassComponentFrame

local function describeFiber(Return) --[[ Line: 39 ]]
	-- upvalues: ReactGlobalsModule (copy), HostComponent (copy), DescribeBuiltInComponentFrameFunction (copy), LazyComponent (copy), SuspenseComponent (copy), SuspenseListComponent (copy), FunctionComponent (copy), IndeterminateComponent (copy), SimpleMemoComponent (copy), DescribeFunctionComponentFrameFunction (copy), ForwardRef (copy), ClassComponent (copy), DescribeClassComponentFrameFunction (copy)
	local Type = nil
	
	if ReactGlobalsModule.__DEV__ then
		local DebugOwner = Return._debugOwner
		
		if DebugOwner then
			Type = DebugOwner.type
		end
	end
	local DebugSource = if ReactGlobalsModule.__DEV__ then Return._debugSource else nil
	
	return if Return.tag == HostComponent then DescribeBuiltInComponentFrameFunction(Return.type, DebugSource, Type) elseif Return.tag == LazyComponent then DescribeBuiltInComponentFrameFunction("Lazy", DebugSource, Type) elseif Return.tag == SuspenseComponent then DescribeBuiltInComponentFrameFunction("Suspense", DebugSource, Type) elseif Return.tag == SuspenseListComponent then DescribeBuiltInComponentFrameFunction("SuspenseList", DebugSource, Type) elseif Return.tag == FunctionComponent or Return.tag == IndeterminateComponent or Return.tag == SimpleMemoComponent then DescribeFunctionComponentFrameFunction(Return.type, DebugSource, Type) elseif Return.tag == ForwardRef then DescribeFunctionComponentFrameFunction(Return.type.render, DebugSource, Type) elseif Return.tag == ClassComponent then DescribeClassComponentFrameFunction(Return.type, DebugSource, Type) else ""
end

return {
	getStackByFiberInDevAndProd = function(Return) --[[ Line: 77 ]]
		-- upvalues: describeFiber (copy)
		local Success, Result = pcall(function(): string --[[ Line: 78 ]]
			-- upvalues: Return (copy), describeFiber (upval)
			local Text = ""
			local Return1 = Return
			repeat
				Text ..= describeFiber(Return1)
				Return1 = Return1.return_
			until Return1 == nil
			return Text
		end)
		
		return if Success then Result elseif typeof(Result) == "table" and Result.message and Result.stack then "\nError generating stack: " .. Result.message .. "\n" .. tostring(Result.stack) else "\nError generating stack: " .. tostring(Result)
	end
}