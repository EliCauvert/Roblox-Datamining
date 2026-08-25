local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local _ = require(parent.HttpClient)
local fStringArgusApiUrlBaseModule = require(dataHydration.Moments.FStringArgusApiUrlBase)

local function _(p0)
	return if p0:sub(#p0) == "/" then p0:sub(1, #p0 - 1) else p0
end

local _ = function(p1)
	return if p1:sub(1, 1) == "/" then p1 else `/{p1}`
end

local _ = function()
	-- upvalues: fStringArgusApiUrlBaseModule (ref)
	local var3 = fStringArgusApiUrlBaseModule()
	
	if var3 == "" then
		return nil
	end
	local var4 = if var3:sub(#var3) == "/" then var3:sub(1, #var3 - 1) else var3
	
	return if var4:match("^https?://") == nil then nil else var4
end

return function(p2)
	-- upvalues: fStringArgusApiUrlBaseModule (ref), httpModule (ref)
	local var6
	assert(type(p2) == "string", "path must be a string")
	local localPlayer = game:GetService("Players").LocalPlayer
	local var5 = fStringArgusApiUrlBaseModule()
	
	if var5 == "" then
		var6 = nil
	else
		local var7 = if var5:sub(#var5) == "/" then var5:sub(1, #var5 - 1) else var5
		var6 = if var7:match("^https?://") == nil then nil else var7
	end
	local var8 = if var6 ~= nil then httpModule.Url.APIS_URL else var6
	local var9 = if var8:sub(#var8) == "/" then var8:sub(1, #var8 - 1) else var8
	local var10 = `{var9}{if p2:sub(1, 1) == "/" then p2 else `/{p2}`}`
	
	if var9 == "https://apis.roblox.com" or localPlayer == nil then
		return var10, nil
	end
	return var10, {
		["robloxctx-authenticated-userid"] = tostring(localPlayer.UserId)
	}
end