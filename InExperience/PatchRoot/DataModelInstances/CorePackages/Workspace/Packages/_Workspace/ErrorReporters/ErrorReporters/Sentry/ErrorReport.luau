local parent = script:FindFirstAncestor("ErrorReporters").Parent
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local processErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local constantsModule = require(script.Parent.Constants)
local var4 = tModule.optional(tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean)))
local var5 = tModule.optional(tModule.map(tModule.string, function(p0)
	-- upvalues: tModule (ref)
	local function checkTypeRecursive(p1)
		-- upvalues: checkTypeRecursive (ref), tModule (copy)
		if type(p1) ~= "table" then
			return tModule.some(tModule.string, tModule.number, tModule.boolean)(p1), nil
		end
		for i, v in pairs(p1) do
			local var13, var14 = checkTypeRecursive(v)
			
			if not var13 then
				return false, string.format("error when checking key: %s - %s", i, var14 or "unknown error")
			end
		end
		return true, nil
	end
	
	local var11, var12 = checkTypeRecursive(p0)
	
	return var11, var12
end))
local var6 = tModule.optional(tModule.map(tModule.string, tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean))))
local var7 = tModule.intersection(tModule.strictInterface({
	threads = tModule.map(tModule.string, tModule.strictInterface({
		name = tModule.optional(tModule.string),
		fault = tModule.optional(tModule.boolean),
		stack = tModule.optional(tModule.array(tModule.strictInterface({
			guessed_frame = tModule.optional(tModule.boolean),
			funcName = tModule.optional(tModule.string),
			address = tModule.optional(tModule.string),
			line = tModule.optional(tModule.string),
			column = tModule.optional(tModule.string),
			sourceCode = tModule.optional(tModule.string),
			library = tModule.optional(tModule.string),
			debug_identifier = tModule.optional(tModule.string),
			faulted = tModule.optional(tModule.boolean),
			registers = tModule.optional(tModule.map(tModule.string, tModule.some(tModule.string, tModule.number)))
		})))
	})),
	message = tModule.optional(tModule.string),
	level = tModule.optional(tModule.string),
	attributes = var4,
	annotations = var5,
	customMetadata = var6
}))
local t = {
	IAttributes = var4,
	IAnnotations = var5,
	ICustomMetadata = var6
}
t.__index = t

function t.validate(p2)
	-- upvalues: var7 (ref)
	return var7(p2)
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		threads = {},
		attributes = {},
		annotations = {},
		customMetadata = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:addAttributes(p3)
	-- upvalues: cryoModule (ref)
	if type(p3) == "table" then
		self.attributes = cryoModule.Dictionary.join(self.attributes, p3)
		
		return
	end
	warn("Cannot add attributes of type: ", type(p3))
end

function t:addAnnotations(p4)
	-- upvalues: cryoModule (ref)
	if type(p4) == "table" then
		self.annotations = cryoModule.Dictionary.join(self.annotations, p4)
		
		return
	end
	warn("Cannot add annotations of type: ", type(p4))
end

local function sanitizeCustomMetadataGroup(p5)
	if type(p5) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in pairs(p5) do
		local var17 = type(v)
		
		if var17 == "string" or var17 == "number" or var17 == "boolean" then
			t[i] = v
		end
	end
	return if next(t) == nil then nil else t
end

function t:addCustomMetadata(p6)
	-- upvalues: sanitizeCustomMetadataGroup (ref), cryoModule (ref)
	if type(p6) ~= "table" then
		warn("Cannot add custom metadata of type: ", type(p6))
		
		return
	end
	local customMetadata = self.customMetadata
	
	for i, v in pairs(p6) do
		local var18 = sanitizeCustomMetadataGroup(v)
		
		if var18 ~= nil then
			local var19 = customMetadata[i]
			
			if var19 == nil then
				customMetadata[i] = var18
			else
				customMetadata[i] = cryoModule.Dictionary.join(var19, var18)
			end
		end
	end
	self.customMetadata = customMetadata
end

function t.fromMessageAndStack(p7, p8, p9)
	-- upvalues: t (ref), constantsModule (ref), processErrorStackModule (ref)
	local var20 = t.new()
	var20.message = p7
	var20.level = p9 or constantsModule.DEFAULT_ERROR_LEVEL
	local var21, var22 = processErrorStackModule(p8)
	
	for i, v in var21 do
		if v.sourceCode and var22[v.sourceCode] then
			v.sourceCode = var22[v.sourceCode].path
		end
	end
	var20.threads = { main = { name = "main", stack = var21 } }
	
	return var20
end

function t:fromDetails()
	-- upvalues: t (ref), constantsModule (ref)
	local var23
	local _ = nil
	
	if self.stack then
		var23 = t.fromMessageAndStack(self.message, self.stack, self.level)
	else
		var23 = t.new()
		var23.message = self.message
		var23.level = self.level or constantsModule.DEFAULT_ERROR_LEVEL
	end
	if self.annotations then
		var23:addAnnotations(self.annotations)
	end
	return var23
end

return t