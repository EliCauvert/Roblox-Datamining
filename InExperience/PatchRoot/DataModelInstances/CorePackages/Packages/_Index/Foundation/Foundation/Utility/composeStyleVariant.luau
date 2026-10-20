local Foundation = script:FindFirstAncestor("Foundation")
local DashModule = require(Foundation.Parent.Dash)
local _ = require(Foundation.Components.Types)

local function _(p1)
	return if type(p1) == "string" then { [p1] = true } else p1
end

local function mergeTags(Tag, Tag1)
	-- upvalues: DashModule (copy)
	return if Tag then if Tag1 then if type(Tag) == "table" or type(Tag1) == "table" then DashModule.join(if type(Tag) == "string" then { [Tag] = true } else Tag, if type(Tag1) == "string" then { [Tag1] = true } else Tag1) else `{Tag} {Tag1}` else Tag else Tag1
end

local _ = function(p1, p2)
	-- upvalues: DashModule (copy), mergeTags (copy)
	local JoinResult = DashModule.join(p1, p2)
	JoinResult.tag = mergeTags(p1.tag, p2.tag)
	
	return JoinResult
end

function composeStyleVariant(p1, ...)
	-- upvalues: DashModule (copy), mergeTags (copy)
	local CopyResult = DashModule.copy(p1)
	DashModule.forEachArgs(function(List)
		-- upvalues: CopyResult (copy), DashModule (upval), mergeTags (upval)
		if List == nil then return end
		for i, value in List do
			local CopyResultEntry = CopyResult[i] or {}
			local JoinResult = DashModule.join(CopyResultEntry, value)
			JoinResult.tag = mergeTags(CopyResultEntry.tag, value.tag)
			CopyResult[i] = JoinResult
		end
	end, ...)
	
	return CopyResult
end

return composeStyleVariant