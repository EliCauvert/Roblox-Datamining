local var2
local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local t = {}

if require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry) then
	var2 = nil
	local var3 = nil
	local var4 = nil
	
	function t.getNextUpComponentSortLatency() --[[ line: 14 ]]
		-- upvalues: var4 (write)
		return var4
	end
	
	function t.nextUpComponentShown() --[[ line: 18 ]]
		-- upvalues: var2 (write)
		var2 = time()
	end
	
	function t.nextUpComponentSortDataLoaded() --[[ line: 22 ]]
		-- upvalues: var3 (write), var4 (write), var2 (write)
		if var3 then
			return
		end
		local var6 = time()
		var3 = var6
		var4 = if var2 then var6 - var2 else 0
	end
	
	local t_1 = {}
	
	function t.getNextUpTileImageTextureLatencies() --[[ line: 35 ]]
		-- upvalues: cryoModule (ref), t_1 (write)
		return cryoModule.Dictionary.values(t_1)
	end
	
	function t.nextUpTileImageTextureLoaded(p0) --[[ line: 39 ]]
		-- upvalues: t_1 (write), var3 (write)
		local var7 = tostring(p0)
		
		if t_1[var7] then
			return
		end
		t_1[var7] = if var3 then time() - var3 else 0
	end
	
	function t.resetNextUpLatencyTelemetry() --[[ line: 50 ]]
		-- upvalues: var3 (write), t_1 (write), var2 (write), var4 (write)
		var3 = nil
		t_1 = {}
		var2 = nil
		var4 = nil
	end
	
	return t
end
var2 = false

function t.setNextUpTilesLoaded(value) --[[ line: 58 ]]
	-- upvalues: var2 (write)
	var2 = value
end

function t.getNextUpTilesLoaded() --[[ line: 62 ]]
	-- upvalues: var2 (write)
	return var2
end

return t