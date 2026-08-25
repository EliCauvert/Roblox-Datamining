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

local function _(p0)
	return if type(p0) == "function" then debug.info(p0, "n") elseif type(p0) == "table" then tostring(p0) else nil
end

local function describeBuiltInComponentFrame(p1, p2, p3)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return describeComponentFrame(p1, p2, if reactGlobalsModule.__DEV__ and p3 then if type(p3) == "function" then debug.info(p3, "n") elseif type(p3) == "table" then tostring(p3) else nil else nil)
end

local var5 = false
local var6 = if reactGlobalsModule.__DEV__ then setmetatable({}, { __mode = "k" }) else nil

local function describeNativeComponentFrame(p4, p5)
	-- upvalues: var5 (write), reactGlobalsModule (ref), var6 (write), reactCurrentDispatcher (ref), disableLogs (ref), reenableLogs (ref), describeComponentFrame (write)
	if not p4 or var5 then
		return ""
	elseif reactGlobalsModule.__DEV__ then
		local var11 = var6[p4]
		
		if var11 ~= nil then
			return var11
		end
	end
	local var12 = nil
	var5 = true
	local current = nil
	
	if reactGlobalsModule.__DEV__ then
		current = reactCurrentDispatcher.current
		reactCurrentDispatcher.current = nil
		disableLogs()
	end
	local var13 = nil
	local _, status = xpcall(function()
		-- upvalues: p5 (ref), var13 (write), var12 (write), p4 (ref)
		if p5 then
			return
		end
		local _, status = pcall(function()
			-- upvalues: var13 (copy)
			var13 = debug.traceback()
			error({ stack = var13 })
		end)
		var12 = status
		p4()
	end, function(p6)
		-- upvalues: var13 (write)
		return { message = p6, stack = var13 }
	end)
	local var14 = nil
	var5 = false
	
	if reactGlobalsModule.__DEV__ then
		reactCurrentDispatcher.current = current
		reenableLogs()
	end
	if var14 ~= nil then
		return var14
	end
	local var15 = if type(p4) == "function" then debug.info(p4, "n") elseif type(p4) == "table" then tostring(p4) else ""
	local var16 = ""
	
	if var15 ~= nil and var15 ~= "" then
		local dEV = reactGlobalsModule.__DEV__
		var16 = describeComponentFrame(var15, nil, nil)
	end
	if reactGlobalsModule.__DEV__ then
		var6[p4] = var16
	end
	return var16
end

describeComponentFrame = function(p7, p8, p9)
	-- upvalues: reactGlobalsModule (ref)
	local var21 = ""
	
	if reactGlobalsModule.__DEV__ and p8 then
		local fileName = p8.fileName
		local replaced = string.gsub(fileName, "^(.*)[\\/]", "")
		
		if string.match(replaced, "^init%.") then
			local match = string.match(fileName, "^(.*)[\\/]")
			
			if match and #match ~= 0 then
				replaced = string.gsub(match, "^(.*)[\\/]", "") .. "/" .. replaced
			end
		end
		var21 = " (at " .. replaced .. ":" .. p8.lineNumber .. ")"
	elseif p9 then
		var21 = " (created by " .. p9 .. ")"
	end
	return "\n    in " .. (p7 or "Unknown") .. var21
end

local function describeClassComponentFrame(p10, p11, p12)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return describeComponentFrame(tostring(p10), p11, if reactGlobalsModule.__DEV__ and p12 then if type(p12) == "function" then debug.info(p12, "n") elseif type(p12) == "table" then tostring(p12) else nil else nil)
end

local function describeFunctionComponentFrame(p13, p14, p15)
	-- upvalues: reactGlobalsModule (ref), describeComponentFrame (write)
	return if p13 then describeComponentFrame(if type(p13) == "function" then debug.info(p13, "n") else tostring(p13), p14, if reactGlobalsModule.__DEV__ and p15 then if type(p15) == "function" then debug.info(p15, "n") elseif type(p15) == "table" then tostring(p15) else nil else nil) else ""
end

local function describeUnknownElementTypeFrameInDEV(p16, p17, p18)
	-- upvalues: reactGlobalsModule (ref), describeClassComponentFrame (ref), describeFunctionComponentFrame (write), describeBuiltInComponentFrame (ref), REACT_SUSPENSE_TYPE (ref), REACT_SUSPENSE_LIST_TYPE (ref), REACT_FORWARD_REF_TYPE (ref), REACT_MEMO_TYPE (ref), describeUnknownElementTypeFrameInDEV (ref), REACT_BLOCK_TYPE (ref), REACT_LAZY_TYPE (ref)
	if not reactGlobalsModule.__DEV__ then
		return ""
	elseif p16 == nil then
		return ""
	elseif type(p16) == "table" and type(p16.__ctor) == "function" then
		return describeClassComponentFrame(p16, p17, p18)
	elseif type(p16) == "function" then
		return describeFunctionComponentFrame(p16, p17, p18)
	elseif type(p16) == "string" then
		return describeBuiltInComponentFrame(p16, p17, p18)
	elseif p16 == REACT_SUSPENSE_TYPE then
		return describeBuiltInComponentFrame("Suspense", p17, p18)
	elseif p16 == REACT_SUSPENSE_LIST_TYPE then
		return describeBuiltInComponentFrame("SuspenseList", p17, p18)
	elseif type(p16) == "table" then
		local var24 = p16["$$typeof"]
		
		if var24 == REACT_FORWARD_REF_TYPE then
			return describeFunctionComponentFrame(p16.render, p17, p18)
		elseif var24 == REACT_MEMO_TYPE then
			return describeUnknownElementTypeFrameInDEV(p16.type, p17, p18)
		elseif var24 == REACT_BLOCK_TYPE then
			return describeFunctionComponentFrame(p16._render, p17, p18)
		elseif var24 == REACT_LAZY_TYPE then
			local payload = p16._payload
			local init = p16._init
			local ok, status = pcall(function()
				-- upvalues: describeUnknownElementTypeFrameInDEV (copy), init (ref), payload (ref), p17 (ref), p18 (ref)
				describeUnknownElementTypeFrameInDEV(init(payload), p17, p18)
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