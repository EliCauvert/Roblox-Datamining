local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local inspect = luauPolyfillModule.util.inspect
local filterInternalStackFrames = require(script.Parent.ReactFeatureFlags).filterInternalStackFrames
local list = {
	"React", "ReactDevtoolsShared", "ReactNoopRenderer", "ReactReconciler",
	"ReactRefresh", "ReactRoblox", "RoactCompat", "Scheduler", "Shared"
}
local var1 = nil

local function getReactPackagePrefixes()
	-- upvalues: var1 (write), list (ref), parent (ref)
	if var1 then
		return var1
	end
	local t = {}
	
	for i, v in list do
		local var2 = parent.Parent:FindFirstChild(v)
		
		if var2 then
			table.insert(t, var2:GetFullName():gsub("^game%.", ""))
		end
	end
	var1 = t
	
	return t
end

local function _(p1)
	-- upvalues: getReactPackagePrefixes (ref)
	for i, v in getReactPackagePrefixes() do
		if string.sub(p1, 1, #v) == v then
			return true
		end
	end
	return false
end

local function buildStackString(p2)
	-- upvalues: getReactPackagePrefixes (ref)
	local var3 = ""
	local var4 = false
	local var5 = false
	
	for i_1 = p2 + 1, 1e999 do
		local debugInfo, debugInfo_1, debugInfo_2 = debug.info(i_1, "sln")
		
		if not debugInfo then break end
		if debugInfo == "[C]" then
			continue
		end
		if not var4 then
			local var6
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var6 = true
					var5 = not var6
					var4 = true
				end
			end
			var6 = false
		end
		if var5 then
			local var7
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var7 = true
					if not var7 then
						var3 ..= `{debugInfo}:{debugInfo_1} function {debugInfo_2 or "?"}\n`
					end
				end
			end
			var7 = false
		end
	end
	return string.gsub(var3, "\n$", "")
end

return {
	__ERROR_DIVIDER = "\n------ Error caught by React ------\n",
	describeError = function(p3)
		-- upvalues: luauPolyfillModule (ref), filterInternalStackFrames (ref), buildStackString (ref)
		if typeof(p3) ~= "string" then
			return p3
		end
		local _, matchIndex = string.find(p3, ":[%d]+: ")
		local var8 = luauPolyfillModule.Error.new(if matchIndex then string.sub(p3, matchIndex + 1) else p3)
		
		if filterInternalStackFrames then
			var8.stack = buildStackString(2)
			
			return var8
		end
		var8.stack = debug.traceback(nil, 2)
		
		return var8
	end,
	errorToString = function(p3)
		-- upvalues: inspect (ref)
		local _ = nil
		
		return if typeof(p3) == "table" then if p3.message and p3.stack then "\n------ Error caught by React ------\n" .. p3.message .. "\n------ Error caught by React ------\n" .. tostring(p3.stack) else inspect(p3) else inspect(p3)
	end,
	parseReactError = function(p3)
		-- upvalues: error (ref)
		local parts = string.split(p3, "\n------ Error caught by React ------\n")
		
		if #parts == 3 then
			local unpacked, unpacked_1, unpacked_2 = table.unpack(parts)
			local var8 = error.new(unpacked_1)
			var8.stack = unpacked_2
			
			return var8, unpacked
		end
		local var9 = error.new(p3)
		var9.stack = nil
		
		return var9, ""
	end
}