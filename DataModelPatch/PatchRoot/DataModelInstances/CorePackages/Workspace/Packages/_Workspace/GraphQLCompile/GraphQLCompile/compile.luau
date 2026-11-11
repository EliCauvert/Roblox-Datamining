local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
require(CorePackages.Packages.UIBlox).init({})
local GraphQLModule = require(CorePackages.Workspace.Packages.GraphQL)

local function recursiveToString(Callback, Text): string?
	-- upvalues: recursiveToString (copy)
	if type(Callback) == "function" then
		error("Can't convert function to string")
		
		return
	end
	if type(Callback) ~= "table" then
		return if type(Callback) == "string" then "\"" .. tostring(Callback) .. "\"" else tostring(Callback)
	end
	local Text1 = "" .. "{"
	local Count = 0
	
	for _, value in pairs(Callback) do
		Count += 1
	end
	if Count > 1 then
		Text1 ..= "\n"
	end
	for i, value in pairs(Callback) do
		if type(i) == "string" then
			Text1 ..= "  " .. Text .. tostring(i) .. " = " .. recursiveToString(value, "  " .. Text) .. ",\n"
		end
		if type(i) == "number" then
			Text1 ..= "  " .. Text .. recursiveToString(value, "  " .. Text) .. ",\n"
		end
	end
	if Count > 0 then
		Text1 ..= Text .. "}"
		
		return Text1
	else
		return Text1 .. "}"
	end
end

if game:GetService("ProcessService"):GetCommandLineArgs()[1] == "individual" then
	local Data = HttpService:JSONDecode(require(CorePackages.Workspace.Packages.GraphQLCompile).gqlCompileData())
	
	for _, entry in Data do
		entry.compiled = recursiveToString(GraphQLModule.parse(entry.content, { noLocation = true }), "")
	end
	print((HttpService:JSONEncode(Data)))
else
	print(recursiveToString(GraphQLModule.parse(require(CorePackages.Workspace.Packages.GraphQLServer).generateTypeDefs(), { noLocation = true }), ""))
end
return {}