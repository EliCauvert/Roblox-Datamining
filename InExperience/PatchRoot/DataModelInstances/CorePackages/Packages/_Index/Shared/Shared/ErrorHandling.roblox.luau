local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Error = LuauPolyfillModule.Error
local InspectFunction = LuauPolyfillModule.util.inspect
local FilterInternalStackFrames = require(script.Parent.ReactFeatureFlags).filterInternalStackFrames
local ChildNames = {
	"React", "ReactDevtoolsShared", "ReactNoopRenderer", "ReactReconciler",
	"ReactRefresh", "ReactRoblox", "RoactCompat", "Scheduler", "Shared"
}
local v1 = nil

local function getReactPackagePrefixes()
	-- upvalues: v1 (ref), ChildNames (copy), Parent (copy)
	if _G.ENVIRONMENT == "PRODUCTION" then
		return {}
	end
	if v1 then
		return v1
	end
	local Games = {}
	
	for _, childName in ChildNames do
		local Child = Parent.Parent:FindFirstChild(childName)
		
		if Child then
			table.insert(Games, (Child:GetFullName():gsub("^game%.", "")))
		end
	end
	v1 = Games
	
	return Games
end

local function _(Text: string): boolean
	-- upvalues: getReactPackagePrefixes (copy)
	for _, value in getReactPackagePrefixes() do
		if string.sub(Text, 1, #value) == value then
			return true
		end
	end
	return false
end

local function buildStackString(p1: number): string
	-- upvalues: getReactPackagePrefixes (copy)
	local Text = ""
	local Flag = false
	local v2 = false
	local Flag1 = nil
	local Flag2 = nil
	
	for i = p1 + 1, 1e999 do
		local DebugInfo, DebugInfo2, DebugInfo3 = debug.info(i, "sln")
		
		if not DebugInfo then break end
		if DebugInfo ~= "[C]" then
			if not Flag then
				Flag2 = false
				
				for _, value in getReactPackagePrefixes() do
					if string.sub(DebugInfo, 1, #value) == value then
						Flag2 = true
						break
					end
				end
				v2 = not Flag2
				Flag = true
			end
			if v2 then
				Flag1 = false
				
				for _, value1 in getReactPackagePrefixes() do
					if string.sub(DebugInfo, 1, #value1) == value1 then
						Flag1 = true
						break
					end
				end
				if Flag1 then
					continue
				end
			end
			Text ..= `{DebugInfo}:{DebugInfo2} function {DebugInfo3 or "?"}\n`
		end
	end
	return (string.gsub(Text, "\n$", ""))
end

return {
	__ERROR_DIVIDER = "\n------ Error caught by React ------\n",
	describeError = function(Text: string)
		-- upvalues: LuauPolyfillModule (copy), FilterInternalStackFrames (copy), buildStackString (copy)
		if typeof(Text) ~= "string" then
			return Text
		end
		local _, EndIndex = string.find(Text, ":[%d]+: ")
		local NewResult = LuauPolyfillModule.Error.new(if EndIndex then string.sub(Text, EndIndex + 1) else Text)
		
		if FilterInternalStackFrames then
			NewResult.stack = buildStackString(2)
			
			return NewResult
		else
			NewResult.stack = debug.traceback(nil, 2)
			
			return NewResult
		end
	end,
	errorToString = function(p2)
		-- upvalues: InspectFunction (copy)
		return if typeof(p2) == "table" and (p2.message and p2.stack) then "\n------ Error caught by React ------\n" .. p2.message .. "\n------ Error caught by React ------\n" .. tostring(p2.stack) else InspectFunction(p2)
	end,
	parseReactError = function(Text: string)
		-- upvalues: Error (copy)
		local Parts = string.split(Text, "\n------ Error caught by React ------\n")
		
		if #Parts == 3 then
			local Unpacked, Unpacked2, Unpacked3 = table.unpack(Parts)
			local NewError = Error.new(Unpacked2)
			NewError.stack = Unpacked3
			
			return NewError, Unpacked
		else
			local NewError = Error.new(Text)
			NewError.stack = nil
			
			return NewError, ""
		end
	end
}