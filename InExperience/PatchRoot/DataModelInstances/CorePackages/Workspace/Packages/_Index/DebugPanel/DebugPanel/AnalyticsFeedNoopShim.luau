local var1 = function() end

local function noopRegister(_)
	-- upvalues: var1 (ref)
	return var1
end

local function noopNotify(_) end

local function noopRule(_)
	return nil
end

local function noopRuleFactory(...)
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
	walk = function(_, _)
		return nil
	end
}

local function noopFormatter(_, _, _)
	return nil
end

local t_1 = {
	enumLabel = function(_)
		-- upvalues: noopFormatter (ref)
		return noopFormatter
	end,
	invertEnum = function(_)
		return {}
	end
}

local function noopPreview(_)
	return nil
end

local function noopPreviewFactory(_)
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
		isPlausibleId = function(_)
			return false
		end
	}
}