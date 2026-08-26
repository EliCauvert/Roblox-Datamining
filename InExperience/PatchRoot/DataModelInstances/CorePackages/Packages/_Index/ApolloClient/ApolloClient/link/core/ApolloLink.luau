local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local invariantModule = require(parent.jsutils.invariant)
local invariantError = invariantModule.InvariantError
local invariant = invariantModule.invariant
local observable = require(parent.utilities).Observable
local _ = require(script.Parent.types)
local utilsModule = require(script.Parent.Parent.utils)
local validateOperation = utilsModule.validateOperation
local createOperation = utilsModule.createOperation
local transformOperation = utilsModule.transformOperation
local t_1 = {}
t_1.__index = t_1

local function passthrough(_, p1, p2)
	-- upvalues: boolean (ref), observable (ref)
	return if boolean.toJSBoolean(p2) then p2(p1) else observable.of()
end

local function toLink(p1)
	-- upvalues: t_1 (ref)
	return if typeof(p1) == "function" then t_1.new(p1) else p1
end

local function _(a)
	local debugInfo, _ = debug.info(a.request, "a")
	
	return debugInfo <= 2
end

local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p1, p2)
	-- upvalues: error (ref), tbl (ref)
	local var1 = error.new(p1)
	var1.link = p2
	
	return setmetatable(var1, tbl)
end

function t_1.empty()
	-- upvalues: t_1 (ref), observable (ref)
	return t_1.new(function(_)
		-- upvalues: observable (copy)
		return observable.of()
	end)
end

function t_1.from(p1)
	-- upvalues: t_1 (ref), array (ref), toLink (ref)
	return if #p1 == 0 then t_1.empty() else array.reduce(array.map(p1, toLink, nil), function(p2, p3)
		return p2:concat(p3)
	end)
end

function t_1.split_(p1, p2, p3)
	-- upvalues: t_1 (ref), boolean (ref), passthrough (ref), observable (ref)
	local var1
	local var2 = if typeof(p2) == "function" then t_1.new(p2) else p2
	local _ = nil
	
	if boolean.toJSBoolean(p3) and p3 ~= nil then
		var1 = if typeof(p3) == "function" then t_1.new(p3) else p3
	else
		local var3 = t_1.new(passthrough)
		var1 = if typeof(var3) == "function" then t_1.new(var3) else var3
	end
	local debugInfo, _ = debug.info(var2.request, "a")
	
	if debugInfo <= 2 then
		local debugInfo_1, _ = debug.info(var1.request, "a")
		
		return if debugInfo_1 <= 2 then t_1.new(function(_, p4)
			-- upvalues: p1 (ref), var2 (ref), boolean (copy), observable (copy), var1 (write)
			if p1(p4) then
				local var4 = var2:request(p4)
				
				return if boolean.toJSBoolean(var4) then var4 else observable.of()
			end
			local var5 = var1:request(p4)
			
			return if boolean.toJSBoolean(var5) then var5 else observable.of()
		end) else t_1.new(function(_, p4, p5)
			-- upvalues: p1 (ref), var2 (ref), boolean (copy), observable (copy), var1 (write)
			if p1(p4) then
				local var4 = var2:request(p4, p5)
				
				return if boolean.toJSBoolean(var4) then var4 else observable.of()
			end
			local var5 = var1:request(p4, p5)
			
			return if boolean.toJSBoolean(var5) then var5 else observable.of()
		end)
	end
end

function t_1:execute(p1)
	-- upvalues: createOperation (ref), transformOperation (ref), validateOperation (ref), boolean (ref), observable (ref)
	local context = self:request(createOperation(p1.context, transformOperation(validateOperation(p1))))
	
	return if boolean.toJSBoolean(context) then context else observable.of()
end

function t_1.concat_(p1, p2)
	-- upvalues: t_1 (ref), invariant (ref), tbl (ref), boolean (ref), observable (ref)
	local var1 = if typeof(p1) == "function" then t_1.new(p1) else p1
	local debugInfo, _ = debug.info(var1.request, "a")
	
	if debugInfo <= 2 then
		invariant.warn(tbl.new("You are calling concat on a terminating link, which will have no effect", var1))
		
		return var1
	end
	local var2 = if typeof(p2) == "function" then t_1.new(p2) else p2
	local debugInfo_1, _ = debug.info(var2.request, "a")
	
	return if debugInfo_1 <= 2 then t_1.new(function(_, p3)
		-- upvalues: var1 (ref), var2 (ref), boolean (copy), observable (copy)
		local var3 = var1:request(p3, function(p4)
			-- upvalues: var2 (copy), boolean (copy), observable (copy)
			local var4 = var2:request(p4)
			
			return if boolean.toJSBoolean(var4) then var4 else observable.of()
		end)
		
		return if boolean.toJSBoolean(var3) then var3 else observable.of()
	end) else t_1.new(function(_, p3, p4)
		-- upvalues: var1 (ref), var2 (ref), boolean (copy), observable (copy)
		local var3 = var1:request(p3, function(p5)
			-- upvalues: var2 (copy), p4 (ref), boolean (copy), observable (copy)
			local var4 = var2:request(p5, p4)
			
			return if boolean.toJSBoolean(var4) then var4 else observable.of()
		end)
		
		return if boolean.toJSBoolean(var3) then var3 else observable.of()
	end)
end

function t_1.new(p1)
	-- upvalues: boolean (ref), t_1 (ref)
	local t = {}
	
	if boolean.toJSBoolean(p1) then
		t.request = p1
	end
	return setmetatable(t, t_1)
end

function t_1:split(p1, p2, p3)
	-- upvalues: t_1 (ref), boolean (ref), passthrough (ref)
	return self:concat(t_1.split_(p1, p2, if boolean.toJSBoolean(p3) then p3 else t_1.new(passthrough)))
end

function t_1.concat(p1, p2)
	-- upvalues: t_1 (ref)
	return t_1.concat_(p1, p2)
end

function t_1.request(_, _, _)
	-- upvalues: invariantError (ref)
	error(invariantError.new("request is not implemented"))
end

function t_1.onError(_, p1, p2)
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p2) and p2 ~= nil and boolean.toJSBoolean(p2.error) then
		p2:error(p1)
		
		return false
	end
	error(p1)
end

function t_1:setOnError(p1)
	self.onError = p1
	
	return self
end

t.ApolloLink = t_1

return t