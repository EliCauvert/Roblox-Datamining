local HttpService = game:GetService("HttpService")
local Json = HttpService:JSONEncode((require(script.Parent.null)))

return function(Input) --[[ Line: 5 | Named "stringify" ]]
	-- upvalues: HttpService (copy), Json (copy)
	return (HttpService:JSONEncode(Input):gsub(Json, "null"))
end