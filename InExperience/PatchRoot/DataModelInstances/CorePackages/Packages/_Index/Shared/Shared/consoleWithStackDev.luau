local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local console = luauPolyfillModule.console
local array = luauPolyfillModule.Array
local reactSharedInternalsModule = require(script.Parent.ReactSharedInternals)
local printWarning = nil
local t = {
	warn = function(p1, ...)
		-- upvalues: reactGlobalsModule (ref), printWarning (write)
		if reactGlobalsModule.__DEV__ then
			printWarning("warn", p1, { ... })
		end
	end,
	error = function(p1, ...)
		-- upvalues: reactGlobalsModule (ref), printWarning (write)
		if reactGlobalsModule.__DEV__ then
			printWarning("error", p1, { ... })
		end
	end
}

printWarning = function(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), reactSharedInternalsModule (ref), array (ref), console (ref)
	if reactGlobalsModule.__DEV__ then
		local stackAddendum = reactSharedInternalsModule.ReactDebugCurrentFrame.getStackAddendum()
		
		if stackAddendum ~= "" then
			p2 ..= "%s"
			p3 = array.slice(p3, 1)
			table.insert(p3, stackAddendum)
		end
		local var1 = array.map(p3, tostring)
		table.insert(var1, 1, "Warning: " .. p3)
		console[p1](unpack(var1))
	end
end

return t