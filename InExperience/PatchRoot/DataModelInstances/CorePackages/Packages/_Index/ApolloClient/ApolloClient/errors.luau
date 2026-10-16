local ErrorsModule = {}
local Parent = script.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Array = LuauPolyfillModule.Array
local Error = LuauPolyfillModule.Error
local ToJSBooleanFunction = require(script.Parent.utilities.globals.null).toJSBoolean
local DEV = require(Parent.utilities).DEV
require(Parent.jsutils.invariant).invariant(typeof(DEV) == "boolean", (tostring(DEV)))
local _ = require(Parent1.GraphQL)
local IsNonEmptyArrayFunction = require(Parent.utilities).isNonEmptyArray
local HasOwnPropertyModule = require(Parent.luaUtils.hasOwnProperty)
local self = setmetatable({}, { __index = Error })
self.__index = self

function ErrorsModule.isApolloError(p1) --[[ Line: 43 ]]
	-- upvalues: HasOwnPropertyModule (copy)
	return HasOwnPropertyModule(p1, "graphQLErrors")
end

local function generateErrorMessage(NewResult): string --[[ Line: 49 ]]
	-- upvalues: IsNonEmptyArrayFunction (copy), Array (copy), Boolean (copy), ToJSBooleanFunction (copy)
	local Text = ""
	
	if IsNonEmptyArrayFunction(NewResult.graphQLErrors) and IsNonEmptyArrayFunction(NewResult.graphQLErrors) or IsNonEmptyArrayFunction(NewResult.clientErrors) then
		local ConcatFunction = Array.concat
		local GraphQLErrors = Boolean.toJSBoolean(NewResult.graphQLErrors) and NewResult.graphQLErrors or {}
		local ClientErrors = Boolean.toJSBoolean(NewResult.clientErrors) and NewResult.clientErrors or {}
		for _, value in pairs((ConcatFunction(GraphQLErrors, ClientErrors))) do
			Text ..= ("%s\n"):format(if ToJSBooleanFunction(value) then value.message else "Error message not found.")
		end
	end
	if NewResult.networkError ~= nil then
		local NetworkError = NewResult.networkError
		Text ..= ("%s\n"):format(if typeof(NetworkError) == "string" then NetworkError elseif NetworkError.message then NetworkError.message else NetworkError.error)
	end
	return (string.gsub(Text, "\n$", ""))
end

function self.new(ErrorMessage) --[[ Line: 104 ]]
	-- upvalues: Error (copy), Boolean (copy), generateErrorMessage (copy), self (copy)
	local GraphQLErrors = ErrorMessage.graphQLErrors
	local ClientErrors = ErrorMessage.clientErrors
	local NetworkError = ErrorMessage.networkError
	local ErrorMessage1 = ErrorMessage.errorMessage
	local ExtraInfo = ErrorMessage.extraInfo
	local NewError = Error.new(ErrorMessage1)
	NewError.graphQLErrors = Boolean.toJSBoolean(GraphQLErrors) and GraphQLErrors or {}
	NewError.clientErrors = Boolean.toJSBoolean(ClientErrors) and ClientErrors or {}
	NewError.networkError = Boolean.toJSBoolean(NetworkError) and NetworkError or nil
	NewError.message = Boolean.toJSBoolean(ErrorMessage1) and ErrorMessage1 or generateErrorMessage(NewError)
	NewError.extraInfo = ExtraInfo
	
	return (setmetatable(NewError, self))
end

ErrorsModule.ApolloError = self

return ErrorsModule