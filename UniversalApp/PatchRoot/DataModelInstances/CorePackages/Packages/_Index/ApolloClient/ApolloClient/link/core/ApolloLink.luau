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

local function passthrough(_, p0, p1) --[[ line: 53 ]]
	-- upvalues: boolean (ref), observable (ref)
	return if boolean.toJSBoolean(p1) then p1(p0) else observable.of()
end

local function toLink(p2) --[[ line: 61 ]]
	-- upvalues: t_1 (ref)
	return if typeof(p2) == "function" then t_1.new(p2) else p2
end

local function _(a) --[[ line: 69 | named "isTerminating" ]]
	local debugInfo, _ = debug.info(a.request, "a")
	
	return debugInfo <= 2
end

local tbl = setmetatable({}, { __index = error })
tbl.__index = tbl

function tbl.new(p3, p4) --[[ line: 79 ]]
	-- upvalues: error (ref), tbl (ref)
	local var9 = error.new(p3)
	var9.link = p4
	
	return setmetatable(var9, tbl)
end

function t_1.empty() --[[ line: 86 ]]
	-- upvalues: t_1 (ref), observable (ref)
	return t_1.new(function(_) --[[ line: 87 ]]
		-- upvalues: observable (copy)
		return observable.of()
	end)
end

function t_1.from(p5) --[[ line: 92 ]]
	-- upvalues: t_1 (ref), array (ref), toLink (ref)
	return if #p5 == 0 then t_1.empty() else array.reduce(array.map(p5, toLink, nil), function(p6, p7) --[[ line: 96 ]]
		return p6:concat(p7)
	end)
end

function t_1.split_(p8, p9, p10) --[[ line: 101 ]]
	-- upvalues: t_1 (ref), boolean (ref), passthrough (ref), observable (ref)
	local var12
	local var10 = if typeof(p9) == "function" then t_1.new(p9) else p9
	local _ = nil
	
	if boolean.toJSBoolean(p10) and p10 ~= nil then
		var12 = if typeof(p10) == "function" then t_1.new(p10) else p10
	else
		local var11 = t_1.new(passthrough)
		var12 = if typeof(var11) == "function" then t_1.new(var11) else var11
	end
	local debugInfo, _ = debug.info(var10.request, "a")
	
	if debugInfo <= 2 then
		local debugInfo_1, _ = debug.info(var12.request, "a")
		
		return if debugInfo_1 <= 2 then t_1.new(function(_, p13) --[[ line: 115 ]]
			-- upvalues: p8 (ref), var10 (ref), boolean (copy), observable (copy), var12 (write)
			if p8(p13) then
				local var17 = var10:request(p13)
				
				return if boolean.toJSBoolean(var17) then var17 else observable.of()
			end
			local var18 = var12:request(p13)
			
			return if boolean.toJSBoolean(var18) then var18 else observable.of()
		end) else t_1.new(function(_, p11, p12) --[[ line: 125 ]]
			-- upvalues: p8 (ref), var10 (ref), boolean (copy), observable (copy), var12 (write)
			if p8(p11) then
				local var15 = var10:request(p11, p12)
				
				return if boolean.toJSBoolean(var15) then var15 else observable.of()
			end
			local var16 = var12:request(p11, p12)
			
			return if boolean.toJSBoolean(var16) then var16 else observable.of()
		end)
	end
end

function t_1:execute(p14) --[[ line: 137 ]]
	-- upvalues: createOperation (ref), transformOperation (ref), validateOperation (ref), boolean (ref), observable (ref)
	local context = self:request(createOperation(p14.context, transformOperation(validateOperation(p14))))
	
	return if boolean.toJSBoolean(context) then context else observable.of()
end

function t_1.concat_(p15, p16) --[[ line: 142 ]]
	-- upvalues: t_1 (ref), invariant (ref), tbl (ref), boolean (ref), observable (ref)
	local var20 = if typeof(p15) == "function" then t_1.new(p15) else p15
	local debugInfo, _ = debug.info(var20.request, "a")
	
	if debugInfo <= 2 then
		invariant.warn(tbl.new("You are calling concat on a terminating link, which will have no effect", var20))
		
		return var20
	end
	local var22 = if typeof(p16) == "function" then t_1.new(p16) else p16
	local debugInfo_1, _ = debug.info(var22.request, "a")
	
	return if debugInfo_1 <= 2 then t_1.new(function(_, p20) --[[ line: 153 ]]
		-- upvalues: var20 (ref), var22 (ref), boolean (copy), observable (copy)
		local var26 = var20:request(p20, function(p21) --[[ line: 154 ]]
			-- upvalues: var22 (copy), boolean (copy), observable (copy)
			local var27 = var22:request(p21)
			
			return if boolean.toJSBoolean(var27) then var27 else observable.of()
		end)
		
		return if boolean.toJSBoolean(var26) then var26 else observable.of()
	end) else t_1.new(function(_, p17, p18) --[[ line: 161 ]]
		-- upvalues: var20 (ref), var22 (ref), boolean (copy), observable (copy)
		local var24 = var20:request(p17, function(p19) --[[ line: 162 ]]
			-- upvalues: var22 (copy), p18 (ref), boolean (copy), observable (copy)
			local var25 = var22:request(p19, p18)
			
			return if boolean.toJSBoolean(var25) then var25 else observable.of()
		end)
		
		return if boolean.toJSBoolean(var24) then var24 else observable.of()
	end)
end

function t_1.new(p22) --[[ line: 171 ]]
	-- upvalues: boolean (ref), t_1 (ref)
	local t = {}
	
	if boolean.toJSBoolean(p22) then
		t.request = p22
	end
	return setmetatable(t, t_1)
end

function t_1:split(p23, p24, p25) --[[ line: 179 ]]
	-- upvalues: t_1 (ref), boolean (ref), passthrough (ref)
	return self:concat(t_1.split_(p23, p24, if boolean.toJSBoolean(p25) then p25 else t_1.new(passthrough)))
end

function t_1.concat(p26, p27) --[[ line: 189 ]]
	-- upvalues: t_1 (ref)
	return t_1.concat_(p26, p27)
end

function t_1.request(_, _, _) --[[ line: 193 ]]
	-- upvalues: invariantError (ref)
	error(invariantError.new("request is not implemented"))
end

function t_1.onError(_, p28, p29) --[[ line: 197 ]]
	-- upvalues: boolean (ref)
	if boolean.toJSBoolean(p29) and p29 ~= nil and boolean.toJSBoolean(p29.error) then
		p29:error(p28)
		
		return false
	end
	error(p28)
end

function t_1:setOnError(p30) --[[ line: 213 ]]
	self.onError = p30
	
	return self
end

t.ApolloLink = t_1

return t