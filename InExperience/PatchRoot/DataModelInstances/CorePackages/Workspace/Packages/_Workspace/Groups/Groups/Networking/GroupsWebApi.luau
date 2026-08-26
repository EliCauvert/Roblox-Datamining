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
	GetUserGroupsWithRoles = function(p1)
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var1, var2 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetUserGroupsWithRoles_" .. p0, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/roles?includeLocked=true", GROUPS_URL, p1)
		})
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (ref), httpService (copy)
			local var3 = var1(p2)
			
			if var3.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var3.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var3.response.StatusCode
				}
			elseif var3.status == "Failed" then
				local response = var3.response
				
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
		end), var2
	end,
	GetPrimaryGroupRole = function(p1)
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var1, var2 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetPrimaryGroupRole_" .. p2, {
			Method = "GET",
			Url = string.format("%sv1/users/%s/groups/primary/role", GROUPS_URL, p1)
		})
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (ref), httpService (copy)
			local var3 = var1(p2)
			
			if var3.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var3.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var3.response.StatusCode
				}
			elseif var3.status == "Failed" then
				local response = var3.response
				
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
		end), var2
	end,
	GetGroupPolicies = function(p1)
		-- upvalues: GROUPS_URL (ref), httpService (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref)
		local cloned = table.clone(p1)
		table.sort(cloned)
		local var1, var2 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupPolicies_" .. table.concat(cloned, "_"), {
			Method = "POST",
			Url = string.format("%sv1/groups/policies", GROUPS_URL),
			Body = httpService:JSONEncode({ groupIds = p1 }),
			Headers = { ["Content-Type"] = "application/json" }
		})
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (ref), httpService (copy)
			local var3 = var1(p2)
			
			if var3.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var3.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var3.response.StatusCode
				}
			elseif var3.status == "Failed" then
				local response = var3.response
				
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
		end), var2
	end,
	GetGroupsMetadata = function()
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local getGroupsMetadata, getGroupsMetadata_1 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupsMetadata", {
			Method = "GET",
			Url = string.format("%sv1/groups/metadata", GROUPS_URL)
		})
		
		return signalsModule.createComputed(function(p1)
			-- upvalues: getGroupsMetadata (ref), httpService (copy)
			local var1 = getGroupsMetadata(p1)
			
			if var1.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var1.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var1.response.StatusCode
				}
			elseif var1.status == "Failed" then
				local response = var1.response
				
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
	GetGroupRoles = function(p1)
		-- upvalues: GROUPS_URL (ref), internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
		local var1, var2 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch("GetGroupRoles_" .. p7, {
			Method = "GET",
			Url = string.format("%sv1/groups/%s/roles", GROUPS_URL, p1)
		})
		
		return signalsModule.createComputed(function(p2)
			-- upvalues: var1 (ref), httpService (copy)
			local var3 = var1(p2)
			
			if var3.status == "Success" then
				local ok, status = pcall(httpService.JSONDecode, httpService, var3.response.Body)
				
				return {
					status = if ok then "Success" else "Failed",
					data = if ok then status else nil,
					error = if not ok then "JSON parse error" else nil,
					statusCode = var3.response.StatusCode
				}
			elseif var3.status == "Failed" then
				local response = var3.response
				
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
		end), var2
	end
}

local function _(p1)
	-- upvalues: signalsModule (ref), httpService (ref)
	return signalsModule.createComputed(function(p2)
		-- upvalues: p1 (ref), httpService (copy)
		local var1 = p1(p2)
		
		if var1.status == "Success" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var1.response.Body)
			
			return {
				status = if ok then "Success" else "Failed",
				data = if ok then status else nil,
				error = if not ok then "JSON parse error" else nil,
				statusCode = var1.response.StatusCode
			}
		elseif var1.status == "Failed" then
			local response = var1.response
			
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

local function fetchGet(p1, p2)
	-- upvalues: internalHttpStoreModule (ref), fFlagLuaAppUseAppHttpStore (ref), httpStoreModule (ref), signalsModule (ref), httpService (ref)
	local var1, var2 = (if fFlagLuaAppUseAppHttpStore then httpStoreModule.Instance.get() else internalHttpStoreModule.GetHttpStore()).fetch(p1, { Method = "GET", Url = p2 })
	
	return signalsModule.createComputed(function(p3)
		-- upvalues: var1 (ref), httpService (copy)
		local var3 = var1(p3)
		
		if var3.status == "Success" then
			local ok, status = pcall(httpService.JSONDecode, httpService, var3.response.Body)
			
			return {
				status = if ok then "Success" else "Failed",
				data = if ok then status else nil,
				error = if not ok then "JSON parse error" else nil,
				statusCode = var3.response.StatusCode
			}
		elseif var3.status == "Failed" then
			local response = var3.response
			
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
	end), var2
end

function t.GetGroupMembers(p1, p2, p3)
	-- upvalues: GROUPS_URL (ref), httpService (ref), fetchGet (ref)
	p3 = p3 or 100
	local text = "GetGroupMembers_" .. p14 .. "_" .. (p2 or "") .. "_" .. tostring(p3)
	local formattedText = string.format("%sv2/groups/%s/users?sortOrder=Asc&limit=%d", GROUPS_URL, p1, p3)
	
	if p2 then
		formattedText ..= "&cursor=" .. httpService:UrlEncode(p2)
	end
	return fetchGet(text, formattedText)
end

function t.GetGroupRoleMembers(p1, p2, p3, p4)
	-- upvalues: GROUPS_URL (ref), httpService (ref), fetchGet (ref)
	p4 = p4 or 100
	local text = "GetGroupRoleMembers_" .. p17 .. "_" .. tostring(p2) .. "_" .. (p3 or "") .. "_" .. tostring(p4)
	local formattedText = string.format("%sv2/groups/%s/users?roleSetId=%d&sortOrder=Asc&limit=%d", GROUPS_URL, p1, p2, p4)
	
	if p3 then
		formattedText ..= "&cursor=" .. httpService:UrlEncode(p3)
	end
	return fetchGet(text, formattedText)
end

return t