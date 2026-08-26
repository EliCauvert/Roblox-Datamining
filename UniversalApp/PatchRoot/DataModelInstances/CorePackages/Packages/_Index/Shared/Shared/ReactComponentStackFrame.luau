local reactGlobalsModule = require(script.Parent.Parent.ReactGlobals)
local _ = require(script.Parent.ReactElementType)
local _ = require(script.Parent["flowtypes.roblox"])
local reactSymbolsModule = require(script.Parent.ReactSymbols)
local REACT_SUSPENSE_TYPE = reactSymbolsModule.REACT_SUSPENSE_TYPE
local REACT_SUSPENSE_LIST_TYPE = reactSymbolsModule.REACT_SUSPENSE_LIST_TYPE
local REACT_FORWARD_REF_TYPE = reactSymbolsModule.REACT_FORWARD_REF_TYPE
local REACT_MEMO_TYPE = reactSymbolsModule.REACT_MEMO_TYPE
local REACT_BLOCK_TYPE = reactSymbolsModule.REACT_BLOCK_TYPE
local REACT_LAZY_TYPE = reactSymbolsModule.REACT_LAZY_TYPE
local unknownModule = require(script.Parent["ConsolePatchingDev.roblox"])
local disableLogs = unknownModule.disableLogs
local reenableLogs = unknownModule.reenableLogs
local reactCurrentDispatcher = require(script.Parent.ReactSharedInternals).ReactCurrentDispatcher
local describeComponentFrame = nil
local _ = nil

local function _(p1)
	return if type(p1) == "function" then debug.info(p1, "n") elseif type(p1) == "table" then tostring(p1) else nil
end

local function describeBuiltInComponentFrame(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return describeComponentFrame(p1, p2, if reactGlobalsModule.__DEV__ and p3 then if type(p3) == "function" then debug.info(p3, "n") elseif type(p3) == "table" then tostring(p3) else nil else nil)
end

local var1 = false
local var2 = if reactGlobalsModule.__DEV__ then setmetatable({}, { __mode = "k" }) else nil

local function describeNativeComponentFrame(p1, p2)
	-- upvalues: var1 (write), reactGlobalsModule (ref), var2 (write), reactCurrentDispatcher (ref), disableLogs (ref), reenableLogs (ref), describeComponentFrame (write)
	if not p1 or var1 then
		return ""
	elseif reactGlobalsModule.__DEV__ then
		local var3 = var2[p1]
		
		if var3 ~= nil then
			return var3
		end
	end
	local var4 = nil
	var1 = true
	local current = nil
	
	if reactGlobalsModule.__DEV__ then
		current = reactCurrentDispatcher.current
		reactCurrentDispatcher.current = nil
		disableLogs()
	end
	local var5 = nil
	local _, status = xpcall(function()
		-- upvalues: p2 (ref), var5 (write), var4 (write), p1 (ref)
		if p2 then
			return
		end
		local _, status = pcall(function()
			-- upvalues: var5 (copy)
			var5 = debug.traceback()
			error({ stack = var5 })
		end)
		var4 = status
		p1()
	end, function(p3)
		-- upvalues: var5 (write)
		return { message = p3, stack = var5 }
	end)
	local var6 = nil
	var1 = false
	
	if reactGlobalsModule.__DEV__ then
		reactCurrentDispatcher.current = current
		reenableLogs()
	end
	if var6 ~= nil then
		return var6
	end
	local var7 = if type(p1) == "function" then debug.info(p1, "n") elseif type(p1) == "table" then tostring(p1) else ""
	local var8 = ""
	
	if var7 ~= nil and var7 ~= "" then
		local dEV = reactGlobalsModule.__DEV__
		var8 = describeComponentFrame(var7, nil, nil)
	end
	if reactGlobalsModule.__DEV__ then
		var2[p1] = var8
	end
	return var8
end

describeComponentFrame = function(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref)
	local var3 = ""
	
	if reactGlobalsModule.__DEV__ and p2 then
		local fileName = p2.fileName
		local replaced = string.gsub(fileName, "^(.*)[\\/]", "")
		
		if string.match(replaced, "^init%.") then
			local match = string.match(fileName, "^(.*)[\\/]")
			
			if match and #match ~= 0 then
				replaced = string.gsub(match, "^(.*)[\\/]", "") .. "/" .. replaced
			end
		end
		var3 = " (at " .. replaced .. ":" .. p8.lineNumber .. ")"
	elseif p3 then
		var3 = " (created by " .. p9 .. ")"
	end
	return "\n    in " .. (p1 or "Unknown") .. var21
end

local function describeClassComponentFrame(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return describeComponentFrame(tostring(p1), p2, if reactGlobalsModule.__DEV__ and p3 then if type(p3) == "function" then debug.info(p3, "n") elseif type(p3) == "table" then tostring(p3) else nil else nil)
end

local function describeFunctionComponentFrame(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return if p1 then describeComponentFrame(if type(p1) == "function" then debug.info(p1, "n") else tostring(p1), p2, if reactGlobalsModule.__DEV__ and p3 then if type(p3) == "function" then debug.info(p3, "n") elseif type(p3) == "table" then tostring(p3) else nil else nil) else ""
end

local function describeUnknownElementTypeFrameInDEV(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), describeClassComponentFrame (ref), describeFunctionComponentFrame (write), describeBuiltInComponentFrame (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_MEMO_TYPE (ref), describeUnknownElementTypeFrameInDEV (ref), REACT_BLOCK_TYPE (ref), REACT_LAZY_TYPE (ref)
	if not reactGlobalsModule.__DEV__ then
		return ""
	elseif p1 == nil then
		return ""
	elseif type(p1) == "table" and type(p1.__ctor) == "function" then
		return describeClassComponentFrame(p1, p2, p3)
	elseif type(p1) == "function" then
		return describeFunctionComponentFrame(p1, p2, p3)
	elseif type(p1) == "string" then
		return describeBuiltInComponentFrame(p1, p2, p3)
	elseif p1 == REACT_SUSPENSE_TYPE then
		return describeBuiltInComponentFrame("Suspense", p2, p3)
	elseif p1 == REACT_SUSPENSE_LIST_TYPE then
		return describeBuiltInComponentFrame("SuspenseList", p2, p3)
	elseif type(p1) == "table" then
		local var3 = p1["$$typeof"]
		
		if var3 == REACT_FORWARD_REF_TYPE then
			return describeFunctionComponentFrame(p1.render, p2, p3)
		elseif var3 == REACT_MEMO_TYPE then
			return describeUnknownElementTypeFrameInDEV(p1.type, p2, p3)
		elseif var3 == REACT_BLOCK_TYPE then
			return describeFunctionComponentFrame(p1._render, p2, p3)
		elseif var3 == REACT_LAZY_TYPE then
			local payload = p1._payload
			local init = p1._init
			local ok, status = pcall(function()
				-- upvalues: describeUnknownElementTypeFrameInDEV (copy), init (ref), payload (ref), p2 (ref), p3 (ref)
				describeUnknownElementTypeFrameInDEV(init(payload), p2, p3)
			end)
			
			return if ok then status else ""
		end
	end
end

return {
	describeComponentFrame = describeComponentFrame,
	describeBuiltInComponentFrame = describeBuiltInComponentFrame,
	describeNativeComponentFrame = describeNativeComponentFrame,
	describeClassComponentFrame = describeClassComponentFrame,
	describeFunctionComponentFrame = describeFunctionComponentFrame,
	describeUnknownElementTypeFrameInDEV = describeUnknownElementTypeFrameInDEV
}