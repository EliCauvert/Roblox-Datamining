local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local _ = require(Parent.HttpClient)
local FStringArgusApiUrlBaseModule = require(DataHydration.Moments.FStringArgusApiUrlBase)

local function _(Text: string): string --[[ Line: 14 | Named "normalizeBaseUrl" ]]
	return if Text:sub(#Text) == "/" then Text:sub(1, #Text - 1) else Text
end

local _ = function(Text: string): string --[[ Line: 22 | Named "normalizePath" ]]
	return if Text:sub(1, 1) == "/" then Text else `/{Text}`
end

local _ = function() --[[ Line: 30 | Named "getFStringApiUrlBase" ]]
	-- upvalues: FStringArgusApiUrlBaseModule (copy)
	local FStringArgusApiUrlBaseModuleResult: string = FStringArgusApiUrlBaseModule()
	
	if FStringArgusApiUrlBaseModuleResult == "" then
		return nil
	else
		local Segment = if FStringArgusApiUrlBaseModuleResult:sub(#FStringArgusApiUrlBaseModuleResult) == "/" then FStringArgusApiUrlBaseModuleResult:sub(1, #FStringArgusApiUrlBaseModuleResult - 1) else FStringArgusApiUrlBaseModuleResult
		
		return if Segment:match("^https?://") == nil then nil else Segment
	end
end

return function(Text: string) --[[ Line: 44 | Named "constructApiUrl" ]]
	-- upvalues: FStringArgusApiUrlBaseModule (copy), HttpModule (copy)
	assert(type(Text) == "string", "path must be a string")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local FStringArgusApiUrlBaseModuleResult: string = FStringArgusApiUrlBaseModule()
	local v1 = nil
	
	if FStringArgusApiUrlBaseModuleResult == "" then
		v1 = nil
	else
		local Segment = if FStringArgusApiUrlBaseModuleResult:sub(#FStringArgusApiUrlBaseModuleResult) == "/" then FStringArgusApiUrlBaseModuleResult:sub(1, #FStringArgusApiUrlBaseModuleResult - 1) else FStringArgusApiUrlBaseModuleResult
		v1 = if Segment:match("^https?://") == nil then nil else Segment
	end
	local APISURL = if v1 == nil then HttpModule.Url.APIS_URL else v1
	local Segment = if APISURL:sub(#APISURL) == "/" then APISURL:sub(1, #APISURL - 1) else APISURL
	local Text1: string = `{Segment}{if Text:sub(1, 1) == "/" then Text else `/{Text}`}`
	
	if Segment == "https://apis.roblox.com" or LocalPlayer == nil then
		return Text1, nil
	else
		return Text1, {
			["robloxctx-authenticated-userid"] = tostring(LocalPlayer.UserId)
		}
	end
end