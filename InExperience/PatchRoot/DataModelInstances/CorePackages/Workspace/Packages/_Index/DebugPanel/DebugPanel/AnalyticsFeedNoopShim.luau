local function v0() --[[ Line: 11 ]] end

local function noopRule(_) --[[ Line: 17 ]]
	return nil
end

local function noopRuleFactory(...) --[[ Line: 20 ]]
	-- upvalues: noopRule (copy)
	return noopRule
end

local function noopFormatter(_, _, _) --[[ Line: 36 ]]
	return nil
end

local function noopPreview(_) --[[ Line: 50 ]]
	return nil
end

local function noopPreviewFactory(_) --[[ Line: 53 ]]
	-- upvalues: noopPreview (copy)
	return noopPreview
end

return {
	register = function(_) --[[ Line: 12 ]]
		-- upvalues: v0 (copy)
		return v0
	end,
	notify = function(_) --[[ Line: 15 ]] end,
	Resolvers = {
		fromEventName = noopRuleFactory,
		fromCtx = noopRuleFactory,
		fromField = noopRuleFactory,
		fromEnum = noopRuleFactory,
		eventNameAsLabel = noopRuleFactory,
		fixed = noopRuleFactory,
		walk = function(_, _) --[[ Line: 31 ]]
			return nil
		end
	},
	Formatters = {
		enumLabel = function(_) --[[ Line: 39 ]]
			-- upvalues: noopFormatter (copy)
			return noopFormatter
		end,
		invertEnum = function(_) --[[ Line: 45 ]]
			return {}
		end
	},
	Previews = {
		rbxthumb = noopPreviewFactory,
		fromInstance = noopPreviewFactory,
		chain = noopPreviewFactory,
		isPlausibleId = function(_): boolean --[[ Line: 61 ]]
			return false
		end
	}
}