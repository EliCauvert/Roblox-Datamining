-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:34 2026 Pacific Standard Time.

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
	logCapturedError = function(p0, p1) --[[ line: 34 ]]
		-- upvalues: showErrorDialog (ref), reactGlobalsModule (ref), classComponent (ref), console (ref), getComponentName (ref), inspect (ref), setTimeout (ref), errorToString (ref)
		local ok, status = pcall(function() --[[ line: 35 ]]
			-- upvalues: showErrorDialog (copy), p0 (ref), p1 (ref), reactGlobalsModule (copy), classComponent (copy), console (copy), getComponentName (copy), inspect (copy)
			if showErrorDialog(p0, p1) == false then
				return nil
			end
			local value = p1.value
			
			if reactGlobalsModule.__DEV__ then
				local source = p1.source
				local stack = p1.stack or ""
				
				if value ~= nil and value._suppressLogging then
					if p0.tag == classComponent then return end
					console.error(value)
				end
				local var4 = if source ~= nil then nil else getComponentName(source.type)
				local var5 = if var4 then "The above error occurred in the <" .. tostring(var4) .. "> component:" else "The above error occurred in one of your React components:"
				local _ = nil
				local var6 = getComponentName(p0.type)
				console.error(var5 .. "\n" .. stack .. "\n\n" .. (if var6 then "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. var6 .. "." else "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries."))
			else
				console.error(inspect(value))
			end
			return nil
		end)
		
		if not ok then
			warn("failed to error with error: " .. inspect(status))
			setTimeout(function() --[[ line: 126 ]]
				-- upvalues: errorToString (copy), status (ref)
				error(errorToString(status))
			end)
		end
	end
}