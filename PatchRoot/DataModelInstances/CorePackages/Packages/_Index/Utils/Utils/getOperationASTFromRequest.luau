-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local getOperationAST = require(parent.GraphQL).getOperationAST
local _ = require(script.Parent.Interfaces)
local memoize1 = require(script.Parent.memoize).memoize1

local function getOperationASTFromDocument(p0, p1) --[[ line: 26 ]]
	-- upvalues: getOperationAST (ref), boolean (ref), error (ref)
	local var3 = getOperationAST(p0, p1)
	
	if not boolean.toJSBoolean(var3) then
		error(error.new(("Cannot infer operation %s"):format(tostring(if boolean.toJSBoolean(p1) then p1 else ""))))
	end
	return var3
end

t.getOperationASTFromDocument = getOperationASTFromDocument
t.getOperationASTFromRequest = memoize1(function(p2) --[[ line: 43 ]]
	-- upvalues: getOperationASTFromDocument (ref)
	return getOperationASTFromDocument(p2.document, p2.operationName)
end)

return t