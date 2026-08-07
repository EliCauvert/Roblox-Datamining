local httpService = game:GetService("HttpService")
local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local signalsModule = require(parent.Signals)
local httpStoreModule = require(parent.HttpStore)
local httpModule = require(parent.Http)
local _ = require(groups.Common.Types)
local fFlagLuaAppUseAppHttpStore = require(parent.SharedFlags).FFlagLuaAppUseAppHttpStore
local internalHttpStoreModule = require(parent.InternalHttpStore)
local GROUPS_URL = httpModule.Url.GROUPS_URL
local t = {
	GetUserGroupsWithRoles = function(p0) --[[ line: 86 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var8, var9 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetUserGroupsWithRoles_" .. p0, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/roles?includeLocked=true", GROUPS_URL, p0)
		})
		
		return signalsModule.createComputed(function(p1) --[[ line: 49 ]]
			-- upvalues: var8 (ref), httpService (copy)
			local var10 = var8(p1)
			
			if var10.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var10.response.StatusCode
				}
			elseif var10.status == "Failed" then
				local response = var10.response
				
				return {
					status = "Failed",
					data = nil,
					error = if response then response.ErrorMessage else "Request failed",
					statusCode = if response then response.StatusCode else nil
				}
			end
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end), var9
	end,
	GetPrimaryGroupRole = function(p2) --[[ line: 111 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var11, var12 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetPrimaryGroupRole_" .. p2, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/primary/role", GROUPS_URL, p2)
		})
		
		return signalsModule.createComputed(function(p3) --[[ line: 49 ]]
			-- upvalues: var11 (ref), httpService (copy)
			local var10 = var11(p3)
			
			if var10.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var10.response.StatusCode
				}
			elseif var10.status == "Failed" then
				local response = var10.response
				
				return {
					status = "Failed",
					data = nil,
					error = if response then response.ErrorMessage else "Request failed",
					statusCode = if response then response.StatusCode else nil
				}
			end
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end), var12
	end,
	GetGroupPolicies = function(p4) --[[ line: 136 ]]
		-- upvalues: GROUPS_URL (ref), httpService (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref)
		local cloned = table.clone(p4)
		table.sort(cloned)
		local var14, var15 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupPolicies_" .. table.concat(cloned, "_"), {
			Method = "POST",
			Url = string.format("%sv1/groups/policies", GROUPS_URL),
			Body = httpService:JSONEncode({ groupIds = p4 }),
			Headers = { ["Content-Type"] = "application/json" }
		})
		
		return signalsModule.createComputed(function(p5) --[[ line: 49 ]]
			-- upvalues: var14 (ref), httpService (copy)
			local var10 = var14(p5)
			
			if var10.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var10.response.StatusCode
				}
			elseif var10.status == "Failed" then
				local response = var10.response
				
				return {
					status = "Failed",
					data = nil,
					error = if response then response.ErrorMessage else "Request failed",
					statusCode = if response then response.StatusCode else nil
				}
			end
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end), var15
	end,
	GetGroupsMetadata = function() --[[ line: 168 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local getGroupsMetadata, getGroupsMetadata_1 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupsMetadata", {
			Method = "GET",
			Url = string.format("%sv1/groups/metadata", GROUPS_URL)
		})
		
		return signalsModule.createComputed(function(p6) --[[ line: 49 ]]
			-- upvalues: getGroupsMetadata (ref), httpService (copy)
			local var10 = getGroupsMetadata(p6)
			
			if var10.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var10.response.StatusCode
				}
			elseif var10.status == "Failed" then
				local response = var10.response
				
				return {
					status = "Failed",
					data = nil,
					error = if response then response.ErrorMessage else "Request failed",
					statusCode = if response then response.StatusCode else nil
				}
			end
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end), getGroupsMetadata_1
	end,
	GetGroupRoles = function(p7) --[[ line: 184 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var18, var19 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupRoles_" .. p7, {
			Method = "GET",
			Url = string.format("%sv1/groups/%s/roles", GROUPS_URL, p7)
		})
		
		return signalsModule.createComputed(function(p8) --[[ line: 49 ]]
			-- upvalues: var18 (ref), httpService (copy)
			local var10 = var18(p8)
			
			if var10.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var10.response.StatusCode
				}
			elseif var10.status == "Failed" then
				local response = var10.response
				
				return {
					status = "Failed",
					data = nil,
					error = if response then response.ErrorMessage else "Request failed",
					statusCode = if response then response.StatusCode else nil
				}
			end
			return {
				status = "Loading",
				data = nil,
				error = nil,
				statusCode = nil
			}
		end), var19
	end
}

local function _(p9) --[[ line: 48 | named "createApiResponse" ]]
	-- upvalues: signalsModule (ref), httpService (ref)
	return signalsModule.createComputed(function(p10) --[[ line: 49 ]]
		-- upvalues: p9 (ref), httpService (copy)
		local var10 = p9(p10)
		
		if var10.status == "Success" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
			
			return {
				status = if ok then "Success" else "Failed",
				data = if ok then status else nil,
				error = if not ok then "JSON parse error" else nil,
				statusCode = var10.response.StatusCode
			}
		elseif var10.status == "Failed" then
			local response = var10.response
			
			return {
				status = "Failed",
				data = nil,
				error = if response then response.ErrorMessage else "Request failed",
				statusCode = if response then response.StatusCode else nil
			}
		end
		return {
			status = "Loading",
			data = nil,
			error = nil,
			statusCode = nil
		}
	end)
end

local function fetchGet(p11, p12) --[[ line: 200 ]]
	-- upvalues: internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
	local var20, var21 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch(p11, { Method = "GET", Url = p12 })
	
	return signalsModule.createComputed(function(p13) --[[ line: 49 ]]
		-- upvalues: var20 (ref), httpService (copy)
		local var10 = var20(p13)
		
		if var10.status == "Success" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var10.response.Body)
			
			return {
				status = if ok then "Success" else "Failed",
				data = if ok then status else nil,
				error = if not ok then "JSON parse error" else nil,
				statusCode = var10.response.StatusCode
			}
		elseif var10.status == "Failed" then
			local response = var10.response
			
			return {
				status = "Failed",
				data = nil,
				error = if response then response.ErrorMessage else "Request failed",
				statusCode = if response then response.StatusCode else nil
			}
		end
		return {
			status = "Loading",
			data = nil,
			error = nil,
			statusCode = nil
		}
	end), var21
end

function t.GetGroupMembers(p14, p15, p16) --[[ line: 215 ]]
	-- upvalues: GROUPS_URL (ref), httpService (ref), fetchGet (ref)
	p16 = p16 or 100
	local text = "GetGroupMembers_" .. p14 .. "_" .. (p15 or "") .. "_" .. tostring(p16)
	local formattedText = string.format("%sv1/groups/%s/users?sortOrder=Asc&limit=%d", GROUPS_URL, p14, p16)
	
	if p15 then
		formattedText ..= "&cursor=" .. httpService:UrlEncode(p15)
	end
	return fetchGet(text, formattedText)
end

function t.GetGroupRoleMembers(p17, p18, p19, p20) --[[ line: 230 ]]
	-- upvalues: GROUPS_URL (ref), httpService (ref), fetchGet (ref)
	p20 = p20 or 100
	local text = "GetGroupRoleMembers_" .. p17 .. "_" .. tostring(p18) .. "_" .. (p19 or "") .. "_" .. tostring(p20)
	local formattedText = string.format("%sv1/groups/%s/roles/%d/users?sortOrder=Asc&limit=%d", GROUPS_URL, p17, p18, p20)
	
	if p19 then
		formattedText ..= "&cursor=" .. httpService:UrlEncode(p19)
	end
	return fetchGet(text, formattedText)
end

return t