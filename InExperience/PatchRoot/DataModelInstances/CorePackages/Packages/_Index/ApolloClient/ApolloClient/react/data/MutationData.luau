local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local EqualModule = require(Parent.jsutils.equal)
local DocumentType = require(script.Parent.Parent.parser).DocumentType
local ApolloError = require(Parent.errors).ApolloError
local _ = require(script.Parent.Parent.types.types)
local OperationData = require(script.Parent.OperationData).OperationData
local MergeOptionsFunction = require(Parent.core).mergeOptions
local _ = require(Parent.link.core)
local self = setmetatable({}, { __index = OperationData })
self.__index = self

function self.new(Options) --[[ Line: 83 ]]
	-- upvalues: OperationData (copy), Boolean (copy), DocumentType (copy), self (copy)
	local NewOperationData = OperationData.new(Options.options, Options.context)
	
	function NewOperationData.runMutation(p1) --[[ Line: 92 ]]
		-- upvalues: NewOperationData (copy), Boolean (upval)
		if p1 == nil then
			p1 = {}
		end
		NewOperationData:onMutationStart()
		local NewMutationId = NewOperationData:generateNewMutationId()
		
		return NewOperationData:mutate(p1):andThen(function(Result) --[[ Line: 100 ]]
			-- upvalues: NewOperationData (upval), NewMutationId (copy)
			NewOperationData:onMutationCompleted(Result, NewMutationId)
			
			return Result
		end):catch(function(Err) --[[ Line: 104 ]]
			-- upvalues: NewOperationData (upval), NewMutationId (copy), Boolean (upval)
			local Options = NewOperationData:getOptions()
			local OnErrorFunction: (any, any) -> () = Options.onError
			NewOperationData:onMutationError(Err, NewMutationId)
			
			if not Boolean.toJSBoolean(OnErrorFunction) then
				error(Err)
				
				return
			end
			OnErrorFunction(Options, Err)
			
			return { data = nil, errors = Err }
		end)
	end
	
	NewOperationData:verifyDocumentType(Options.options.mutation, DocumentType.Mutation)
	NewOperationData.result = Options.result
	NewOperationData.setResult = Options.setResult
	NewOperationData.mostRecentMutationId = 0
	
	return (setmetatable(NewOperationData, self))
end

function self:execute(p1) --[[ Line: 127 ]]
	-- upvalues: DocumentType (copy), Object (copy)
	self.isMounted = true
	self:verifyDocumentType(self:getOptions().mutation, DocumentType.Mutation)
	
	return {
		self.runMutation,
		Object.assign({}, p1, { client = self:refreshClient().client })
	}
end

function self:afterExecute() --[[ Line: 133 ]]
	self.isMounted = true
	
	return function(...) --[[ Line: 135 ]]
		-- upvalues: self (copy)
		return self:unmount(...)
	end
end

function self:cleanup() --[[ Line: 140 ]] end

function self:mutate(p1) --[[ Line: 144 ]]
	-- upvalues: MergeOptionsFunction (copy)
	return self:refreshClient().client:mutate(MergeOptionsFunction(self:getOptions(), p1))
end

function self:onMutationStart() --[[ Line: 148 ]]
	if not self.result.loading and not self:getOptions().ignoreResults then
		self:updateResult({ loading = true, error = nil, data = nil, called = true })
	end
end

function self:onMutationCompleted(p1, NewMutationId) --[[ Line: 160 ]]
	-- upvalues: ApolloError (copy), Boolean (copy)
	local Options = self:getOptions()
	local OnCompletedFunction = Options.onCompleted
	local IgnoreResults = Options.ignoreResults
	local Data = p1.data
	local Errors = p1.errors
	local NewApolloError = if Errors and #Errors > 0 then ApolloError.new({ graphQLErrors = Errors }) else nil
	
	local function _() --[[ Line: 172 | Named "callOncomplete" ]]
		-- upvalues: Boolean (upval), OnCompletedFunction (copy), Data (copy)
		return if Boolean.toJSBoolean(OnCompletedFunction) then OnCompletedFunction(Data) else nil
	end
	
	if self:isMostRecentMutation(NewMutationId) and not IgnoreResults then
		self:updateResult({
			called = true,
			loading = false,
			data = Data,
			error = NewApolloError
		})
	end
	if Boolean.toJSBoolean(OnCompletedFunction) then
		local _ = OnCompletedFunction(Data)
		
		return
	end
end

function self:onMutationError(Errors, NewMutationId) --[[ Line: 191 ]]
	if self:isMostRecentMutation(NewMutationId) then
		self:updateResult({
			loading = false,
			data = nil,
			called = true,
			error = Errors
		})
	end
end

function self:generateNewMutationId() --[[ Line: 202 ]]
	self.mostRecentMutationId += 1
	
	return self.mostRecentMutationId
end

function self:isMostRecentMutation(MostRecentMutationId): boolean --[[ Line: 207 ]]
	return self.mostRecentMutationId == MostRecentMutationId
end

function self:updateResult(PreviousResult) --[[ Line: 211 ]]
	-- upvalues: EqualModule (copy)
	if self.isMounted and (not self.previousResult or not EqualModule(self.previousResult, PreviousResult)) then
		self:setResult(PreviousResult)
		self.previousResult = PreviousResult
		
		return PreviousResult
	else
		return nil
	end
end

return { MutationData = self }