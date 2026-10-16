local InspectFunction = require(script.Parent.Parent.Collections).inspect

return function() --[[ Line: 22 ]]
	-- upvalues: InspectFunction (copy)
	local Count = 0
	
	local function _(): string --[[ Line: 26 | Named "indent" ]]
		-- upvalues: Count (ref)
		return string.rep("  ", Count)
	end
	
	return {
		log = function(Template: string, ...) --[[ Line: 30 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		debug = function(Template: string, ...) --[[ Line: 40 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		info = function(Template: string, ...) --[[ Line: 50 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		warn = function(Template: string, ...) --[[ Line: 60 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			warn(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		error = function(Template: string, ...) --[[ Line: 70 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			warn(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
		end,
		group = function(Template: string, ...) --[[ Line: 82 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
			Count += 1
		end,
		groupCollapsed = function(Template: string, ...) --[[ Line: 93 ]]
			-- upvalues: InspectFunction (upval), Count (ref)
			print(string.rep("  ", Count) .. (if typeof(Template) == "string" then string.format(Template, ...) else InspectFunction(Template)))
			Count += 1
		end,
		groupEnd = function() --[[ Line: 105 ]]
			-- upvalues: Count (ref)
			if Count > 0 then
				Count -= 1
			end
		end
	}
end