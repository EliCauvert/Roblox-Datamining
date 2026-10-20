local function v0() end

local function noopRule(_)
	return nil
end

local function noopRuleFactory(...)
	-- upvalues: noopRule (copy)
	return noopRule
end

local function noopFormatter(_, _, _)
	return nil
end

local function noopPreview(_)
	return nil
end

local function noopPreviewFactory(_)
	-- upvalues: noopPreview (copy)
	return noopPreview
end

return {
	register = function(_)
		-- upvalues: v0 (copy)
		return v0
	end,
	notify = function(_) end,
	Resolvers = {
		fromEventName = noopRuleFactory,
		fromCtx = noopRuleFactory,
		fromField = noopRuleFactory,
		fromEnum = noopRuleFactory,
		eventNameAsLabel = noopRuleFactory,
		fixed = noopRuleFactory,
		walk = function(_, _)
			return nil
		end
	},
	Formatters = {
		enumLabel = function(_)
			-- upvalues: noopFormatter (copy)
			return noopFormatter
		end,
		invertEnum = function(_)
			return {}
		end
	},
	Previews = {
		rbxthumb = noopPreviewFactory,
		fromInstance = noopPreviewFactory,
		chain = noopPreviewFactory,
		isPlausibleId = function(_): boolean
			return false
		end
	}
}