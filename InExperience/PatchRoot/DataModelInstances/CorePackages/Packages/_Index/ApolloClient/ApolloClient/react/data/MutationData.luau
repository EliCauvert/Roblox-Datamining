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

function tbl.new(p0) --[[ line: 83 ]]
	-- upvalues: operationData (ref), boolean (ref), documentType (ref), tbl (ref)
	local var4 = operationData.new(p0.options, p0.context)
	
	function var4.runMutation(p1) --[[ line: 92 ]]
		-- upvalues: var4 (ref), boolean (copy)
		if p1 == nil then
			p1 = {}
		end
		var4:onMutationStart()
		local var5 = var4:generateNewMutationId()
		
		return var4:mutate(p1):andThen(function(p3) --[[ line: 100 ]]
			-- upvalues: var4 (copy), var5 (ref)
			var4:onMutationCompleted(p3, var5)
			
			return p3
		end):catch(function(p2) --[[ line: 104 ]]
			-- upvalues: var4 (copy), var5 (ref), boolean (copy)
			local options = var4:getOptions()
			local onError = options.onError
			var4:onMutationError(p2, var5)
			
			if boolean.toJSBoolean(onError) then
				onError(options, p2)
				
				return { data = nil, errors = p2 }
			end
			error(p2)
		end)
	end
	
	var4:verifyDocumentType(p0.options.mutation, documentType.Mutation)
	var4.result = p0.result
	var4.setResult = p0.setResult
	var4.mostRecentMutationId = 0
	
	return setmetatable(var4, tbl)
end

function tbl:execute(p4) --[[ line: 127 ]]
	-- upvalues: documentType (ref), object (ref)
	self.isMounted = true
	self:verifyDocumentType(self:getOptions().mutation, documentType.Mutation)
	
	return {
		self.runMutation,
		object.assign({}, p4, { client = self:refreshClient().client })
	}
end

function tbl:afterExecute() --[[ line: 133 ]]
	self.isMounted = true
	
	return function(...) --[[ line: 135 ]]
		-- upvalues: self (ref)
		return self:unmount(...)
	end
end

function tbl.cleanup(_) --[[ line: 140 ]] end

function tbl:mutate(p5) --[[ line: 144 ]]
	-- upvalues: mergeOptions (ref)
	return self:refreshClient().client:mutate(mergeOptions(self:getOptions(), p5))
end

function tbl:onMutationStart() --[[ line: 148 ]]
	if not self.result.loading and not self:getOptions().ignoreResults then
		self:updateResult({ loading = true, error = nil, data = nil, called = true })
	end
end

function tbl:onMutationCompleted(p6, p7) --[[ line: 160 ]]
	-- upvalues: apolloError (ref), boolean (ref)
	local options = self:getOptions()
	local onCompleted = options.onCompleted
	local ignoreResults = options.ignoreResults
	local data = p6.data
	local errors = p6.errors
	local var8 = if errors and #errors > 0 then apolloError.new({ graphQLErrors = errors }) else nil
	
	local function _() --[[ line: 172 | named "callOncomplete" ]]
		-- upvalues: boolean (copy), onCompleted (ref), data (ref)
		return if boolean.toJSBoolean(onCompleted) then onCompleted(data) else nil
	end
	
	if self:isMostRecentMutation(p7) and not ignoreResults then
		self:updateResult({
			called = true,
			loading = false,
			data = data,
			error = var8
		})
	end
	if boolean.toJSBoolean(onCompleted) then
		local _ = onCompleted(data)
		
		return
	end
end

function tbl:onMutationError(p8, p9) --[[ line: 191 ]]
	if self:isMostRecentMutation(p9) then
		self:updateResult({ loading = false, data = nil, called = true, error = p8 })
	end
end

function tbl:generateNewMutationId() --[[ line: 202 ]]
	self.mostRecentMutationId += 1
	
	return self.mostRecentMutationId
end

function tbl:isMostRecentMutation(p10) --[[ line: 207 ]]
	return self.mostRecentMutationId == p10
end

function tbl:updateResult(p11) --[[ line: 211 ]]
	-- upvalues: equalModule (ref)
	if self.isMounted and (not self.previousResult or not equalModule(self.previousResult, p11)) then
		self:setResult(p11)
		self.previousResult = p11
		
		return p11
	end
	return nil
end

t.MutationData = tbl

return t