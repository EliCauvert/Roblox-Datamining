local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local InspectFunction = LuauPolyfillModule.util.inspect
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local SharedModule = require(Parent.Shared)
local Console = SharedModule.console
local ErrorToStringFunction = SharedModule.errorToString
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactCapturedValue)
local ShowErrorDialogFunction = require(script.Parent.ReactFiberErrorDialog).showErrorDialog
local ClassComponent = require(script.Parent.ReactWorkTags).ClassComponent
local GetComponentNameFunction = require(Parent.Shared).getComponentName

return {
	logCapturedError = function(p1, p2)
		-- upvalues: ShowErrorDialogFunction (copy), ReactGlobalsModule (copy), ClassComponent (copy), Console (copy), GetComponentNameFunction (copy), InspectFunction (copy), SetTimeoutFunction (copy), ErrorToStringFunction (copy)
		local Success, Result = pcall(function()
			-- upvalues: ShowErrorDialogFunction (upval), p1 (copy), p2 (copy), ReactGlobalsModule (upval), ClassComponent (upval), Console (upval), GetComponentNameFunction (upval), InspectFunction (upval)
			if ShowErrorDialogFunction(p1, p2) == false then
				return nil
			end
			local Value = p2.value
			
			if ReactGlobalsModule.__DEV__ then
				local Source = p2.source
				local Stack = p2.stack or ""
				
				if Value ~= nil and Value._suppressLogging then
					if p1.tag == ClassComponent then return end
					Console.error(Value)
				end
				local ComponentName = if Source == nil then nil else GetComponentNameFunction(Source.type)
				local ComponentName1 = GetComponentNameFunction(p1.type)
				Console.error((if ComponentName then "The above error occurred in the <" .. tostring(ComponentName) .. "> component:" else "The above error occurred in one of your React components:") .. "\n" .. Stack .. "\n\n" .. (if ComponentName1 then "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. ComponentName1 .. "." else "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries."))
			else
				Console.error(InspectFunction(Value))
			end
			return nil
		end)
		
		if not Success then
			warn("failed to error with error: " .. InspectFunction(Result))
			SetTimeoutFunction(function()
				-- upvalues: ErrorToStringFunction (upval), Result (copy)
				error(ErrorToStringFunction(Result))
			end)
		end
	end
}