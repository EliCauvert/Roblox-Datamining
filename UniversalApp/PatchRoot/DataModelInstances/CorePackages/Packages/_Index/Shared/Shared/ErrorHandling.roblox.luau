local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local inspect = luauPolyfillModule.util.inspect
local filterInternalStackFrames = require(script.Parent.ReactFeatureFlags).filterInternalStackFrames
local list = {
	"React", "ReactDevtoolsShared", "ReactNoopRenderer", "ReactReconciler",
	"ReactRefresh", "ReactRoblox", "RoactCompat", "Scheduler", "Shared"
}
local var2 = nil

local function getReactPackagePrefixes()
	-- upvalues: var2 (write), list (ref), parent (ref)
	if var2 then
		return var2
	end
	local t = {}
	
	for i, v in list do
		local var6 = parent.Parent:FindFirstChild(v)
		
		if var6 then
			table.insert(t, var6:GetFullName():gsub("^game%.", ""))
		end
	end
	var2 = t
	
	return t
end

local function _(p0)
	-- upvalues: getReactPackagePrefixes (ref)
	for i, v in getReactPackagePrefixes() do
		if string.sub(p0, 1, #v) == v then
			return true
		end
	end
	return false
end

local function buildStackString(p1)
	-- upvalues: getReactPackagePrefixes (ref)
	local var7 = ""
	local var8 = false
	local var9 = false
	
	for i_1 = p1 + 1, 1e999 do
		local debugInfo, debugInfo_1, debugInfo_2 = debug.info(i_1, "sln")
		
		if not debugInfo then break end
		if debugInfo == "[C]" then
			continue
		end
		if not var8 then
			local var13
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var13 = true
					var9 = not var13
					var8 = true
				end
			end
			var13 = false
		end
		if var9 then
			local var14
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var14 = true
					if not var14 then
						var7 ..= `{debugInfo}:{debugInfo_1} function {debugInfo_2 or "?"}\n`
					end
				end
			end
			var14 = false
		end
	end
	return string.gsub(var7, "\n$", "")
end

return {
	__ERROR_DIVIDER = "\n------ Error caught by React ------\n",
	describeError = function(p2)
		-- upvalues: luauPolyfillModule (ref), filterInternalStackFrames (ref), buildStackString (ref)
		if typeof(p2) ~= "string" then
			return p2
		end
		local _, matchIndex = string.find(p2, ":[%d]+: ")
		local var16 = luauPolyfillModule.Error.new(if matchIndex then string.sub(p2, matchIndex + 1) else p2)
		
		if filterInternalStackFrames then
			var16.stack = buildStackString(2)
			
			return var16
		end
		var16.stack = debug.traceback(nil, 2)
		
		return var16
	end,
	errorToString = function(p3)
		-- upvalues: inspect (ref)
		local _ = nil
		
		return if typeof(p3) == "table" then if p3.message and p3.stack then "\n------ Error caught by React ------\n" .. p3.message .. "\n------ Error caught by React ------\n" .. tostring(p3.stack) else inspect(p3) else inspect(p3)
	end,
	parseReactError = function(p4)
		-- upvalues: error (ref)
		local parts = string.split(p4, "\n------ Error caught by React ------\n")
		
		if #parts == 3 then
			local unpacked, unpacked_1, unpacked_2 = table.unpack(parts)
			local var21 = error.new(unpacked_1)
			var21.stack = unpacked_2
			
			return var21, unpacked
		end
		local var22 = error.new(p4)
		var22.stack = nil
		
		return var22, ""
	end
}