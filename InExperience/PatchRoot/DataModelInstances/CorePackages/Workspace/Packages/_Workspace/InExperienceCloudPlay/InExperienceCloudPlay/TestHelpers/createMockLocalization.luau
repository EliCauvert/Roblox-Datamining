return function()
	return {
		Format = function(_, p1): string
			return `localized:{p1}`
		end,
		GetLocale = function(): string
			return "en-us"
		end,
		changed = {
			connect = function()
				return { disconnect = function() end }
			end
		}
	}
end