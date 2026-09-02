local parent = script:FindFirstAncestor("ErrorReporters").Parent
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local _ = require(parent.SentrySdk)
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
local var4 = tModule.optional(tModule.array(tModule.interface({
	type = tModule.optional(tModule.string),
	category = tModule.optional(tModule.string),
	message = tModule.optional(tModule.string),
	data = tModule.optional(tModule.table),
	level = tModule.optional(tModule.string),
	timestamp = tModule.optional(tModule.number),
	origin = tModule.optional(tModule.string)
})))
local var5 = tModule.intersection(tModule.strictInterface({
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
	customMetadata = var3,
	breadcrumbs = var4
}))
local t = {
	IAttributes = var1,
	IAnnotations = var2,
	ICustomMetadata = var3,
	IBreadcrumbs = var4
}
t.__index = t

function t.validate(p2)
	-- upvalues: var5 (ref)
	return var5(p2)
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		threads = {},
		attributes = {},
		annotations = {},
		customMetadata = {},
		breadcrumbs = {}
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
		local var6 = type(v)
		
		if var6 == "string" or var6 == "number" or var6 == "boolean" then
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
		local var7 = sanitizeCustomMetadataGroup(v)
		
		if var7 ~= nil then
			local var8 = customMetadata[i]
			
			if var8 == nil then
				customMetadata[i] = var7
			else
				customMetadata[i] = cryoModule.Dictionary.join(var8, var7)
			end
		end
	end
	self.customMetadata = customMetadata
end

function t:addBreadcrumb(p4)
	if type(p4) == "table" then
		table.insert(self.breadcrumbs, {
			type = p4.type or "default",
			category = p4.category,
			message = p4.message,
			data = p4.data,
			level = p4.level or "info",
			origin = p4.origin,
			timestamp = p4.timestamp or os.time()
		})
		
		return
	end
	warn("Cannot add breadcrumb of type: ", type(p4))
end

function t:addBreadcrumbs(p4)
	if type(p4) ~= "table" then
		warn("Cannot add breadcrumbs of type: ", type(p4))
		
		return
	end
	for i, v in ipairs(p4) do
		self:addBreadcrumb(v)
	end
end

function t.fromMessageAndStack(p5, p6, p7)
	-- upvalues: t (ref), constantsModule (ref), processErrorStackModule (ref)
	local var9 = t.new()
	var9.message = p5
	var9.level = p7 or constantsModule.DEFAULT_ERROR_LEVEL
	local var10, var11 = processErrorStackModule(p6)
	
	for i, v in var10 do
		if v.sourceCode and var11[v.sourceCode] then
			v.sourceCode = var11[v.sourceCode].path
		end
	end
	var9.threads = { main = { name = "main", stack = var10 } }
	
	return var9
end

function t:fromDetails()
	-- upvalues: t (ref), constantsModule (ref)
	local var12
	local _ = nil
	
	if self.stack then
		var12 = t.fromMessageAndStack(self.message, self.stack, self.level)
	else
		var12 = t.new()
		var12.message = self.message
		var12.level = self.level or constantsModule.DEFAULT_ERROR_LEVEL
	end
	if self.annotations then
		var12:addAnnotations(self.annotations)
	end
	return var12
end

return t