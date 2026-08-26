local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local inspect = luauPolyfillModule.util.inspect
local setTimeout = luauPolyfillModule.setTimeout
local sharedModule = require(parent.Shared)
local console = sharedModule.console
local errorToString = sharedModule.errorToString
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactCapturedValue)
local showErrorDialog = require(script.Parent.ReactFiberErrorDialog).showErrorDialog
local classComponent = require(script.Parent.ReactWorkTags).ClassComponent
local getComponentName = require(parent.Shared).getComponentName

return {
	logCapturedError = function(p1, p2)
		-- upvalues: showErrorDialog (ref), reactGlobalsModule (ref), classComponent (ref), console (ref), getComponentName (ref), inspect (ref), setTimeout (ref), errorToString (ref)
		local ok, status = pcall(function()
			-- upvalues: showErrorDialog (copy), p1 (ref), p2 (ref), reactGlobalsModule (copy), classComponent (copy), console (copy), getComponentName (copy), inspect (copy)
			if showErrorDialog(p1, p2) == false then
				return nil
			end
			local value = p2.value
			
			if reactGlobalsModule.__DEV__ then
				local source = p2.source
				local stack = p2.stack or ""
				
				if value ~= nil and value._suppressLogging then
					if p1.tag == classComponent then return end
					console.error(value)
				end
				local var1 = if source ~= nil then nil else getComponentName(source.type)
				local var2 = if var1 then "The above error occurred in the <" .. tostring(var1) .. "> component:" else "The above error occurred in one of your React components:"
				local _ = nil
				local var3 = getComponentName(p1.type)
				console.error(var2 .. "\n" .. stack .. "\n\n" .. (if var3 then "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. var6 .. "." else "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries."))
			else
				console.error(inspect(value))
			end
			return nil
		end)
		
		if not ok then
			warn("failed to error with error: " .. inspect(status))
			setTimeout(function()
				-- upvalues: errorToString (copy), status (ref)
				error(errorToString(status))
			end)
		end
	end
}