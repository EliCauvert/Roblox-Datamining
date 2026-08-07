local coreGuiService = game:GetService("CoreGui")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local luobuWarningToastComponentModule = require(script.LuobuWarningToastComponent)
local t = {}
t.__index = t

function t.new() --[[ line: 11 ]]
	-- upvalues: t (ref), roactModule (ref), luobuWarningToastComponentModule (ref), coreGuiService (ref)
	local tbl = setmetatable({}, t)
	tbl.element = roactModule.createElement(luobuWarningToastComponentModule)
	tbl.root = roactModule.mount(tbl.element, coreGuiService, "LuobuWarningToast")
	task.delay(10, function() --[[ line: 18 ]]
		-- upvalues: roactModule (copy), tbl (ref)
		roactModule.unmount(tbl.root)
	end)
	
	return tbl
end

return t.new()