local _ = require(script:FindFirstAncestor("Markdown").Parent.CommonMark)
local FormattingTagModule = require(script.Parent.FormattingTag)
local TAGS = FormattingTagModule.TAGS
local FormattingTagPostProcessorModule = {}
FormattingTagPostProcessorModule.__index = FormattingTagPostProcessorModule

function FormattingTagPostProcessorModule.new(_maxNesting)
	-- upvalues: FormattingTagPostProcessorModule (copy)
	return (setmetatable({ _maxNesting = _maxNesting }, FormattingTagPostProcessorModule))
end

local function _(p1)
	-- upvalues: TAGS (copy)
	return if p1.kind == "FormattingTagText" or p1.kind == "HtmlInline" then TAGS[p1.literal] else nil
end

local function containersTopDown(p1)
	local List = {}
	local config = { [p1] = 0 }
	local List1 = { p1 }
	while #List1 > 0 do
		local Removed = table.remove(List1)
		
		if Removed:getFirstChild() == nil then continue end
		table.insert(List, Removed)
		local FirstChild = Removed:getFirstChild()
		while FirstChild do
			config[FirstChild] = config[Removed] + (if FirstChild.isBlock then 0 else 1)
			table.insert(List1, FirstChild)
			FirstChild = FirstChild:getNext()
		end
	end
	return List, config
end

local function wrap(p2, Next, MaxNesting, p3, p4): boolean
	-- upvalues: FormattingTagModule (copy)
	local Largest = 0
	local Next1 = p2:getNext()
	while Next1 ~= Next do
		Largest = math.max(Largest, p3[Next1] or 0)
		Next1 = Next1:getNext()
	end
	if p4 ~= nil and p4 <= Largest then
		return false
	end
	local NewFormattingTag = FormattingTagModule.new(MaxNesting)
	p2:insertBefore(NewFormattingTag)
	local Next2 = p2:getNext()
	while Next2 ~= Next do
		local Next3 = Next2:getNext()
		NewFormattingTag:appendChild(Next2)
		Next2 = Next3
	end
	p2:unlink()
	Next:unlink()
	p3[NewFormattingTag] = Largest + 1
	
	return true
end

local function pairChildren(p5, p6, p7)
	-- upvalues: TAGS (copy), wrap (copy)
	local FirstChilds = {}
	local List1 = {}
	local config = { b = {}, i = {}, u = {}, s = {} }
	local FirstChild = p5:getFirstChild()
	while FirstChild ~= nil do
		local Next = FirstChild:getNext()
		local TAG = if FirstChild.kind == "FormattingTagText" or FirstChild.kind == "HtmlInline" then TAGS[FirstChild.literal] else nil
		
		if TAG ~= nil then
			local List = config[TAG.name]
			
			if TAG.closing then
				local Entry = List[#List]
				
				if Entry ~= nil then
					local FirstChild1 = FirstChilds[Entry]
					
					for i = #FirstChilds, Entry, -1 do
						table.remove(config[List1[i]])
						FirstChilds[i] = nil
						List1[i] = nil
					end
					if not wrap(FirstChild1, FirstChild, TAG.name, p6, p7) then
						for i1 = #FirstChilds, 1, -1 do
							table.remove(config[List1[i1]])
							FirstChilds[i1] = nil
							List1[i1] = nil
						end
					end
				end
			else
				table.insert(FirstChilds, FirstChild)
				table.insert(List1, TAG.name)
				table.insert(List, #FirstChilds)
			end
		end
		FirstChild = Next
	end
end

function FormattingTagPostProcessorModule:process(p8)
	-- upvalues: containersTopDown (copy), pairChildren (copy)
	local t = {}
	local ContainersTopDownResult, ContainersTopDownResult2 = containersTopDown(p8)
	local MaxNesting = self._maxNesting
	
	for i = #ContainersTopDownResult, 1, -1 do
		local ContainersTopDownResultEntry = ContainersTopDownResult[i]
		pairChildren(ContainersTopDownResultEntry, t, if MaxNesting == nil then nil else MaxNesting - ContainersTopDownResult2[ContainersTopDownResultEntry])
		
		if not ContainersTopDownResultEntry.isBlock then
			local Largest = 0
			local FirstChild = ContainersTopDownResultEntry:getFirstChild()
			while FirstChild ~= nil do
				Largest = math.max(Largest, t[FirstChild] or 0)
				FirstChild = FirstChild:getNext()
			end
			t[ContainersTopDownResultEntry] = Largest + 1
		end
	end
	return p8
end

return FormattingTagPostProcessorModule