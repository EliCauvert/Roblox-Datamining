local InspectFunction = require(script.Parent.Parent.Collections).inspect

return function()
	-- upvalues: InspectFunction (copy)
	local Count = 0
	
	local function _(): string
		-- upvalues: Count (ref)
		return string.rep("  ", Count)
	end
	
	return {
		log = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		debug = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		info = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		warn = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			warn(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		error = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			warn(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		group = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
			Count += 1
		end,
		groupCollapsed = function(Template: string, ...)
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
			Count += 1
		end,
		groupEnd = function()
			-- upvalues: Count (ref)
			if Count > 0 then
				Count -= 1
			end
		end
	}
end