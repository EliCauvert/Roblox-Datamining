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
		local var1 = parent.Parent:FindFirstChild(v)
		
		if var1 then
			table.insert(t, var1:GetFullName():gsub("^game%.", ""))
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

local function buildStackString(p1)
	-- upvalues: getReactPackagePrefixes (ref)
	local var1 = ""
	local var2 = false
	local var3 = false
	
	for i_1 = p1 + 1, 1e999 do
		local debugInfo, debugInfo_1, debugInfo_2 = debug.info(i_1, "sln")
		
		if not debugInfo then break end
		if debugInfo == "[C]" then
			continue
		end
		if not var2 then
			local var4
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var4 = true
					var3 = not var4
					var2 = true
				end
			end
			var4 = false
		end
		if var3 then
			local var5
			for i, v in getReactPackagePrefixes() do
				if string.sub(debugInfo, 1, #v) == v then
					var5 = true
					if not var5 then
						var1 ..= `{debugInfo}:{debugInfo_1} function {debugInfo_2 or "?"}\n`
					end
				end
			end
			var5 = false
		end
	end
	return string.gsub(var1, "\n$", "")
end

return {
	__ERROR_DIVIDER = "\n------ Error caught by React ------\n",
	describeError = function(p1)
		-- upvalues: luauPolyfillModule (ref), filterInternalStackFrames (ref), buildStackString (ref)
		if typeof(p1) ~= "string" then
			return p1
		end
		local _, matchIndex = string.find(p1, ":[%d]+: ")
		local var1 = luauPolyfillModule.Error.new(if matchIndex then string.sub(p1, matchIndex + 1) else p1)
		
		if filterInternalStackFrames then
			var1.stack = buildStackString(2)
			
			return var1
		end
		var1.stack = debug.traceback(nil, 2)
		
		return var1
	end,
	errorToString = function(p1)
		-- upvalues: inspect (ref)
		local _ = nil
		
		return if typeof(p1) == "table" then if p1.message and p1.stack then "\n------ Error caught by React ------\n" .. p3.message .. "\n------ Error caught by React ------\n" .. tostring(p1.stack) else inspect(p1) else inspect(p1)
	end,
	parseReactError = function(p1)
		-- upvalues: error (ref)
		local parts = string.split(p1, "\n------ Error caught by React ------\n")
		
		if #parts == 3 then
			local unpacked, unpacked_1, unpacked_2 = table.unpack(parts)
			local var1 = error.new(unpacked_1)
			var1.stack = unpacked_2
			
			return var1, unpacked
		end
		local var2 = error.new(p1)
		var2.stack = nil
		
		return var2, ""
	end
}