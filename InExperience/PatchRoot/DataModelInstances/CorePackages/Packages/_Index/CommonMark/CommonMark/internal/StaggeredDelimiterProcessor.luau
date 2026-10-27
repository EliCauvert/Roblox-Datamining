local CommonMark = script:FindFirstAncestor("CommonMark")
local _ = require(CommonMark.parser.delimiter.DelimiterProcessor)
local _ = require(CommonMark.parser.delimiter.DelimiterRun)
local StaggeredDelimiterProcessorModule = {}
StaggeredDelimiterProcessorModule.__index = StaggeredDelimiterProcessorModule

function StaggeredDelimiterProcessorModule.new(_delim)
	-- upvalues: StaggeredDelimiterProcessorModule (copy)
	return (setmetatable({
		_minLength = 0,
		_rejectsByMultipleOf3Rule = false,
		_delim = _delim,
		_processors = {}
	}, StaggeredDelimiterProcessorModule))
end

function StaggeredDelimiterProcessorModule:getOpeningCharacter()
	return self._delim
end

function StaggeredDelimiterProcessorModule:getClosingCharacter()
	return self._delim
end

function StaggeredDelimiterProcessorModule:getMinLength()
	return self._minLength
end

function StaggeredDelimiterProcessorModule:add(p1)
	local MinLength = p1:getMinLength()
	local Flag = false
	
	for i, processor in ipairs(self._processors) do
		local MinLength1 = processor:getMinLength()
		
		if MinLength1 < MinLength then
			table.insert(self._processors, i, p1)
			Flag = true
			break
		elseif MinLength == MinLength1 then
			error(`Cannot add two delimiter processors for char '{string.char(self._delim)}' and minimum length {MinLength}; ` .. `conflicting processors: {tostring(processor)}, {tostring(p1)}`)
		end
	end
	if not Flag then
		table.insert(self._processors, p1)
		self._minLength = MinLength
	end
	local _rejectsByMultipleOf3Rule = true
	
	for _, processor1 in ipairs(self._processors) do
		if processor1._rejectsByMultipleOf3Rule ~= true then
			_rejectsByMultipleOf3Rule = false
		end
	end
	self._rejectsByMultipleOf3Rule = _rejectsByMultipleOf3Rule
end

function StaggeredDelimiterProcessorModule:findProcessor(LengthResult)
	for _, processor in ipairs(self._processors) do
		if processor:getMinLength() <= LengthResult then
			return processor
		end
	end
	return self._processors[1]
end

function StaggeredDelimiterProcessorModule:process(p2, p3)
	return self:findProcessor(p2:length()):process(p2, p3)
end

return StaggeredDelimiterProcessorModule