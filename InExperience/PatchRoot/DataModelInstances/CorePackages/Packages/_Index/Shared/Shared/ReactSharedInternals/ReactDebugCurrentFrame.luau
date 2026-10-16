local ReactGlobalsModule = require(script.Parent.Parent.Parent.ReactGlobals)
local ExtraStackFrame = nil
local ReactDebugCurrentFrameModule = {
	setExtraStackFrame = function(Value) --[[ Line: 19 ]]
		-- upvalues: ReactGlobalsModule (copy), ExtraStackFrame (ref)
		if ReactGlobalsModule.__DEV__ then
			ExtraStackFrame = Value
		end
	end
}

if ReactGlobalsModule.__DEV__ then
	ReactDebugCurrentFrameModule.getCurrentStack = nil
	
	function ReactDebugCurrentFrameModule.getStackAddendum(): string --[[ Line: 36 ]]
		-- upvalues: ExtraStackFrame (ref), ReactDebugCurrentFrameModule (copy)
		local Text = ""
		
		if ExtraStackFrame then
			Text ..= ExtraStackFrame
		end
		local GetCurrentStackFunction = ReactDebugCurrentFrameModule.getCurrentStack
		
		if GetCurrentStackFunction then
			Text ..= GetCurrentStackFunction() or ""
		end
		return Text
	end
end
return ReactDebugCurrentFrameModule