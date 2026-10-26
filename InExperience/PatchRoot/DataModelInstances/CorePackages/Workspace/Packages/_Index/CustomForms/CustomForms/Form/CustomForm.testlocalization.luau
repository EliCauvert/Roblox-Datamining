local config = { ["Feature.CustomForms.Label.Percent"] = "{number}%" }

return {
	Format = function(_, p1, p2): string
		-- upvalues: config (copy)
		return (string.gsub(config[p1] or p1, "{(%w+)}", function(Match): string
			-- upvalues: p2 (copy)
			return if p2 and p2[Match] ~= nil then tostring(p2[Match]) else "{" .. Match .. "}"
		end))
	end,
	GetLocale = function(): string
		return "en-us"
	end
}