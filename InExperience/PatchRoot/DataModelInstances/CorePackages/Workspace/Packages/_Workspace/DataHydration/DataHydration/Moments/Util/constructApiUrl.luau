local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local _ = require(parent.HttpClient)
local fStringArgusApiUrlBaseModule = require(dataHydration.Moments.FStringArgusApiUrlBase)

local function _(p1)
	return if p1:sub(#p1) == "/" then p1:sub(1, #p1 - 1) else p1
end

local _ = function(p1)
	return if p1:sub(1, 1) == "/" then p1 else `/{p1}`
end

local _ = function()
	-- upvalues: fStringArgusApiUrlBaseModule (ref)
	local var1 = fStringArgusApiUrlBaseModule()
	
	if var1 == "" then
		return nil
	end
	local var2 = if var1:sub(#var1) == "/" then var1:sub(1, #var1 - 1) else var1
	
	return if var2:match("^https?://") == nil then nil else var2
end

return function(p1)
	-- upvalues: fStringArgusApiUrlBaseModule (ref), httpModule (ref)
	local var1
	assert(type(p1) == "string", "path must be a string")
	local localPlayer = game:GetService("Players").LocalPlayer
	local var2 = fStringArgusApiUrlBaseModule()
	
	if var2 == "" then
		var1 = nil
	else
		local var3 = if var2:sub(#var2) == "/" then var2:sub(1, #var2 - 1) else var2
		var1 = if var3:match("^https?://") == nil then nil else var3
	end
	local var4 = if var1 ~= nil then httpModule.Url.APIS_URL else var1
	local var5 = if var4:sub(#var4) == "/" then var4:sub(1, #var4 - 1) else var4
	local var6 = `{var5}{if p1:sub(1, 1) == "/" then p1 else `/{p1}`}`
	
	if var5 == "https://apis.roblox.com" or localPlayer == nil then
		return var6, nil
	end
	return var6, {
		["robloxctx-authenticated-userid"] = tostring(localPlayer.UserId)
	}
end