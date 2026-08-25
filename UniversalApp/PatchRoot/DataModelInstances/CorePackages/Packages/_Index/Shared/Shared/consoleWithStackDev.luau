local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local luauPolyfillModule = require(parent.LuauPolyfill)
local console = luauPolyfillModule.console
local array = luauPolyfillModule.Array
local reactSharedInternalsModule = require(script.Parent.ReactSharedInternals)
local printWarning = nil
local t = {
	warn = function(p0, ...)
		-- upvalues: reactGlobalsModule (ref), printWarning (write)
		if reactGlobalsModule.__DEV__ then
			printWarning("warn", p0, { ... })
		end
	end,
	error = function(p1, ...)
		-- upvalues: reactGlobalsModule (ref), printWarning (write)
		if reactGlobalsModule.__DEV__ then
			printWarning("error", p1, { ... })
		end
	end
}

printWarning = function(p2, p3, p4)
	-- upvalues: reactGlobalsModule (ref), reactSharedInternalsModule (ref), array (ref), console (ref)
	if reactGlobalsModule.__DEV__ then
		local stackAddendum = reactSharedInternalsModule.ReactDebugCurrentFrame.getStackAddendum()
		
		if stackAddendum ~= "" then
			p3 ..= "%s"
			p4 = array.slice(p4, 1)
			table.insert(p4, stackAddendum)
		end
		local var6 = array.map(p4, tostring)
		table.insert(var6, 1, "Warning: " .. p3)
		console[p2](unpack(var6))
	end
end

return t