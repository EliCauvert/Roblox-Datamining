local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local HttpService = game:GetService("HttpService")

function sortedEncode(Input)
	-- upvalues: Array (copy), Object (copy), HttpService (copy)
	return if Array.isArray(Input) or typeof(Input) ~= "table" then HttpService:JSONEncode(Input) else "{" .. Array.join(Array.map(Array.sort(Object.keys(Input)), function(Input1): string
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONEncode(Input1) .. ":" .. sortedEncode(Input[Input1])
	end), ",") .. "}"
end

return { sortedEncode = sortedEncode }