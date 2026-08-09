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

local function _(p0) --[[ line: 46 | named "createApiResponse" ]]
	-- upvalues: signalsModule (ref), httpService (ref)
	return signalsModule.createComputed(function(p1) --[[ line: 47 ]]
		-- upvalues: p0 (ref), httpService (copy)
		local var6 = p0(p1)
		
		if var6.status == "Success" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var6.response.Body)
			
			return {
				status = if ok then "Success" else "Failed",
				data = if ok then status else nil,
				error = if not ok then "JSON parse error" else nil,
				statusCode = var6.response.StatusCode
			}
		elseif var6.status == "Failed" then
			local response = var6.response
			
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

return {
	GetUserGroupsWithRoles = function(p2) --[[ line: 84 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var7, var8 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetUserGroupsWithRoles_" .. p2, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/roles?includeLocked=true", GROUPS_URL, p2)
		})
		
		return signalsModule.createComputed(function(p3) --[[ line: 47 ]]
			-- upvalues: var7 (ref), httpService (copy)
			local var6 = var7(p3)
			
			if var6.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var6.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var6.response.StatusCode
				}
			elseif var6.status == "Failed" then
				local response = var6.response
				
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
		end), var8
	end,
	GetPrimaryGroupRole = function(p4) --[[ line: 109 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var9, var10 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetPrimaryGroupRole_" .. p4, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/primary/role", GROUPS_URL, p4)
		})
		
		return signalsModule.createComputed(function(p5) --[[ line: 47 ]]
			-- upvalues: var9 (ref), httpService (copy)
			local var6 = var9(p5)
			
			if var6.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var6.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var6.response.StatusCode
				}
			elseif var6.status == "Failed" then
				local response = var6.response
				
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
		end), var10
	end,
	GetGroupPolicies = function(p6) --[[ line: 134 ]]
		-- upvalues: GROUPS_URL (ref), httpService (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref)
		local cloned = table.clone(p6)
		table.sort(cloned)
		local var12, var13 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupPolicies_" .. table.concat(cloned, "_"), {
			Method = "POST",
			Url = string.format("%sv1/groups/policies", GROUPS_URL),
			Body = httpService:JSONEncode({ groupIds = p6 }),
			Headers = { ["Content-Type"] = "application/json" }
		})
		
		return signalsModule.createComputed(function(p7) --[[ line: 47 ]]
			-- upvalues: var12 (ref), httpService (copy)
			local var6 = var12(p7)
			
			if var6.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var6.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var6.response.StatusCode
				}
			elseif var6.status == "Failed" then
				local response = var6.response
				
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
		end), var13
	end,
	GetGroupsMetadata = function() --[[ line: 166 ]]
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local getGroupsMetadata, getGroupsMetadata_1 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupsMetadata", {
			Method = "GET",
			Url = string.format("%sv1/groups/metadata", GROUPS_URL)
		})
		
		return signalsModule.createComputed(function(p8) --[[ line: 47 ]]
			-- upvalues: getGroupsMetadata (ref), httpService (copy)
			local var6 = getGroupsMetadata(p8)
			
			if var6.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var6.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var6.response.StatusCode
				}
			elseif var6.status == "Failed" then
				local response = var6.response
				
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
	end
}