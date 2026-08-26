local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local equalModule = require(parent.jsutils.equal)
local documentType = require(script.Parent.Parent.parser).DocumentType
local apolloError = require(parent.errors).ApolloError
local _ = require(script.Parent.Parent.types.types)
local operationData = require(script.Parent.OperationData).OperationData
local mergeOptions = require(parent.core).mergeOptions
local _ = require(parent.link.core)
local tbl = setmetatable({}, { __index = operationData })
tbl.__index = tbl

function tbl.new(p1)
	-- upvalues: operationData (ref), boolean (ref), documentType (ref), tbl (ref)
	local var1 = operationData.new(p1.options, p1.context)
	
	function var4.runMutation(p2)
		-- upvalues: var1 (ref), boolean (copy)
		if p2 == nil then
			p2 = {}
		end
		var1:onMutationStart()
		local var2 = var1:generateNewMutationId()
		
		return var1:mutate(p2):andThen(function(p3)
			-- upvalues: var1 (copy), var2 (ref)
			var1:onMutationCompleted(p3, var2)
			
			return p3
		end):catch(function(p3)
			-- upvalues: var1 (copy), var2 (ref), boolean (copy)
			local options = var1:getOptions()
			local onError = options.onError
			var1:onMutationError(p3, var2)
			
			if boolean.toJSBoolean(onError) then
				onError(options, p3)
				
				return { data = nil, errors = p3 }
			end
			error(p3)
		end)
	end
	
	var1:verifyDocumentType(p1.options.mutation, documentType.Mutation)
	var1.result = p1.result
	var1.setResult = p1.setResult
	var1.mostRecentMutationId = 0
	
	return setmetatable(var1, tbl)
end

function tbl:execute(p1)
	-- upvalues: documentType (ref), object (ref)
	self.isMounted = true
	self:verifyDocumentType(self:getOptions().mutation, documentType.Mutation)
	
	return {
		self.runMutation,
		object.assign({}, p1, { client = self:refreshClient().client })
	}
end

function tbl:afterExecute()
	self.isMounted = true
	
	return function(...)
		-- upvalues: self (ref)
		return self:unmount(...)
	end
end

function tbl.cleanup(_) end

function tbl:mutate(p1)
	-- upvalues: mergeOptions (ref)
	return self:refreshClient().client:mutate(mergeOptions(self:getOptions(), p1))
end

function tbl:onMutationStart()
	if not self.result.loading and not self:getOptions().ignoreResults then
		self:updateResult({ loading = true, error = nil, data = nil, called = true })
	end
end

function tbl:onMutationCompleted(p1, p2)
	-- upvalues: apolloError (ref), boolean (ref)
	local options = self:getOptions()
	local onCompleted = options.onCompleted
	local ignoreResults = options.ignoreResults
	local data = p1.data
	local errors = p1.errors
	local var1 = if errors and #errors > 0 then apolloError.new({ graphQLErrors = errors }) else nil
	
	local function _()
		-- upvalues: boolean (copy), onCompleted (ref), data (ref)
		return if boolean.toJSBoolean(onCompleted) then onCompleted(data) else nil
	end
	
	if self:isMostRecentMutation(p2) and not ignoreResults then
		self:updateResult({
			called = true,
			loading = false,
			data = data,
			error = var1
		})
	end
	if boolean.toJSBoolean(onCompleted) then
		local _ = onCompleted(data)
		
		return
	end
end

function tbl:onMutationError(p1, p2)
	if self:isMostRecentMutation(p2) then
		self:updateResult({ loading = false, data = nil, called = true, error = p1 })
	end
end

function tbl:generateNewMutationId()
	self.mostRecentMutationId += 1
	
	return self.mostRecentMutationId
end

function tbl:isMostRecentMutation(p1)
	return self.mostRecentMutationId == p1
end

function tbl:updateResult(p1)
	-- upvalues: equalModule (ref)
	if self.isMounted and (not self.previousResult or not equalModule(self.previousResult, p1)) then
		self:setResult(p1)
		self.previousResult = p1
		
		return p1
	end
	return nil
end

t.MutationData = tbl

return t