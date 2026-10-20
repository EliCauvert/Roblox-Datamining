local ReactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local _ = require(script.Parent.ReactElementType)
local _ = require(script.Parent["flowtypes.roblox"])
local ReactSymbolsModule = require(script.Parent.ReactSymbols)
local REACTSUSPENSETYPE = ReactSymbolsModule.REACT_SUSPENSE_TYPE
local REACTSUSPENSELISTTYPE = ReactSymbolsModule.REACT_SUSPENSE_LIST_TYPE
local REACTFORWARDREFTYPE = ReactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACTMEMOTYPE = ReactSymbolsModule.REACT_MEMO_TYPE
local REACTBLOCKTYPE = ReactSymbolsModule.REACT_BLOCK_TYPE
local REACTLAZYTYPE = ReactSymbolsModule.REACT_LAZY_TYPE
local ConsolePatchingDevRobloxModule = require(script.Parent["ConsolePatchingDev.roblox"])
local DisableLogsFunction = ConsolePatchingDevRobloxModule.disableLogs
local ReenableLogsFunction = ConsolePatchingDevRobloxModule.reenableLogs
local ReactCurrentDispatcher = require(script.Parent.ReactSharedInternals).ReactCurrentDispatcher
local Callback = nil
local describeFunctionComponentFrame = nil

local function _(Callback)
	return if type(Callback) == "function" then debug.info(Callback, "n") elseif type(Callback) == "table" then tostring(Callback) else nil
end

local function describeBuiltInComponentFrame(REACTSUSPENSELISTTYPE, p1, Callback1)
	-- upvalues: ReactGlobalsModule (copy), Callback (ref)
	return Callback(REACTSUSPENSELISTTYPE, p1, if ReactGlobalsModule.__DEV__ and Callback1 then if type(Callback1) == "function" then debug.info(Callback1, "n") elseif type(Callback1) == "table" then tostring(Callback1) else nil else nil)
end

local Flag = false
local self = if ReactGlobalsModule.__DEV__ then setmetatable({}, { __mode = "k" }) else nil

local function describeNativeComponentFrame(Callback1, p1)
	-- upvalues: Flag (ref), ReactGlobalsModule (copy), self (ref), ReactCurrentDispatcher (copy), DisableLogsFunction (copy), ReenableLogsFunction (copy), Callback (ref)
	if not Callback1 or Flag then
		return ""
	end
	if ReactGlobalsModule.__DEV__ then
		local SelfEntry = self[Callback1]
		
		if SelfEntry ~= nil then
			return SelfEntry
		end
	end
	local v1 = nil
	Flag = true
	local Current = nil
	
	if ReactGlobalsModule.__DEV__ then
		Current = ReactCurrentDispatcher.current
		ReactCurrentDispatcher.current = nil
		DisableLogsFunction()
	end
	local Stack = nil
	local _, Result = xpcall(function()
		-- upvalues: p1 (copy), Stack (ref), v1 (ref), Callback1 (copy)
		if not p1 then
			local _, Result = pcall(function()
				-- upvalues: Stack (upval)
				Stack = debug.traceback()
				error({ stack = Stack })
			end)
			v1 = Result
			Callback1()
			
			return
		end
	end, function(Err)
		-- upvalues: Stack (ref)
		return { message = Err, stack = Stack }
	end)
	local v2: string? = nil
	
	if Result and v1 and type(Result.stack) == "string" then
		local Parts = string.split(Result.stack, "\n")
		local Parts1 = string.split(v1.stack, "\n")
		local Count = #Parts - 1
		local Count1 = #Parts1 - 1
		while Count >= 2 and (Count1 >= 0 and Parts[Count] ~= Parts1[Count1]) do
			Count1 -= 1
		end
		while Count >= 3 and Count1 >= 1 do
			Count -= 1
			Count1 -= 1
			
			if Parts[Count] == Parts1[Count1] then continue end
			if Count == 1 and Count1 == 1 then break end
			repeat
				Count -= 1
				Count1 -= 1
				if Count1 < 0 or Parts[Count] ~= Parts1[Count1] then
					local Text = "\n" .. "    in " .. Parts[Count]
					
					if ReactGlobalsModule.__DEV__ then
						self[Callback1] = Text
					end
					v2 = Text
				end
			until Count < 3 or Count1 < 1
			break
		end
	end
	Flag = false
	
	if ReactGlobalsModule.__DEV__ then
		ReactCurrentDispatcher.current = Current
		ReenableLogsFunction()
	end
	if v2 ~= nil then
		return v2
	end
	local DebugInfo = if type(Callback1) == "function" then debug.info(Callback1, "n") elseif type(Callback1) == "table" then tostring(Callback1) else ""
	local v3 = ""
	
	if DebugInfo ~= nil and DebugInfo ~= "" then
		local _ = ReactGlobalsModule.__DEV__
		v3 = Callback(DebugInfo, nil, nil)
	end
	if ReactGlobalsModule.__DEV__ then
		self[Callback1] = v3
	end
	return v3
end

Callback = function(DebugInfo, p2, DebugInfo1): string
	-- upvalues: ReactGlobalsModule (copy)
	local Text = ""
	
	if ReactGlobalsModule.__DEV__ and p2 then
		local FileName: string = p2.fileName
		local Replaced = string.gsub(FileName, "^(.*)[\\/]", "")
		
		if string.match(Replaced, "^init%.") then
			local Match: string? = string.match(FileName, "^(.*)[\\/]")
			
			if Match and #Match ~= 0 then
				Replaced = string.gsub(Match, "^(.*)[\\/]", "") .. "/" .. Replaced
			end
		end
		Text = " (at " .. Replaced .. ":" .. p2.lineNumber .. ")"
	elseif DebugInfo1 then
		Text = " (created by " .. DebugInfo1 .. ")"
	end
	return "\n    in " .. (DebugInfo or "Unknown") .. Text
end

local function describeClassComponentFrame(REACTSUSPENSELISTTYPE, p2, Callback1)
	-- upvalues: ReactGlobalsModule (copy), Callback (ref)
	return Callback(tostring(REACTSUSPENSELISTTYPE), p2, if ReactGlobalsModule.__DEV__ and Callback1 then if type(Callback1) == "function" then debug.info(Callback1, "n") elseif type(Callback1) == "table" then tostring(Callback1) else nil else nil)
end

describeFunctionComponentFrame = function(Callback1, p2, Callback2)
	-- upvalues: ReactGlobalsModule (copy), Callback (ref)
	return if Callback1 then Callback(if type(Callback1) == "function" then debug.info(Callback1, "n") else tostring(Callback1), p2, if ReactGlobalsModule.__DEV__ and Callback2 then if type(Callback2) == "function" then debug.info(Callback2, "n") elseif type(Callback2) == "table" then tostring(Callback2) else nil else nil) else ""
end

local function describeUnknownElementTypeFrameInDEV(Callback, p2, p3)
	-- upvalues: ReactGlobalsModule (copy), describeClassComponentFrame (copy), describeFunctionComponentFrame (ref), describeBuiltInComponentFrame (copy), REACTSUSPENSETYPE (copy), REACTSUSPENSELISTTYPE (copy), REACTFORWARDREFTYPE (copy), REACTMEMOTYPE (copy), describeUnknownElementTypeFrameInDEV (copy), REACTBLOCKTYPE (copy), REACTLAZYTYPE (copy)
	if not ReactGlobalsModule.__DEV__ then
		return ""
	end
	if Callback == nil then
		return ""
	end
	if type(Callback) == "table" and type(Callback.__ctor) == "function" then
		return describeClassComponentFrame(Callback, p2, p3)
	end
	if type(Callback) == "function" then
		return describeFunctionComponentFrame(Callback, p2, p3)
	end
	if type(Callback) == "string" then
		return describeBuiltInComponentFrame(Callback, p2, p3)
	end
	if Callback == REACTSUSPENSETYPE then
		return describeBuiltInComponentFrame("Suspense", p2, p3)
	end
	if Callback == REACTSUSPENSELISTTYPE then
		return describeBuiltInComponentFrame("SuspenseList", p2, p3)
	end
	if type(Callback) == "table" then
		local Typeof = Callback["$$typeof"]
		
		if Typeof == REACTFORWARDREFTYPE then
			return describeFunctionComponentFrame(Callback.render, p2, p3)
		end
		if Typeof == REACTMEMOTYPE then
			return describeUnknownElementTypeFrameInDEV(Callback.type, p2, p3)
		end
		if Typeof == REACTBLOCKTYPE then
			return describeFunctionComponentFrame(Callback._render, p2, p3)
		end
		if Typeof == REACTLAZYTYPE then
			local Payload = Callback._payload
			local InitFunction = Callback._init
			local Success, Result = pcall(function()
				-- upvalues: describeUnknownElementTypeFrameInDEV (upval), InitFunction (copy), Payload (copy), p2 (copy), p3 (copy)
				describeUnknownElementTypeFrameInDEV(InitFunction(Payload), p2, p3)
			end)
			
			if Success then
				return Result
			end
		end
	end
	return ""
end

return {
	describeComponentFrame = Callback,
	describeBuiltInComponentFrame = describeBuiltInComponentFrame,
	describeNativeComponentFrame = describeNativeComponentFrame,
	describeClassComponentFrame = describeClassComponentFrame,
	describeFunctionComponentFrame = describeFunctionComponentFrame,
	describeUnknownElementTypeFrameInDEV = describeUnknownElementTypeFrameInDEV
}