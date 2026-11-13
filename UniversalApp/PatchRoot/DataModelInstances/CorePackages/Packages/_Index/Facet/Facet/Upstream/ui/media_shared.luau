local _ = require("./types")
local _ = require("./theme_types")
local _ = require("../vendor/compose/core")
local ThemesModule = require("./themes")

return function(p1)
	-- upvalues: ThemesModule (copy)
	local Runtime = p1.runtime
	local Compose = p1.Compose
	local ThemesModuleResult = ThemesModule(Compose)
	local Types = p1.types
	local ReadFunction = p1.read
	local SharedResources = {}
	
	local function _(Key)
		-- upvalues: SharedResources (copy), Compose (copy), ReadFunction (copy), p1 (copy)
		local SharedResource = SharedResources[Key]
		
		if SharedResource == nil then
			SharedResource = Compose.createSharedResource(function()
				-- upvalues: Compose (upval), ReadFunction (upval), p1 (upval), Key (copy)
				return Compose.formula(function(p2): boolean
					-- upvalues: ReadFunction (upval), p1 (upval), Key (upval)
					local v1 = ReadFunction(p1.config.theme, p2)
					local Chrome = if v1 then v1.chrome else nil
					local ChromeEntry = if Chrome then Chrome[Key] else nil
					
					return ChromeEntry ~= nil and (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil)
				end), nil
			end)
			SharedResources[Key] = SharedResource
		end
		return assert(SharedResource)()
	end
	
	return {
		skin = function(Target, Theme, Key)
			-- upvalues: p1 (copy), Compose (copy), ReadFunction (copy), Types (copy), SharedResources (copy), Runtime (copy), ThemesModuleResult (copy)
			local ThemeFunction = p1.config.theme
			
			if not Compose.isValue(ThemeFunction) and type(ThemeFunction) ~= "function" then
				local ReadResult = ReadFunction(ThemeFunction)
				local ChromeEntry = if ReadResult then (ReadResult.chrome or {})[Theme] else nil
				
				if ChromeEntry == nil or (ChromeEntry.kind == "native" or ChromeEntry.kind == "none") and ChromeEntry.shadow == nil then
					return Target
				end
			end
			local Key1 = Key or {}
			Key1.types = Types
			Key1.target = Target
			local SharedResource = SharedResources[Theme]
			
			if SharedResource == nil then
				SharedResource = Compose.createSharedResource(function()
					-- upvalues: Compose (upval), ReadFunction (upval), p1 (upval), Theme (copy)
					return Compose.formula(function(p2): boolean
						-- upvalues: ReadFunction (upval), p1 (upval), Theme (upval)
						local v1 = ReadFunction(p1.config.theme, p2)
						local Chrome = if v1 then v1.chrome else nil
						local ChromeEntry = if Chrome then Chrome[Theme] else nil
						
						return ChromeEntry ~= nil and (if ChromeEntry.kind == "native" then ChromeEntry.shadow ~= nil else ChromeEntry.kind ~= "none" or ChromeEntry.shadow ~= nil)
					end), nil
				end)
				SharedResources[Theme] = SharedResource
			end
			local v1 = assert(SharedResource)()
			local v2 = false
			Runtime.mountFragment(function()
				-- upvalues: Compose (upval), v2 (ref), v1 (copy), ThemesModuleResult (upval), Runtime (upval), p1 (upval), Theme (copy), Key1 (copy)
				return {
					Compose.show(function(Callback)
						-- upvalues: v2 (upval), v1 (upval)
						v2 = v2 or Callback(v1)
						
						return v2
					end, function()
						-- upvalues: ThemesModuleResult (upval), Runtime (upval), p1 (upval), Theme (upval), Key1 (upval)
						return ThemesModuleResult.skin(Runtime, p1.config.theme, Theme, Key1)
					end)
				}
			end, Target)
			
			return Target
		end,
		bind = function(Callback, p2)
			-- upvalues: Compose (copy), ReadFunction (copy)
			return if Compose.isValue(Callback) then Compose.map(Callback, function(p3)
				-- upvalues: p2 (copy)
				return if p3 == nil then p2 else p3
			end) elseif type(Callback) == "function" then function(p3)
				-- upvalues: ReadFunction (upval), Callback (copy), p2 (copy)
				local ReadResult = ReadFunction(Callback, p3)
				
				return if ReadResult == nil then p2 else ReadResult
			end elseif Callback == nil then p2 else Callback
		end
	}
end