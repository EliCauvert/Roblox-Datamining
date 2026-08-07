-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:14 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local array = luauPolyfillModule.Array
local error = luauPolyfillModule.Error
local toJSBoolean = require(script.Parent.utilities.globals.null).toJSBoolean
local DEV = require(parent.utilities).DEV
require(parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", tostring(DEV))
local _ = require(parent_1.GraphQL)
local isNonEmptyArray = require(parent.utilities).isNonEmptyArray
local hasOwnPropertyModule = require(parent.luaUtils.hasOwnProperty)
local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function t.isApolloError(p0) --[[ line: 43 ]]
	-- upvalues: hasOwnPropertyModule (ref)
	return hasOwnPropertyModule(p0, "graphQLErrors")
end

local function generateErrorMessage(p1) --[[ line: 49 ]]
	-- upvalues: isNonEmptyArray (ref), array (ref), boolean (ref), toJSBoolean (ref)
	local var5 = ""
	
	if isNonEmptyArray(p1.graphQLErrors) and isNonEmptyArray(p1.graphQLErrors) or isNonEmptyArray(p1.clientErrors) then
		for i, v in pairs(array.concat(if boolean.toJSBoolean(p1.graphQLErrors) then p1.graphQLErrors else {}, if boolean.toJSBoolean(p1.clientErrors) then p1.clientErrors else {})) do
			var5 ..= ("%s\n"):format(if toJSBoolean(v) then v.message else "Error message not found.")
		end
	end
	if p1.networkError ~= nil then
		local networkError = p1.networkError
		var5 ..= ("%s\n"):format(if typeof(networkError) == "string" then networkError elseif networkError.message then networkError.message else networkError.error)
	end
	return string.gsub(var5, "\n$", "")
end

function tbl.new(p2) --[[ line: 104 ]]
	-- upvalues: error (ref), boolean (ref), generateErrorMessage (ref), tbl (ref)
	local graphQLErrors = p2.graphQLErrors
	local clientErrors = p2.clientErrors
	local networkError = p2.networkError
	local errorMessage = p2.errorMessage
	local extraInfo = p2.extraInfo
	local var6 = error.new(errorMessage)
	var6.graphQLErrors = if boolean.toJSBoolean(graphQLErrors) then graphQLErrors else {}
	var6.clientErrors = if boolean.toJSBoolean(clientErrors) then clientErrors else {}
	var6.networkError = if boolean.toJSBoolean(networkError) then networkError else nil
	var6.message = if boolean.toJSBoolean(errorMessage) then errorMessage else generateErrorMessage(var6)
	var6.extraInfo = extraInfo
	
	return setmetatable(var6, tbl)
end

t.ApolloError = tbl

return t