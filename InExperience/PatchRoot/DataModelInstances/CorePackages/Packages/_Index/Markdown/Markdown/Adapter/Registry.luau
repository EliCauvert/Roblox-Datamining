local _ = require(script.Parent.AdapterTypes)
local _ = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local Frozen = table.freeze({ PARAGRAPH = true, HEADING = true, QUOTE = true })
local Frozen1 = table.freeze({
	BOLD = true,
	BOLD_2 = true,
	ITALIC = true,
	ITALIC_2 = true,
	UNDERLINE = true,
	STRIKE = true,
	INLINE_CODE = true
})
local Frozen2 = table.freeze({ form = "children" })
local Frozen3 = table.freeze({ form = "drop" })

local function _(p1, p2)
	-- upvalues: Frozen2 (copy), Frozen3 (copy)
	if p1 == "children" then
		return Frozen2
	elseif p1 == "drop" then
		return Frozen3
	else
		error(`{p2} must be "children" or "drop", not {p1}`)
	end
end

local function commonRule(p1, Callback)
	-- upvalues: Frozen2 (copy), Frozen3 (copy)
	if Callback == "children" then
		return Frozen2
	end
	if Callback == "drop" then
		return Frozen3
	end
	if type(Callback) == "function" then
		return table.freeze({ form = "handler", handler = Callback })
	end
	if type(Callback) ~= "table" then
		error(`The rule for {p1} must be "children", "drop", a function or a table`)
	end
	return nil
end

local function inlineRule(p2, Handler)
	-- upvalues: commonRule (copy), Frozen1 (copy)
	local CommonRuleResult = commonRule(p2, Handler)
	
	if CommonRuleResult ~= nil then
		return CommonRuleResult
	end
	if Handler.style ~= nil then
		if not Frozen1[Handler.style] then
			error(`The rule for {p2} has an unknown style {Handler.style}`)
		end
		return table.freeze({ form = "style", style = Handler.style })
	elseif type(Handler.text) == "function" then
		return table.freeze({ form = "text", text = Handler.text })
	else
		error(`The inline rule for {p2} needs a style or a text function`)
	end
end

local function blockRule(p3, Handler)
	-- upvalues: commonRule (copy), Frozen (copy)
	local CommonRuleResult = commonRule(p3, Handler)
	
	if CommonRuleResult ~= nil then
		return CommonRuleResult
	end
	if Frozen[Handler.as] then
		if Handler.attributes ~= nil and type(Handler.attributes) ~= "function" then
			error(`The block rule for {p3} has attributes that aren't a function`)
		end
	else
		error(`The block rule for {p3} needs \`as\` a renderer block name that holds its children (PARAGRAPH, HEADING or QUOTE), not {Handler.as}`)
	end
	return table.freeze({
		form = "as",
		as = Handler.as,
		attributes = Handler.attributes
	})
end

local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Frozen2 (copy), Module (copy)
	return (setmetatable({
		_registry = {
			blockInText = "flatten",
			inline = {},
			block = {},
			unknownInline = Frozen2,
			unknownBlock = Frozen2,
			passes = { mergeText = true, dropEmpty = true }
		}
	}, Module))
end

function Module:inline(p4, p5)
	-- upvalues: inlineRule (copy)
	self._registry.inline[p4] = inlineRule(p4, p5)
end

function Module:block(p4, p5)
	-- upvalues: blockRule (copy)
	self._registry.block[p4] = blockRule(p4, p5)
end

function Module:fallback(p4)
	-- upvalues: Frozen2 (copy), Frozen3 (copy)
	local Registry = self._registry
	
	if p4.unknownInline ~= nil then
		local UnknownInline = p4.unknownInline
		local UnknownInline1 = nil
		
		if UnknownInline == "children" then
			UnknownInline1 = Frozen2
		elseif UnknownInline == "drop" then
			UnknownInline1 = Frozen3
		else
			error(`unknownInline must be "children" or "drop", not {UnknownInline}`)
			UnknownInline1 = nil
		end
		Registry.unknownInline = UnknownInline1
	end
	if p4.unknownBlock ~= nil then
		local UnknownBlock = p4.unknownBlock
		local UnknownBlock1 = nil
		
		if UnknownBlock == "children" then
			UnknownBlock1 = Frozen2
		elseif UnknownBlock == "drop" then
			UnknownBlock1 = Frozen3
		else
			error(`unknownBlock must be "children" or "drop", not {UnknownBlock}`)
			UnknownBlock1 = nil
		end
		Registry.unknownBlock = UnknownBlock1
	end
	local BlockInText = p4.blockInText
	
	if BlockInText ~= nil then
		if BlockInText ~= "flatten" and BlockInText ~= "drop" then
			error(`blockInText must be "flatten" or "drop", not {BlockInText}`)
		end
		Registry.blockInText = BlockInText
	end
end

function Module:pass(p4, DropEmpty)
	local Passes = self._registry.passes
	
	if p4 == "mergeText" then
		Passes.mergeText = DropEmpty
		
		return
	end
	if p4 == "dropEmpty" then
		Passes.dropEmpty = DropEmpty
		
		return
	else
		error(`Unknown adapter pass {p4}`)
	end
end

return {
	build = function(Callback: (any) -> (), List)
		-- upvalues: Module (copy)
		local NewModule = Module.new()
		Callback(NewModule)
		
		for _, value in List do
			local ExtendAdapterFunction: (any) -> () = value.extendAdapter
			
			if ExtendAdapterFunction ~= nil then
				ExtendAdapterFunction(NewModule)
			end
		end
		local Registry = NewModule._registry
		table.freeze(Registry.inline)
		table.freeze(Registry.block)
		table.freeze(Registry.passes)
		
		return table.freeze(Registry)
	end
}