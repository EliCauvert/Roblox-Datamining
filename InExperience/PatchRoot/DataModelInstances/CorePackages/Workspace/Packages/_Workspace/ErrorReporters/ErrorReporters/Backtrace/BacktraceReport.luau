local parent = script:FindFirstAncestor("ErrorReporters").Parent
local httpService = game:GetService("HttpService")
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local processErrorStackModule = require(script.Parent.Parent.ProcessErrorStack)
local var1 = tModule.strictInterface({
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
local var2 = tModule.strictInterface({
	name = tModule.string,
	registers = tModule.map(tModule.string, tModule.string)
})
local var3 = tModule.strictInterface({
	text = tModule.optional(tModule.string),
	startLine = tModule.optional(tModule.number),
	startColumn = tModule.optional(tModule.number),
	startPos = tModule.optional(tModule.number),
	path = tModule.optional(tModule.string),
	tabWidth = tModule.optional(tModule.number)
})
local var4 = tModule.strictInterface({
	start = tModule.string,
	size = tModule.optional(tModule.number),
	data = tModule.optional(tModule.string),
	perms = tModule.optional(tModule.strictInterface({
		read = tModule.boolean,
		write = tModule.boolean,
		exec = tModule.boolean
	}))
})
local var5 = tModule.strictInterface({
	start = tModule.string,
	size = tModule.number,
	code_file = tModule.optional(tModule.string),
	version = tModule.optional(tModule.string),
	debug_file = tModule.optional(tModule.string),
	debug_identifier = tModule.optional(tModule.string),
	debug_file_exists = tModule.optional(tModule.boolean)
})
local var6 = tModule.optional(tModule.map(tModule.string, tModule.some(tModule.string, tModule.number, tModule.boolean)))
local var7 = tModule.optional(tModule.map(tModule.string, function(p1)
	-- upvalues: tModule (ref)
	local function checkTypeRecursive(p2)
		-- upvalues: checkTypeRecursive (ref), tModule (copy)
		if type(p2) ~= "table" then
			return tModule.some(tModule.string, tModule.number, tModule.boolean)(p2)
		end
		for i, v in pairs(p2) do
			local var8, var9 = checkTypeRecursive(v)
			
			if not var8 then
				return false, string.format("error when checking key: %s - %s", i, var9)
			end
		end
		return true
	end
	
	return checkTypeRecursive(p1)
end))
local var8 = tModule.intersection(tModule.strictInterface({
	uuid = tModule.string,
	timestamp = tModule.number,
	lang = tModule.string,
	langVersion = tModule.string,
	agent = tModule.string,
	agentVersion = tModule.string,
	threads = tModule.map(tModule.string, var1),
	mainThread = tModule.string,
	attributes = var6,
	annotations = var7,
	symbolication = tModule.optional(tModule.literal("minidump")),
	entryThread = tModule.optional(tModule.string),
	arch = tModule.optional(var2),
	fingerprint = tModule.optional(tModule.string),
	classifiers = tModule.optional(tModule.array(tModule.string)),
	sourceCode = tModule.optional(tModule.map(tModule.string, var3)),
	memory = tModule.optional(tModule.array(var4)),
	modules = tModule.optional(tModule.array(var5))
}), function(p2)
	local var9 = false
	
	for i, v in pairs(p2.threads) do
		local stack = v.stack
		
		if stack ~= nil then
			for i_1, v_1 in ipairs(stack) do
				if v_1.registers ~= nil then
					var9 = true
					break
				end
			end
		end
		if var9 then break end
	end
	if var9 and p2.arch == nil then
		return false, "arch must exist if you want to have registers in the stack"
	end
	return true
end)
local t = { IAttributes = var6, IAnnotations = var7 }
t.__index = t

local _ = function(p3)
	-- upvalues: cryoModule (ref)
	if p3 and type(p3) == "table" then
		local var10 = cryoModule.Dictionary.keys(p3)
		
		if #var10 > 0 then
			local var11 = p3[var10[1]]
			
			return if var11 and var11.path ~= nil then var11.path else ""
		end
	end
end

function t.validate(p3)
	-- upvalues: var8 (ref)
	return var8(p3)
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

function t:addAttributes(p3)
	-- upvalues: cryoModule (ref)
	if type(p3) == "table" then
		self.attributes = cryoModule.Dictionary.join(self.attributes or {}, p3)
		
		return
	end
	warn("Cannot add attributes of type: ", type(p3))
end

function t:addAnnotations(p3)
	-- upvalues: cryoModule (ref)
	if type(p3) == "table" then
		self.annotations = cryoModule.Dictionary.join(self.annotations or {}, p3)
		
		return
	end
	warn("Cannot add annotations of type: ", type(p3))
end

function t:addStackToThread(p3, p4)
	-- upvalues: cryoModule (ref)
	self.threads = cryoModule.Dictionary.join(self.threads, { [p4] = { name = p4, stack = p3 } })
end

function t:addStackToMainThread(p3)
	self:addStackToThread(p3, self.mainThread)
end

function t.fromMessageAndStack(p3, p4)
	-- upvalues: t (ref), processErrorStackModule (ref), cryoModule (ref)
	local var10
	local var11 = t.new()
	var11:addAttributes({ ["error.message"] = p3 })
	local var12, var13 = processErrorStackModule(p4)
	var11:addStackToMainThread(var12)
	var11.sourceCode = var13
	local t_1 = {}
	local sourceCode = var11.sourceCode
	
	if sourceCode and type(sourceCode) == "table" then
		local var14 = cryoModule.Dictionary.keys(sourceCode)
		
		if #var14 > 0 then
			local var15 = sourceCode[var14[1]]
			var10 = if var15 and var15.path ~= nil then var15.path else ""
		end
	end
	t_1.MainSourcePath = var10
	var11:addAttributes(t_1)
	
	return var11
end

function t:fromDetails()
	-- upvalues: t (ref), processErrorStackModule (ref), cryoModule (ref)
	local var10 = t.new()
	var10:addAttributes({ ["error.message"] = self.message })
	var10.sourceCode = {}
	local var11 = 0
	
	for i, v in ipairs(self.stacks) do
		local var12, var13, var14 = processErrorStackModule(v, var11)
		
		if i == 1 then
			var10:addStackToMainThread(var12)
		else
			var10:addStackToThread(var12, "stack" .. i)
		end
		var10.sourceCode = cryoModule.Dictionary.join(var10.sourceCode, var13)
		var11 = var14
	end
	local var15
	var10:addAnnotations(self.annotations)
	local t_1 = {}
	local sourceCode = var10.sourceCode
	
	if sourceCode and type(sourceCode) == "table" then
		local var16 = cryoModule.Dictionary.keys(sourceCode)
		
		if #var16 > 0 then
			local var17 = sourceCode[var16[1]]
			var15 = if var17 and var17.path ~= nil then var17.path else ""
		end
	end
	t_1.MainSourcePath = var15
	var10:addAttributes(t_1)
	
	return var10
end

return t