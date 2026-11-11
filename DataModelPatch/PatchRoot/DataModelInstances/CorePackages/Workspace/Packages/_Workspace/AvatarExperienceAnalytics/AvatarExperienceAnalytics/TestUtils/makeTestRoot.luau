local ReactModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.React)

local function v1(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {}, p1.children)
end

local function createLocalization()
	return {
		Format = function(_, Text): string
			return Text .. "-translated"
		end,
		GetLocale = function(): string
			return "locale"
		end
	}
end

return function(p1)
	-- upvalues: createLocalization (copy), ReactModule (copy), v1 (copy)
	local Localization = (p1 or { localization = nil }).localization or createLocalization()
	
	return function(p2)
		-- upvalues: ReactModule (upval), v1 (upval), Localization (copy)
		return ReactModule.createElement(v1, { localization = Localization }, { TestSubject = p2.children })
	end
end