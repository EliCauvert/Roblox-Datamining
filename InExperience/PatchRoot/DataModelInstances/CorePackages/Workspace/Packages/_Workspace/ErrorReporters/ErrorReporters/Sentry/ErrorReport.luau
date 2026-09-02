local parent = script:FindFirstAncestor("ErrorReporters").Parent
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local processErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local constantsModule = require(script.Parent.Constants)
local var1 = tModule.optional(tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean)))
local var2 = tModule.optional(tModule.map(tModule.string, function(p1)
	-- upvalues: tModule (ref)
	local function checkTypeRecursive(p2)
		-- upvalues: checkTypeRecursive (ref), tModule (copy)
		if type(p2) ~= "table" then
			return tModule.some(tModule.string, tModule.number, tModule.boolean)(p2), nil
		end
		for i, v in pairs(p2) do
			local var3, var4 = checkTypeRecursive(v)
			
			if not var3 then
				return false, string.format("error when checking key: %s - %s", i, var4 or "unknown error")
			end
		end
		return true, nil
	end
	
	local var5, var6 = checkTypeRecursive(p1)
	
	return var5, var6
end))
local var3 = tModule.optional(tModule.map(tModule.string, tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean))))
local var4 = tModule.intersection(tModule.strictInterface({
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
	attributes = var1,
	annotations = var2,
	customMetadata = var3
}))
local t = {
	IAttributes = var1,
	IAnnotations = var2,
	ICustomMetadata = var3
}
t.__index = t

function t.validate(p2)
	-- upvalues: var4 (ref)
	return var4(p2)
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

function t:addAttributes(p2)
	-- upvalues: cryoModule (ref)
	if type(p2) == "table" then
		self.attributes = cryoModule.Dictionary.join(self.attributes, p2)
		
		return
	end
	warn("Cannot add attributes of type: ", type(p2))
end

function t:addAnnotations(p2)
	-- upvalues: cryoModule (ref)
	if type(p2) == "table" then
		self.annotations = cryoModule.Dictionary.join(self.annotations, p2)
		
		return
	end
	warn("Cannot add annotations of type: ", type(p2))
end

local function sanitizeCustomMetadataGroup(p2)
	if type(p2) ~= "table" then
		return nil
	end
	local t = {}
	
	for i, v in pairs(p2) do
		local var5 = type(v)
		
		if var5 == "string" or var5 == "number" or var5 == "boolean" then
			t[i] = v
		end
	end
	return if next(t) == nil then nil else t
end

function t:addCustomMetadata(p3)
	-- upvalues: sanitizeCustomMetadataGroup (ref), cryoModule (ref)
	if type(p3) ~= "table" then
		warn("Cannot add custom metadata of type: ", type(p3))
		
		return
	end
	local customMetadata = self.customMetadata
	
	for i, v in pairs(p3) do
		local var6 = sanitizeCustomMetadataGroup(v)
		
		if var6 ~= nil then
			local var7 = customMetadata[i]
			
			if var7 == nil then
				customMetadata[i] = var6
			else
				customMetadata[i] = cryoModule.Dictionary.join(var7, var6)
			end
		end
	end
	self.customMetadata = customMetadata
end

function t.fromMessageAndStack(p4, p5, p6)
	-- upvalues: t (ref), constantsModule (ref), processErrorStackModule (ref)
	local var8 = t.new()
	var8.message = p4
	var8.level = p6 or constantsModule.DEFAULT_ERROR_LEVEL
	local var9, var10 = processErrorStackModule(p5)
	
	for i, v in var9 do
		if v.sourceCode and var10[v.sourceCode] then
			v.sourceCode = var10[v.sourceCode].path
		end
	end
	var8.threads = { main = { name = "main", stack = var9 } }
	
	return var8
end

function t:fromDetails()
	-- upvalues: t (ref), constantsModule (ref)
	local var11
	local _ = nil
	
	if self.stack then
		var11 = t.fromMessageAndStack(self.message, self.stack, self.level)
	else
		var11 = t.new()
		var11.message = self.message
		var11.level = self.level or constantsModule.DEFAULT_ERROR_LEVEL
	end
	if self.annotations then
		var11:addAnnotations(self.annotations)
	end
	return var11
end

return t