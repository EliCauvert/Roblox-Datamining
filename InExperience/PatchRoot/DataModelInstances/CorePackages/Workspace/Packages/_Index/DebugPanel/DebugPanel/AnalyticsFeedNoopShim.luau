local var0 = function() --[[ line: 11 ]] end

local function noopRegister(_) --[[ line: 12 ]]
	-- upvalues: var0 (ref)
	return var0
end

local function noopNotify(_) --[[ line: 15 ]] end

local function noopRule(_) --[[ line: 17 ]]
	return nil
end

local function noopRuleFactory(...) --[[ line: 20 ]]
	-- upvalues: noopRule (ref)
	return noopRule
end

local t = {
	fromEventName = noopRuleFactory,
	fromCtx = noopRuleFactory,
	fromField = noopRuleFactory,
	fromEnum = noopRuleFactory,
	eventNameAsLabel = noopRuleFactory,
	fixed = noopRuleFactory,
	walk = function(_, _) --[[ line: 31 ]]
		return nil
	end
}

local function noopFormatter(_, _, _) --[[ line: 36 ]]
	return nil
end

local t_1 = {
	enumLabel = function(_) --[[ line: 39 ]]
		-- upvalues: noopFormatter (ref)
		return noopFormatter
	end,
	invertEnum = function(_) --[[ line: 45 ]]
		return {}
	end
}

local function noopPreview(_) --[[ line: 50 ]]
	return nil
end

local function noopPreviewFactory(_) --[[ line: 53 ]]
	-- upvalues: noopPreview (ref)
	return noopPreview
end

return {
	register = noopRegister,
	notify = noopNotify,
	Resolvers = t,
	Formatters = t_1,
	Previews = {
		rbxthumb = noopPreviewFactory,
		fromInstance = noopPreviewFactory,
		chain = noopPreviewFactory,
		isPlausibleId = function(_) --[[ line: 61 ]]
			return false
		end
	}
}