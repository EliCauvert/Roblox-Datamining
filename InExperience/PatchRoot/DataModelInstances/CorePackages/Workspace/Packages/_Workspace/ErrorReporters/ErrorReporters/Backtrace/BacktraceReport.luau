local parent = script:FindFirstAncestor("ErrorReporters").Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local processErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local var4 = tModule.strictInterface({
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
})
local var5 = tModule.strictInterface({
	name = tModule.string,
	registers = tModule.map(tModule.string, tModule.string)
})
local var6 = tModule.strictInterface({
	text = tModule.optional(tModule.string),
	startLine = tModule.optional(tModule.number),
	startColumn = tModule.optional(tModule.number),
	startPos = tModule.optional(tModule.number),
	path = tModule.optional(tModule.string),
	tabWidth = tModule.optional(tModule.number)
})
local var7 = tModule.strictInterface({
	start = tModule.string,
	size = tModule.optional(tModule.number),
	data = tModule.optional(tModule.string),
	perms = tModule.optional(tModule.strictInterface({
		read = tModule.boolean,
		write = tModule.boolean,
		exec = tModule.boolean
	}))
})
local var8 = tModule.strictInterface({
	start = tModule.string,
	size = tModule.number,
	code_file = tModule.optional(tModule.string),
	version = tModule.optional(tModule.string),
	debug_file = tModule.optional(tModule.string),
	debug_identifier = tModule.optional(tModule.string),
	debug_file_exists = tModule.optional(tModule.boolean)
})
local var9 = tModule.optional(tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean)))
local var10 = tModule.optional(tModule.map(tModule.string, function(p0)
	-- upvalues: tModule (ref)
	local function checkTypeRecursive(p1)
		-- upvalues: checkTypeRecursive (ref), tModule (copy)
		if type(p1) ~= "table" then
			return tModule.some(tModule.string, tModule.number, tModule.boolean)(p1)
		end
		for i, v in pairs(p1) do
			local var14, var15 = checkTypeRecursive(v)
			
			if not var14 then
				return false, string.format("error when checking key: %s - %s", i, var15)
			end
		end
		return true
	end
	
	return checkTypeRecursive(p0)
end))
local var11 = tModule.intersection(tModule.strictInterface({
	uuid = tModule.string,
	timestamp = tModule.number,
	lang = tModule.string,
	langVersion = tModule.string,
	agent = tModule.string,
	agentVersion = tModule.string,
	threads = tModule.map(tModule.string, var4),
	mainThread = tModule.string,
	attributes = var9,
	annotations = var10,
	symbolication = tModule.optional(tModule.literal("minidump")),
	entryThread = tModule.optional(tModule.string),
	arch = tModule.optional(var5),
	fingerprint = tModule.optional(tModule.string),
	classifiers = tModule.optional(tModule.array(tModule.string)),
	sourceCode = tModule.optional(tModule.map(tModule.string, var6)),
	memory = tModule.optional(tModule.array(var7)),
	modules = tModule.optional(tModule.array(var8))
}), function(p2)
	local var16 = false
	
	for i, v in pairs(p2.threads) do
		local stack = v.stack
		
		if stack ~= nil then
			for i_1, v_1 in ipairs(stack) do
				if v_1.registers ~= nil then
					var16 = true
					break
				end
			end
		end
		if var16 then break end
	end
	if var16 and p2.arch == nil then
		return false, "arch must exist if you want to have registers in the stack"
	end
	return true
end)
local t = { IAttributes = var9, IAnnotations = var10 }
t.__index = t

local _ = function(p3)
	-- upvalues: cryoModule (ref)
	if p3 and type(p3) == "table" then
		local var17 = cryoModule.Dictionary.keys(p3)
		
		if #var17 > 0 then
			local var18 = p3[var17[1]]
			
			return if var18 and var18.path ~= nil then var18.path else ""
		end
	end
end

function t.validate(p4)
	-- upvalues: var11 (ref)
	return var11(p4)
end

function t.new()
	-- upvalues: httpService (ref), t (ref)
	local t_1 = {
		lang = "lua",
		langVersion = "Roblox",
		agent = "backtrace-Lua",
		agentVersion = "0.1.0",
		mainThread = "default",
		uuid = httpService:GenerateGUID(false):lower(),
		timestamp = os.time(),
		threads = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:addAttributes(p5)
	-- upvalues: cryoModule (ref)
	if type(p5) == "table" then
		self.attributes = cryoModule.Dictionary.join(self.attributes or {}, p5)
		
		return
	end
	warn("Cannot add attributes of type: ", type(p5))
end

function t:addAnnotations(p6)
	-- upvalues: cryoModule (ref)
	if type(p6) == "table" then
		self.annotations = cryoModule.Dictionary.join(self.annotations or {}, p6)
		
		return
	end
	warn("Cannot add annotations of type: ", type(p6))
end

function t:addStackToThread(p7, p8)
	-- upvalues: cryoModule (ref)
	self.threads = cryoModule.Dictionary.join(self.threads, { [p8] = { name = p8, stack = p7 } })
end

function t:addStackToMainThread(p9)
	self:addStackToThread(p9, self.mainThread)
end

function t.fromMessageAndStack(p10, p11)
	-- upvalues: t (ref), processErrorStackModule (ref), cryoModule (ref)
	local var26
	local var20 = t.new()
	var20:addAttributes({ ["error.message"] = p10 })
	local var21, var22 = processErrorStackModule(p11)
	var20:addStackToMainThread(var21)
	var20.sourceCode = var22
	local t_1 = {}
	local sourceCode = var20.sourceCode
	
	if sourceCode and type(sourceCode) == "table" then
		local var24 = cryoModule.Dictionary.keys(sourceCode)
		
		if #var24 > 0 then
			local var25 = sourceCode[var24[1]]
			var26 = if var25 and var25.path ~= nil then var25.path else ""
		end
	end
	t_1.MainSourcePath = var26
	var20:addAttributes(t_1)
	
	return var20
end

function t:fromDetails()
	-- upvalues: t (ref), processErrorStackModule (ref), cryoModule (ref)
	local var27 = t.new()
	var27:addAttributes({ ["error.message"] = self.message })
	var27.sourceCode = {}
	local var28 = 0
	
	for i, v in ipairs(self.stacks) do
		local var33, var34, var35 = processErrorStackModule(v, var28)
		
		if i == 1 then
			var27:addStackToMainThread(var33)
		else
			var27:addStackToThread(var33, "stack" .. i)
		end
		var27.sourceCode = cryoModule.Dictionary.join(var27.sourceCode, var34)
		var28 = var35
	end
	local var32
	var27:addAnnotations(self.annotations)
	local t_1 = {}
	local sourceCode = var27.sourceCode
	
	if sourceCode and type(sourceCode) == "table" then
		local var30 = cryoModule.Dictionary.keys(sourceCode)
		
		if #var30 > 0 then
			local var31 = sourceCode[var30[1]]
			var32 = if var31 and var31.path ~= nil then var31.path else ""
		end
	end
	t_1.MainSourcePath = var32
	var27:addAttributes(t_1)
	
	return var27
end

return t